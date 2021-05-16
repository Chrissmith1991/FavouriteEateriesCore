//
//  Review+CoreDataProperties.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 15/5/21.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var content: String?
    @NSManaged public var raiting: Int16
    @NSManaged public var user: String?
    @NSManaged public var eatery: Eatery?

}
