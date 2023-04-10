//
//  MealView.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//
import SwiftUI

struct MealView: View {
    @ObservedObject var dataFetcher = MealViewModel()

    var body: some View {
        NavigationView {
            VStack {
                List(dataFetcher.meals) { item in
                    NavigationLink(destination: MealDetailsView(mealID: item.idMeal)) {
                        Text(item.strMeal!)
                    }
                }
            }
            .onAppear {
                dataFetcher.fetchMeals()
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
