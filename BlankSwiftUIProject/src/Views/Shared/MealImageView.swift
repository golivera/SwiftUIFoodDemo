//
//  MealImageView.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 11/1/23.
//

import SwiftUI

let IMAGE_ANIMATION_DURATION = 0.7

struct MealImageView: View {
    var imageUrl: URL?
    let imageDimension = UIScreen.main.bounds.width

    var body: some View {
        AsyncImage(
            url: imageUrl,
            transaction: Transaction(animation: .easeIn(duration: IMAGE_ANIMATION_DURATION))
        ) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: imageDimension, height: imageDimension, alignment: .center)
            case .success(let image):
                image
                    .resizable()
                    .frame(width: imageDimension, height: imageDimension, alignment: .center)
                    .aspectRatio(contentMode: .fit)

            case .failure(_):
                Image(systemName: "photo")
            @unknown default:
                // TODO: add logging/tracking for further investigatigon
                Image(systemName: "photo")
            }
        }
    }
}

#Preview {
    MealImageView(imageUrl: URL(string: "https:/www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")!)
}
