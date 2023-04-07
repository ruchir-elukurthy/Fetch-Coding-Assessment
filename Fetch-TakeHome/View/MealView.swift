//
//  MealView.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//
import SwiftUI

struct MealView: View {
    let dataArray = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        NavigationView {
            List(dataArray, id: \.self) { data in
                NavigationLink(destination: MealDetailsView(data: data)) {
                    Text(data)
                }
            }
            .navigationBarTitle(Text("Desserts"))
        }
    }
}
struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}
