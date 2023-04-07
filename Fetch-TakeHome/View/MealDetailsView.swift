//
//  MealDetailsView.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/5/23.
//

import SwiftUI

struct MealDetailsView: View {
    let data: String

    var body: some View {
        Text(data)
            .navigationBarTitle(Text("Detail View"))
    }
}

struct MealDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailsView(data: "Item 1")
    }
}
