//
//  Review+ViewModel.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 16/5/21.
//

import Foundation

extension Review {
    var userName: String {
        get { user ?? "annon" }
        set { user = newValue }
    }
    var reviewRating: Int16 {
        get { raiting }
        set { raiting = newValue }
    }
    var reviewContent: String {
        get { content ?? "no content" }
        set { content = newValue }
    }
}
