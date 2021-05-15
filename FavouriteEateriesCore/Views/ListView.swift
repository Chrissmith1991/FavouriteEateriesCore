//
//  ListView.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 15/5/21.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var eateryGroup: EateryGroup
    var body: some View {
        List {
            ForEach(eateryGroup.allEateries) { eatery in
                Text("Eatery: \(eatery.nameString)")
            }
            .onDelete { offsets in
                withAnimation {eateryGroup.destroy(offsets: offsets)}
            }
        }.navigationBarItems(leading:
                                Button(action: {
                                    withAnimation {
                                        eateryGroup.create()
                                    }
                                }) {
                                    Label("", systemImage: "plus")
                                },
                             trailing:
                                EditButton())
    }
}

