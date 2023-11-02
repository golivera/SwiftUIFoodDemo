//
//  MealDetail.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 10/31/23.
//

import SwiftUI

struct MealDetailsView: View {
    @ObservedObject var viewModel:MealDetailsViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                MealImageView(imageUrl: viewModel.thumbnailUrl)
                Text(viewModel.name)
                    .font(.title)
                    .padding()
                MealInstructionsView(instructions: viewModel.instructions)
                MealIngredientsView(ingredients: viewModel.ingredientsList)
            }
        }
        .onAppear {
            viewModel.loadMealDetails()
        }
    }
}

#Preview {
    let service = MockMealService()
    guard let viewModel = MealDetailsViewModel(service: service,
                                               mealId: 1) else {
        return Spacer()
    }
    return MealDetailsView(viewModel: viewModel)
}
