//
//  City+CoreDataProperties.swift
//  Capitalist World
//
//  Created by Ignacio Pozo on 06-10-24.
//
//

import Foundation
import CoreData


extension CityEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<CityEntity>(entityName: "City")
    }

    @NSManaged public var name: String?
    @NSManaged public var population: Int64
    @NSManaged public var purchasingPowerIndex: Double
    @NSManaged public var area: Double
    @NSManaged public var buildableArea: Double
    @NSManaged public var availableArea: Double
    @NSManaged public var buildings: BuildingEntity?

}

extension CityEntity : Identifiable {

}
