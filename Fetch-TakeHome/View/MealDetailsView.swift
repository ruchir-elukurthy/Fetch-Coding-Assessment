//
//  MealDetailsView.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import SwiftUI

struct MealDetailsView: View {
    @ObservedObject var mealDetailsDataFetcher = MealDetailsViewModel()
    var mealID: String

    var body: some View {
        VStack {
            if(mealDetailsDataFetcher.mealDetails.count == 0) {
                Text("Loading...")
            }
            else {
                List(mealDetailsDataFetcher.mealDetails) { item in
                    VStack {
                        Text(item.strMeal)
                            .font(.largeTitle)
                            .frame(width: 300)
                            .padding(10)
                        Text("Instructions: \(item.strInstructions)")
                            .padding([.bottom], 20)
                        Text("Ingredients")
                            .font(.title2)
                            .frame(width: 300)
                    }
                    ForEach(0..<item.ingredients.count, id: \.self) { index in
                        HStack {
                            Text("\(item.ingredients[index]) : \(item.measures[index])")
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
        .offset(x: -10)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            mealDetailsDataFetcher.fetchMealDetails(mealID: mealID)
        }
    }
}

struct MealDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailsView(mealID: "53049")
    }
}
