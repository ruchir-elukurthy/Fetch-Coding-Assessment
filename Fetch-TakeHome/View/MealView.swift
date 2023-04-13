//
//  MealView.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//
import SwiftUI

struct MealView: View {
    @ObservedObject var mealDataFetcher = MealViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if(mealDataFetcher.meals.count == 0) {
                    Text("Loading...")
                }
                else {
                    List(mealDataFetcher.meals) { item in
                        NavigationLink(destination: MealDetailsView(mealID: item.idMeal)) {
                            Text(item.strMeal!)
                        }
                    }
                }
            }
            .onAppear {
                mealDataFetcher.fetchMeals()
            }
            .listStyle(.plain)
            .offset(x: -10)
            .navigationTitle("Meals")
        }
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}
