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
        sortDescriptors: [NSSortDescriptor(keyPath: \Eatery.name, ascending: true)],
        animation: .default)
    private var eateries: FetchedResults<Eatery>

    var body: some View {
        NavigationView {
            ListView(eateries: eateries)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
