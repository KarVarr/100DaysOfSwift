//
//  Movie+CoreDataProperties.swift
//  SwiftUICoreDataProject
//
//  Created by Karen Vardanian on 11.03.2023.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16
    
    public var wrappingTitle: String {
        title ?? "Unknown title"
    }

}

extension Movie : Identifiable {

}
