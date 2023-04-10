//
//  MealDetailsModel.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import Foundation

struct MealDetailsModel: Decodable {
    let meals: [MealDetails]
}

struct MealDetails: Decodable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let ingredients: [String]
    let measures: [String]

    var id: String {
        return idMeal
    }

    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strInstructions
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)

        var ingredientsArray = [String]()
        var measuresArray = [String]()

        //Decoding all the ingredients in an array from 1 to 20
        for index in 1...20 {
            if let ingredient = try? container.decode(String.self, forKey: CodingKeys(stringValue: "strIngredient\(index)")!) {
                if(!ingredient.isEmpty) {
                    ingredientsArray.append(ingredient)
                }
            }
            if let measure = try? container.decode(String.self, forKey: CodingKeys(stringValue: "strMeasure\(index)")!) {
                if(!measure.isEmpty) {
                    measuresArray.append(measure)
                }
            }
        }

        ingredients = ingredientsArray
        measures = measuresArray
    }
}
