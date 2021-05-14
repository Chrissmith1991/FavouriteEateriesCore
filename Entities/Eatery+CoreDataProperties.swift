//
//  Eatery+CoreDataProperties.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 14/5/21.
//
//

import Foundation
import CoreData


extension Eatery {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Eatery> {
        return NSFetchRequest<Eatery>(entityName: "Eatery")
    }

    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var story: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var baseImage: String?
    @NSManaged public var reviews: NSSet?

}

// MARK: Generated accessors for reviews
extension Eatery {

    @objc(addReviewsObject:)
    @NSManaged public func addToReviews(_ value: Review)

    @objc(removeReviewsObject:)
    @NSManaged public func removeFromReviews(_ value: Review)

    @objc(addReviews:)
    @NSManaged public func addToReviews(_ values: NSSet)

    @objc(removeReviews:)
    @NSManaged public func removeFromReviews(_ values: NSSet)

}

extension Eatery : Identifiable {

}
