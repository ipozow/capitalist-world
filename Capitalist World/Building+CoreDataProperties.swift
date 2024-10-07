//
//  Building+CoreDataProperties.swift
//  Capitalist World
//
//  Created by Ignacio Pozo on 06-10-24.
//
//

import Foundation
import CoreData


extension BuildingEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BuildingEntity> {
        return NSFetchRequest<BuildingEntity>(entityName: "Building")
    }

    @NSManaged public var type: String?
    @NSManaged public var space: Double
    @NSManaged public var cost: Double
    @NSManaged public var city: CityEntity?

}

extension BuildingEntity : Identifiable {

}
