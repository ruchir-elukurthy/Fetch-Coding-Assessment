//
//  MealDetailsModel.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import Foundation

struct MealDetailsModel: Decodable {
    var idMeal: String
    var strMeal: String
    var instructions: String
    var ingredients: [String]
    var measures: [String]
    
    var id: String {
        return idMeal
    }
}
