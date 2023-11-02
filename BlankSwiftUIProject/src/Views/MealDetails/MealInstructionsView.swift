//
//  MealInstructionsView.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 11/1/23.
//

import SwiftUI

struct MealInstructionsView: View {
    var instructions = [String]()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Instructions")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(Array(instructions.enumerated()), id: \.offset) { index, instruction in
                HStack(alignment: .top) {
                    Text("\(index + 1). ")
                        .frame(width: 40)
                    Text(instruction)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .padding()
    }
}

#Preview {
    MealInstructionsView(instructions: ["Sugar - A lot", "Egg - Maybe 1", "Milk - a bit"])
}
