//
//  File.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 11/1/23.
//

import Foundation


struct DynamicCodingKeys: CodingKey {
    var stringValue: String

    init!(stringValue: String) {
        self.stringValue = stringValue
    }

    var intValue: Int? {
        return nil
    }

    init?(intValue: Int) {
        return nil
    }
}
