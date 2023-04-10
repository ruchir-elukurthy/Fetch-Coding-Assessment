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
