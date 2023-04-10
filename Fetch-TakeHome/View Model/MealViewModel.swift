//
//  MealViewModel.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import Foundation

struct MealAPIService: MealAPIServiceProtocol {
    func fetchMeals(completion: @escaping ([MealModel]) -> Void) {
        // Call the fetchData() method to fetch data from the API endpoint
        fetchData { meals in
            // Transform the data to an array of MealModel objects
            let mealModels = meals.map { MealModel(meals: [$0]) }
            // Call the completion handler with the transformed data
            completion(mealModels)
        }
    }
    
    private func fetchData(completion: @escaping ([Meal]) -> Void) {
        // create a URL object for the API endpoint you want to fetch
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            print("Invalid URL")
            return
        }
        
        // create a URL session
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(MealModel.self, from: data)
                    // Call the completion handler with the fetched and cleaned data
                    completion(response.meals)
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    let apiService: MealAPIServiceProtocol
    
    init(apiService: MealAPIServiceProtocol = MealAPIService()) {
        self.apiService = apiService
    }
    
    func fetchMeals() {
        apiService.fetchMeals { [weak self] mealModels in
            // Transform the data to an array of Meal objects
            let meals = mealModels.flatMap { $0.meals }
            // Sort the data by the meal name
            let sortedMeals = meals.sorted(by: { $0.strMeal! < $1.strMeal! })
            // Update the view model with the sorted data
            DispatchQueue.main.async {
                self?.meals = sortedMeals
            }
        }
    }
}


// Define a protocol for API service
protocol MealAPIServiceProtocol {
    func fetchMeals(completion: @escaping ([MealModel]) -> Void)
}
