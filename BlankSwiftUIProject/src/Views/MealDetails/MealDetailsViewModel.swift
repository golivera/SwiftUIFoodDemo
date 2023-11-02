//
//  MealDetailsViewModel.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 11/1/23.
//

import Foundation

@MainActor class MealDetailsViewModel: ObservableObject {
    private var mealId: Int
    private var meal: Meal?
    private let service: MealServicing

    @Published var thumbnailUrl: URL?
    @Published var name = ""
    @Published var instructions = [String]()
    @Published var ingredientsList = [String]()

    init?(service: MealServicing, mealId: Int?, meal: Meal?) {
        self.service = service
        if let meal = meal {
            self.meal = meal
            self.name = meal.name
            self.thumbnailUrl = meal.thumbnailUrl
            self.mealId = meal.id
        } else if let mealId = mealId {
            self.mealId = mealId
        } else {
            fatalError("MealDetailsViewModel:init requires either an id or a meal object")
        }
    }

    convenience init?(service: MealServicing, mealId: Int) {
        self.init(service: service, mealId: mealId, meal: nil)
    }

    func loadMealDetails() {
        service.fetchMealDetails(endpoint: MealAPI.details(mealId)) { [weak self] result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self?.instructions = details.instructions
                    self?.ingredientsList = details.ingredients.sorted(by: <).map { $0.key + " - " + $0.value }
                    self?.name = details.name
                    self?.thumbnailUrl = details.thumbnailUrl
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
