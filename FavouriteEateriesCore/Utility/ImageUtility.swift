//
//  ImageUtility.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 16/5/21.
//

import Foundation
import SwiftUI

/// this will handle all the try catches for getting an image so we only need to write it once here.

func getImageFromUrl(url: String) -> Image {
    let blankImage: Image = Image("noImage")
    guard let imageUrl = URL(string: url) else {
        print("failed to create Url from parameter: \(url)")
        return blankImage
    }
    guard let imageData = try? Data(contentsOf: imageUrl) else {
        print("failed to download image from: \(imageUrl)")
        return blankImage
    }
    guard let uiImage = UIImage(data: imageData) else {
        print("failed to generate UI image from: \(imageData)")
        return blankImage
    }
    return Image(uiImage: uiImage)
}
