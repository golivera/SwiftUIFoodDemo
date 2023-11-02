//
//  MealIngredientsView.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 11/1/23.
//

import SwiftUI

struct MealIngredientsView: View {
    var ingredients = [String]()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients (\(ingredients.count))")
                .font(.title3)
            ForEach(ingredients, id: \.self) { ingredient in
                HStack(alignment: .top) {
                    Text(ingredient)
                }
            }
        }
        .padding()
    }
}

#Preview {
    MealIngredientsView()
}
