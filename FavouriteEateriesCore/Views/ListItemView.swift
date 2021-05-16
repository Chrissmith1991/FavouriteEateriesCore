//
//  ListItemView.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 16/5/21.
//

import SwiftUI

struct ListItemView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.editMode) var mode
    @ObservedObject var eatery: Eatery
    var body: some View {
        VStack {
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
             NavigationLink(
                 destination: DetailView(eatery: eatery)
                     .navigationBarItems(
                     trailing: EditButton()
                     ),
                 label: {
                     if mode?.wrappedValue == .active {
                         TextField("Eatery Name", text: $eatery.nameString, onCommit: {
                            try? viewContext.save()
                         })
                     } else {
                         Text("\(eatery.nameString)")
                     }
                 }
             )
         }
    }
}
