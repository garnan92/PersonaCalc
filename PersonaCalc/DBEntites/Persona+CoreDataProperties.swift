//
//  Persona+CoreDataProperties.swift
//  
//
//  Created by Ricardo Pacheco on 08/12/20.
//
//

import Foundation
import CoreData


extension Persona {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Persona> {
        return NSFetchRequest<Persona>(entityName: "Persona")
    }

    @NSManaged public var id_persona: Int64
    @NSManaged public var username: String?

}
