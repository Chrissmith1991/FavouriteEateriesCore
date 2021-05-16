//
//  EateryView.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 16/5/21.
//

import SwiftUI

struct EateryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.editMode) var mode
    @ObservedObject var eatery: Eatery
    var body: some View {
        HStack {
            Text("The Eatery:")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            Spacer()
        }.background(Color.red)
        if mode?.wrappedValue == .active {
            TextField("Image URL", text: $eatery.imageLink, onCommit: {
               try? viewContext.save()
            })
        } else {
           if eatery.imageLink == "" && eatery.blankImage != "" {
               Image(eatery.blankImage)
           } else {
                getImageFromUrl(url: eatery.imageLink)
           }
        }
        if mode?.wrappedValue == .active {
            HStack { Text("Edit: "); TextField("Name Field", text: $eatery.nameString, onCommit: {
                try? viewContext.save()
            })}
        } else {
            Text(eatery.nameString)
                .font(.largeTitle)
                .fontWeight(.heavy)
        }
        if mode?.wrappedValue == .active {
            HStack { Text("Edit: "); TextField("Description Field", text: $eatery.descString, onCommit: {
                try? viewContext.save()
            })}
        } else {
            Text(eatery.descString)
                .font(.footnote)
                .italic()
                .fontWeight(.light)
        }
    }
}
