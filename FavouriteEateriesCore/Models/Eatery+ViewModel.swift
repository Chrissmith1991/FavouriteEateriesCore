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
}
