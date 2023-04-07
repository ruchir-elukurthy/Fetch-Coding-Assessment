//
//  MealModel.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import Foundation


struct MealModel {
    let idMeal: String
    let strMeal: String
    
    enum CodingKeys: String {
        case id = "idMeal"
        case mealName = "strMeal"
    }
}
