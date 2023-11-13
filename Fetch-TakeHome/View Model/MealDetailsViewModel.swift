//
//  MealDetailsViewModel.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import Foundation

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
                self?.mealDetails = mealModels.meals.sorted { $0.name < $1.name }
            }
        }
    }
}
