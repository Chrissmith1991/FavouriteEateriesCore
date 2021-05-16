//
//  Eatery+CoreDataProperties.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 16/5/21.
//
//

import Foundation
import CoreData


extension Eatery {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Eatery> {
        return NSFetchRequest<Eatery>(entityName: "Eatery")
    }

    @NSManaged public var baseImage: String?
    @NSManaged public var desc: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var name: String?
    @NSManaged public var story: String?
    @NSManaged public var group: EateryGroup?
    @NSManaged public var reviews: NSOrderedSet?

}

// MARK: Generated accessors for reviews
extension Eatery {

    @objc(insertObject:inReviewsAtIndex:)
    @NSManaged public func insertIntoReviews(_ value: Review, at idx: Int)

    @objc(removeObjectFromReviewsAtIndex:)
    @NSManaged public func removeFromReviews(at idx: Int)

    @objc(insertReviews:atIndexes:)
    @NSManaged public func insertIntoReviews(_ values: [Review], at indexes: NSIndexSet)

    @objc(removeReviewsAtIndexes:)
    @NSManaged public func removeFromReviews(at indexes: NSIndexSet)

    @objc(replaceObjectInReviewsAtIndex:withObject:)
    @NSManaged public func replaceReviews(at idx: Int, with value: Review)

    @objc(replaceReviewsAtIndexes:withReviews:)
    @NSManaged public func replaceReviews(at indexes: NSIndexSet, with values: [Review])

    @objc(addReviewsObject:)
    @NSManaged public func addToReviews(_ value: Review)

    @objc(removeReviewsObject:)
    @NSManaged public func removeFromReviews(_ value: Review)

    @objc(addReviews:)
    @NSManaged public func addToReviews(_ values: NSOrderedSet)

    @objc(removeReviews:)
    @NSManaged public func removeFromReviews(_ values: NSOrderedSet)

}

extension Eatery : Identifiable {

}
