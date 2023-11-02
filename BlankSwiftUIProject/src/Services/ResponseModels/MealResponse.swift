//
//  DessertResponse.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 10/30/23.
//

import Foundation


struct MealResponse: Decodable {
    let meals: [Meal]

    enum CodingKeys: String, CodingKey {
        case meals
    }
}
