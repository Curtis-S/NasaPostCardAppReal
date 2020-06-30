//
//  LocationAnnotation.swift
//  NasaPostCardApp
//
//  Created by curtis scott on 21/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import Foundation
import MapKit
class MapLocation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    
    init(place: MKPlacemark) {
        self.place = place
        
        self.title = place.title
       
        
        self.coordinate = place.coordinate
        
    }
    var place:MKPlacemark
    
    var title: String?
    var subtitle: String?
    }
    

