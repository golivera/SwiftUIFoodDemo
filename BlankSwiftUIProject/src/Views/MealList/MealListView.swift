//
//  DessertListView.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 10/30/23.
//

import SwiftUI

struct MealListView: View {
    @ObservedObject var viewModel:MealListViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.meals) { meal in
                NavigationLink {
                    if let viewModel = MealDetailsViewModel(service: MealService(),
                                                            mealId: meal.id,
                                                            meal: meal) {
                        MealDetailsView(viewModel: viewModel)
                    } else {
                        Text("Ooops, something went wrong")
                    }
                } label: {
                    MealRowView(meal: meal)
                }
            }
            .navigationTitle(viewModel.title)
        }
        .onAppear {
            viewModel.loadMeals()
        }
    }
}

#Preview {
    let service = MockMealService()
    let viewModel = MealListViewModel(service: service,
                                      category: MealCategory.dessert)
    return MealListView(viewModel: viewModel)
}
