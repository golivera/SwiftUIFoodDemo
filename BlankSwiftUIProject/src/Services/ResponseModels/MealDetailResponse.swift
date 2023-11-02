//
//  MealDetailResponse.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 11/1/23.
//

import Foundation


struct MealDetailResponse {
    let meals: [MealDetails]
}

extension MealDetailResponse:Decodable {

}
