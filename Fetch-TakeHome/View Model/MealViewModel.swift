//
//  MealViewModel.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import Foundation

struct MealAPIService: MealAPIServiceProtocol {
    func fetchMeals(completion: @escaping (MealModel) -> Void) {
        // Call the fetchData() method to fetch data from the API endpoint
        fetchMealData { meals in
            // Sort the data by the meal name
            let sortedMeals = meals.sorted(by: { $0.strMeal! < $1.strMeal! })
            // Call the completion handler with the transformed data
            completion(MealModel(meals: sortedMeals))
        }
    }
    
    private func fetchMealData(completion: @escaping ([Meal]) -> Void) {
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
    
    //Fetch the meals from the API using the API Service
    func fetchMeals() {
        apiService.fetchMeals { [weak self] mealModel in
            DispatchQueue.main.async {
                self?.meals = mealModel.meals
            }
        }
    }
}

protocol MealAPIServiceProtocol {
    func fetchMeals(completion: @escaping (MealModel) -> Void)
}
