//
//  MealViewModel.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    
    func fetchData() {
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
                    var cleanedData = [Meal]()
                    for item in response.meals {
                        if let strMeal = item.strMeal, !strMeal.isEmpty {
                            cleanedData.append(item)
                        }
                    }

                    // Use cleanedData for further processing
                    DispatchQueue.main.async {
                        self.meals = cleanedData.sorted(by: { $0.strMeal! < $1.strMeal! })
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
        
    }
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
