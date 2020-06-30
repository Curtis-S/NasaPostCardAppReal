//
//  AddressFormatter.swift
//  NasaPostCardApp
//
//  Created by curtis scott on 21/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import Foundation
import MapKit

struct AddressFormatter {
    
    static func parseAddress(selectedItem:MKPlacemark) -> String {
        // this method was to get the format of the address in ther search and it was adapted from www.thorntech.com/2016/01/how-to-search-for-location-using-apples-mapkit/
        
        // put a space between "4" and "Melrose Place"
        let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
        // put a comma between street and city/state
        let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : ""
        // put a space between "Washington" and "DC"
        let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
        let addressLine = String(
            format:"%@%@%@%@%@%@%@",
            // street number
            selectedItem.subThoroughfare ?? "",
            firstSpace,
            // street name
            selectedItem.thoroughfare ?? "",
            comma,
            // city
            selectedItem.locality ?? "",
            secondSpace,
            // state
            selectedItem.administrativeArea ?? ""
        )
        return addressLine
    }
    
}
