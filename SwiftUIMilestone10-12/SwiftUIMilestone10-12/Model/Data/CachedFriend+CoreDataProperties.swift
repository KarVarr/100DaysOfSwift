//
//  CachedFriend+CoreDataProperties.swift
//  SwiftUIMilestone10-12
//
//  Created by Karen Vardanian on 13.03.2023.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: CachedUser?
    
    public var unwrappedId: String {
        id ?? "Unknown id"
    }
    
    public var unwrappedName: String {
        name ?? "Unknown name"
    }

}

extension CachedFriend : Identifiable {

}
