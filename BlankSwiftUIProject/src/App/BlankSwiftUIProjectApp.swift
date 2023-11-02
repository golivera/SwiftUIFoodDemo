//
//  BlankSwiftUIProjectApp.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 10/30/23.
//

import SwiftUI

@main
struct BlankSwiftUIProjectApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = MealListViewModel(service: MealService(), category: MealCategory.dessert)
            MealListView(viewModel: viewModel)
        }
    }
}
