//
//  Player+CoreDataProperties.swift
//  Capitalist World
//
//  Created by Ignacio Pozo on 06-10-24.
//
//

import Foundation
import CoreData


extension PlayerEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerEntity> {
        return NSFetchRequest<PlayerEntity>(entityName: "Player")
    }

    @NSManaged public var money: Double

}

extension PlayerEntity : Identifiable {

}
