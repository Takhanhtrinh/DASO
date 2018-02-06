//
//  Player+CoreDataProperties.swift
//  
//
//  Created by Trinh Ta on 12/29/17.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var age: Int16
    @NSManaged public var team: Team?

}
