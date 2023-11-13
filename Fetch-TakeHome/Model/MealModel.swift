//
//  MealModel.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import Foundation

struct MealModel: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable, Identifiable {
    let idMeal: String
    let strMeal: String?
    
    var id: String {
        return idMeal
    }
}

struct MealAPIService: MealAPIServiceProtocol {
    func fetchMeals(completion: @escaping (MealModel) -> Void) {
        // Call the fetchData() method to fetch data from the API endpoint
        fetchMealData { meals in
            // Call the completion handler with the transformed data
            completion(MealModel(meals: meals))
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

protocol MealAPIServiceProtocol {
    func fetchMeals(completion: @escaping (MealModel) -> Void)
}
