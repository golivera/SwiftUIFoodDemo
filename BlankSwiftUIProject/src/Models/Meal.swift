//
//  Meal.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 10/30/23.
//

import Foundation


struct Meal {
    let id: Int
    let name: String
    let thumbnailUrl: URL
}

extension Meal: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnailUrl = "strMealThumb"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let idString = try container.decode(String.self, forKey: .id)
        guard let idInt = Int(idString) else {
            fatalError("No ID on a meal")
        }
        id = idInt
        name = try container.decode(String.self, forKey: .name)
        thumbnailUrl = try container.decode(URL.self, forKey: .thumbnailUrl)
    }
}

extension Meal:Identifiable {
    
}

extension Meal:Hashable {

}
