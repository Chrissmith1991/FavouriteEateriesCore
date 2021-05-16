//
//  ListView.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 15/5/21.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.editMode) var mode
    @ObservedObject var eateryGroup: EateryGroup
    var body: some View {
        List {
            ForEach(eateryGroup.allEateries) { eatery in
                ListItemView(eatery: eatery)
            }
            .onDelete { offsets in
                withAnimation {eateryGroup.destroy(offsets: offsets)}
            }.onMove(perform: { indices, newOffset in
                eateryGroup.move(from: indices, to: newOffset)
            })
        }.navigationBarItems(leading:
                                Button(action: {
                                    withAnimation {
                                        eateryGroup.create()
                                    }}
                                ) {
                                    Label("", systemImage: "plus")
                                },
                             trailing:
                                EditButton()
        )
        .navigationTitle(eateryGroup.groupName)
    }
}


