//
//  MealCategory.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 11/2/23.
//

import Foundation


enum MealCategory: String {
    case dessert = "Desserts"

    func endpoint() -> MealAPI {
        switch self {
        case .dessert:
            MealAPI.desserts
        }
    }
}
