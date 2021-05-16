//
//  DetailView.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 16/5/21.
//

/// Detail view dispalys the eatery and its details to the user
/// This containes all the details about the eatery and it shows the reviews by users


import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.editMode) var mode
    @ObservedObject var eatery: Eatery
    var body: some View {
        ScrollView {
            EateryView(eatery: eatery)
            NoteView(eatery: eatery)
            ReviewView(eatery: eatery)
        }
    }
}
