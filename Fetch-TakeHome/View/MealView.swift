//
//  MealView.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//
import SwiftUI

struct MealView: View {
    @ObservedObject var dataFetcher = MealViewModel()
    @State private var selectedData: String? = nil

    var body: some View {
        NavigationView {
            VStack {
                List(dataFetcher.meals) { item in
                    Text(item.strMeal!)
                }
            }
            .navigationTitle("Meals")
        }
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}
