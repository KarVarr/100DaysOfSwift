//
//  CachedUser+CoreDataProperties.swift
//  SwiftUIMilestone10-12
//
//  Created by Karen Vardanian on 13.03.2023.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: String?
    @NSManaged public var tags: String?
    @NSManaged public var friend: CachedFriend?
    
    public var unwrappedAbout: String {
        about ?? "Unknown about"
    }
    
    public var unwrappedAddress: String {
        address ?? "Unknown about"
    }
    
    public var unwrappedCompany: String {
        company ?? "Unknown about"
    }
    
    public var unwrappedIdUser: String {
        id ?? "Unknown about"
    }
    
    public var unwrappedNameUser: String {
        name ?? "Unknown name"
    }
    
    public var unwrappedRegistered: String {
        registered ?? "Unknown name"
    }
    
    public var unwrappedTags: String {
        tags ?? "Unknown name"
    }

}

extension CachedUser : Identifiable {

}
