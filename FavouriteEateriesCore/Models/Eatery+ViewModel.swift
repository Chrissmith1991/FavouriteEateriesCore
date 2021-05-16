//
//  Eatery+ViewModel.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 15/5/21.
//

import Foundation
import CoreData


extension Eatery {
    /// A non Optional name property to obfuscate unwrapping a core data string
    var nameString: String {
        get { name ?? "unamed Eatery" }
        set { name = newValue }
    }
    var descString: String {
        get { desc ?? "no description" }
        set { desc = newValue }
    }
    var imageLink: String {
        get { imageURL ?? "" }
        set { imageURL = newValue }
    }
    var blankImage: String {
        get { baseImage ?? "noImage" }
    }
    var locationString: String {
        get { location ?? "no location" }
        set { location = newValue }
    }
    var noteString: String {
        get { notes ?? "" }
        set { notes = newValue }
    }
    var allReviews: [Review] {
        get { reviews?.array as? [Review] ?? [] }
        set { reviews = NSOrderedSet(array: newValue)}
    }
        
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType:
         .mainQueueConcurrencyType)
    }
    
    func create() {
        let newReview = Review(context: viewContext)
        newReview.user = "annon"
        addToReviews(newReview)
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
        offsets.map { allReviews[$0] }.forEach(viewContext.delete)
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
