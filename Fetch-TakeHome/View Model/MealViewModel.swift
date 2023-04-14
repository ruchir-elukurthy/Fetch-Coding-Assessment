//
//  MealViewModel.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import Foundation

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
