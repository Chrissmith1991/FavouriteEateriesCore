//
//  EateryGroup+CoreDataProperties.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 15/5/21.
//
//

import Foundation
import CoreData


extension EateryGroup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EateryGroup> {
        return NSFetchRequest<EateryGroup>(entityName: "EateryGroup")
    }

    @NSManaged public var location: String?
    @NSManaged public var listName: String?
    @NSManaged public var eateries: NSSet?

}

// MARK: Generated accessors for eateries
extension EateryGroup {

    @objc(addEateriesObject:)
    @NSManaged public func addToEateries(_ value: Eatery)

    @objc(removeEateriesObject:)
    @NSManaged public func removeFromEateries(_ value: Eatery)

    @objc(addEateries:)
    @NSManaged public func addToEateries(_ values: NSSet)

    @objc(removeEateries:)
    @NSManaged public func removeFromEateries(_ values: NSSet)

}
