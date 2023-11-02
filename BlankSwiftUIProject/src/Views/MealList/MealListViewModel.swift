//
//  MealListViewModel.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 11/1/23.
//

import Foundation


@MainActor class MealListViewModel: ObservableObject {
    private var category: MealCategory
    private let service: MealServicing
    @Published var meals: [Meal] = []

    var title: String {
        if meals.count > 0 {
            return category.rawValue + " (\(meals.count))"
        }
        return category.rawValue
    }

    init(service: MealServicing, category: MealCategory) {
        self.service = service
        self.category = category
    }

    func loadMeals() {
        service.fetchAllMeals(endpoint: category.endpoint()) { [weak self] result in
            switch result {
            case .success(let meals):
                DispatchQueue.main.async {
                    self?.meals = meals
                }
            case .failure(let error):
                print("Error fetching meals: \(error)")
            }
        }
    }
}
