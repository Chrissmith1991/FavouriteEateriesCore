//
//  ContentView.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 14/5/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \EateryGroup.listName, ascending: true)],
        animation: .default)
    private var eateryGroups: FetchedResults<EateryGroup>
    var body: some View {
        NavigationView {
            ListView(eateryGroup: (eateryGroups.first ?? EateryGroup(context: viewContext)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
