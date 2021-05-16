//
//  NoteView.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 16/5/21.
//

import SwiftUI

struct NoteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.editMode) var mode
    @ObservedObject var eatery: Eatery
    var body: some View {
        HStack {
            Text("Notes:")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding()
            Spacer()
        }.background(Color.green)
        if mode?.wrappedValue == .active {
            HStack { Text("Edit: "); TextField("Note Field", text: $eatery.noteString, onCommit: {
                try? viewContext.save()
            })}
        } else {
            Text(eatery.noteString).padding()
        }
    }
}
