//
//  EateryGroup+ViewModel.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 15/5/21.
//

import Foundation
import CoreData

extension EateryGroup {
    /// Computed array of eatries to be dipslayed in the list view
    var allEateries: [Eatery] {
        get { eateries?.array as? [Eatery] ?? [] }
        set { eateries = NSOrderedSet(array: newValue)}
    }
    
    var groupName: String {
        get { listName ?? "default List" }
        set { listName = newValue }
    }
    
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType:
         .mainQueueConcurrencyType)
    }
    
    func create() {
        let newEatery = Eatery(context: viewContext)
        newEatery.name = "No Name"
        addToEateries(newEatery)
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    func destroy(offsets: IndexSet) {
        offsets.map { allEateries[$0] }.forEach(viewContext.delete)
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
