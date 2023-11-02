//
//  DessertRowView.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 10/30/23.
//

import SwiftUI

struct MealRowView: View {
    var meal: Meal

    var body: some View {
        HStack {
            Text(meal.name)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    let meal = Meal(id:52857,
                    name: "Pumpkin Pie",
                    thumbnailUrl: URL(string: "https:/www.themealdb.com/images/media/meals/usuqtp1511385394.jpg")!)
    return MealRowView(meal: meal)
}
