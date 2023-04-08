//
//  MealViewModel.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
}

// Define a protocol for API service
protocol APIServiceProtocol {
    func fetchMeals(completion: @escaping ([MealModel]) -> Void)
}

// Create a mock service that conforms to the APIServiceProtocol
struct MockAPIService: APIServiceProtocol {
    func fetchMeals(completion: @escaping ([MealModel]) -> Void) {
        let meals = [
            MealModel(meals: [Meal(idMeal: "52893", strMeal: "Apple & Blackberry Crumble"), Meal(idMeal: "52768", strMeal: "Apple Frangipan Tart")])
        ]
        // Call the completion handler with the mock data
        completion(meals)
    }
}
