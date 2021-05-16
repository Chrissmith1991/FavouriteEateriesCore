//
//  DetailView.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 16/5/21.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.editMode) var mode
    @ObservedObject var eatery: Eatery
    var body: some View {
        TextField("Eatery Name:",
                  text: $eatery.nameString,
                  onCommit: {
                    try? viewContext.save()
                })
    }
}
