//
//  MealDetailsViewModel.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import Foundation

struct MealDetailsAPIService: MealDetailsAPIServiceProtocol {
    func fetchMealDetails(mealID: String, completion: @escaping (MealDetailsModel) -> Void) {
        // Call the fetchData() method to fetch data from the API endpoint
        fetchData(mealID: mealID) { meals in
            // Call the completion handler with the transformed data
            completion(MealDetailsModel(meals: meals))
        }
    }
    
    private func fetchData(mealID: String, completion: @escaping ([MealDetails]) -> Void) {
        // create a URL object for the API endpoint you want to fetch
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)") else {
            print("Invalid URL")
            return
        }
        
        // create a URL session
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(MealDetailsModel.self, from: data)
                    // Call the completion handler with the fetched and cleaned data
                    completion(response.meals)
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}

class MealDetailsViewModel: ObservableObject {
    @Published var mealDetails: [MealDetails] = []
    let apiService: MealDetailsAPIServiceProtocol
    
    init(apiService: MealDetailsAPIServiceProtocol = MealDetailsAPIService()) {
        self.apiService = apiService
    }
    
    //Fetch the meal details from the API using the API Service
    func fetchMealDetails(mealID: String) {
        apiService.fetchMealDetails(mealID: mealID) { [weak self] mealModels in
            // Transform the data to an array of Meal objects
            DispatchQueue.main.async {
                self?.mealDetails = mealModels.meals
            }
        }
    }
}


// Define a protocol for API service
protocol MealDetailsAPIServiceProtocol {
    func fetchMealDetails(mealID: String, completion: @escaping (MealDetailsModel) -> Void)
}
