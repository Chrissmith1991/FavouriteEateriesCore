//
//  ListView.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 15/5/21.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var eateries: FetchedResults<Eatery>
    var body: some View {
        List {
            ForEach(eateries) { eatery in
                Text("Eatery: \(eatery.nameString)")
            }
            .onDelete(perform: deleteEateries)
        }.navigationBarItems(leading:
                                Button(action: addEatery)
                                    { Label("", systemImage: "plus")
                                },
                             trailing:
                                EditButton())
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

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}
