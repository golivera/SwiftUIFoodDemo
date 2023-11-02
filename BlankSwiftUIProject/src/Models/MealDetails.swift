//
//  MealDetail.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 11/1/23.
//

import Foundation


struct MealDetails {
    let id: Int
    let name: String
    let thumbnailUrl: URL
    let instructions: [String]
    let ingredients: [String:String]
}


extension MealDetails: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        let idString = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "idMeal"))
        guard let idInt = Int(idString) else {
            fatalError("No ID on a meal")
        }
        id = idInt
        name = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "strMeal"))
        thumbnailUrl = try container.decode(URL.self, forKey: DynamicCodingKeys(stringValue: "strMealThumb"))

        let allInstructions = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "strInstructions"))
        let nonFilteredInstructions = allInstructions.components(separatedBy: ".").dropLast().map { $0.description.trimmingCharacters(in: .whitespacesAndNewlines) }
        instructions = nonFilteredInstructions.filter { $0.count > 0 && Int($0) == nil }

        var ingredientMeasures = [String:String]()
        for key in container.allKeys {
            if key.stringValue.starts(with: "strMeasure"),
               let measurement = try? container.decode(String.self, forKey: key) {
                ingredientMeasures[key.stringValue] = measurement
            }
        }

        var ingredientNames = [String:String]()
        for key in container.allKeys {
            if key.stringValue.starts(with: "strIngredient"),
               let ingredient = try? container.decode(String.self, forKey: key) {
                ingredientNames[key.stringValue] = ingredient
            }
        }

        var ingredientMap = [String:String]()
        for idx in 0..<ingredientNames.count {
            guard let name = ingredientNames["strIngredient\(idx + 1)"],
                  let measure = ingredientMeasures["strMeasure\(idx + 1)"],
                  name.count > 0,
                  measure.count > 0
            else {
                continue
            }
            ingredientMap[name] = measure
        }
        ingredients = ingredientMap
    }
}

