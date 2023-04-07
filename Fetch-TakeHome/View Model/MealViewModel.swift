//
//  MealViewModel.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import Foundation


class MealViewModel: ObservableObject {
    func fetchMeals() {
        //guard let url = URL
    }
}

// Define a protocol for your API service
protocol APIServiceProtocol {
    func fetchMeals(completion: @escaping ([MealModel]) -> Void)
}

// Create a mock service that conforms to the APIServiceProtocol
struct MockAPIService: APIServiceProtocol {
    func fetchMeals(completion: @escaping ([MealModel]) -> Void) {
        let meals = [
            MealModel(idMeal: "53049", strMeal: "Apam balik"),
            MealModel(idMeal: "52893", strMeal: "Apple & Blackberry Crumble"),
            MealModel(idMeal: "52768", strMeal: "Apple Frangipan Tart")
        ]
        // Call the completion handler with the mock data
        completion(meals)
    }
}
