//
//  Capital.swift
//  Project16
//
//  Created by Karen Vardanian on 16.01.2023.
//
import MapKit
import UIKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var wiki: String
    
    internal init(title: String, coordinate: CLLocationCoordinate2D, info: String, wiki: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.wiki = wiki
    }
    
    
}
