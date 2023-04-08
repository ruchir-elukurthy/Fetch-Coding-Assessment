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
                    NavigationLink(destination: MealDetailsView(), tag: item.strMeal!, selection: self.$selectedData) {
                        Text(item.strMeal!)
                    }
                }
            }
            .onAppear {
                self.dataFetcher.fetchData()
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
