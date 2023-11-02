//
//  MockMealService.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 11/2/23.
//

import Foundation


struct MockMealService:MealServicing {
    func fetchAllDesserts(completion: @escaping (Result<[Meal], Error>) -> Void) {
        fetchAllMeals(endpoint: MealAPI.desserts, completion: completion)
    }

    func fetchAllMeals(endpoint: MealAPI, completion: @escaping (Result<[Meal], Error>) -> Void) {
        let meal = Meal(id:52857, name: "Pumpkin Pie", thumbnailUrl: URL(string: "https:/www.themealdb.com/images/media/meals/usuqtp1511385394.jpg")!)
        let meals = [
            meal,
        ]
        completion(.success(meals))
    }

    func fetchMealDetails(endpoint: MealAPI, completion: @escaping (Result<MealDetails, Error>) -> Void) {
        let mealDetails = MealDetails(id: 52857,
                                      name: "Pumpkin Pie",
                                      thumbnailUrl: URL(string: "https:/www.themealdb.com/images/media/meals/usuqtp1511385394.jpg")!,
                                      instructions: ["Go to store", "Buy Pumpkin Pie", "Enjoy!"],
                                      ingredients: ["Money": "$10", "Time": "30 minutes", "Gas": "0.5 gallons"])
        completion(.success(mealDetails))
    }

}
