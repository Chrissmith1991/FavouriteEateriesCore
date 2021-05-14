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
        List {
            ForEach(eateries) { eatery in
                Text("Eatery: \(eatery.name!)")
            }
            .onDelete(perform: deleteEateries)
        }
        .toolbar {
            #if os(iOS)
            EditButton()
            #endif

            Button(action: addEatery) {
                Label("Add Eatery", systemImage: "plus")
            }
        }
    }

    private func addEatery() {
        withAnimation {
            let newEatery = Eatery(context: viewContext)
            newEatery.name = "No Name"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteEateries(offsets: IndexSet) {
        withAnimation {
            offsets.map { eateries[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
