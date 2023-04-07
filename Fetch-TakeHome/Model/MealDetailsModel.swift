//
//  MealDetailsModel.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import Foundation

struct MealDetailsModel {
    let id: String
    let mealName: String
    let instructions: String
    
    enum CodingKeys: String {
        case id = "idMeal"
        case mealName = "strName"
        case instructions = "strInstructions"
    }
}
