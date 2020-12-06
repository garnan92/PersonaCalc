//
//  Users+CoreDataProperties.swift
//  
//
//  Created by Ricardo Pacheco on 06/12/20.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var persona: Persona?

}
