//
//  Eatery+ViewModel.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 15/5/21.
//

import Foundation


extension Eatery {
    /// A non Optional name property to obfuscate unwrapping a core data string
    var nameString: String {
        get { name ?? "unamed Eatery" }
        set { name = newValue }
    }
    var descString: String {
        get { desc ?? "no description" }
        set { desc = newValue }
    }
    var imageLink: String {
        get { imageURL ?? "" }
        set { imageURL = newValue }
    }
    var blankImage: String {
        get { baseImage ?? "" }
        set { baseImage = newValue }
    }
    var storyString: String {
        get { story ?? "" }
        set { story = newValue }
    }
}
