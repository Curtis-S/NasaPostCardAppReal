//
//  MarsRoverPhoto.swift
//  NasaPostCardApp
//
//  Created by curtis scott on 19/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import Foundation

import UIKit
struct MarsRoverPhotos: Codable {
    let photos : [MarsRoverPhoto]
}


struct MarsRoverPhoto: Codable {
    let id : Int
    let img_src : String
    
    func imageDl()  -> URL? {
        if self.img_src.contains("https") {
            return  URL(string:self.img_src)
        }
        guard let  url =  URL(string:self.img_src.replacingOccurrences(of: "http", with: "https", options: .literal, range: nil)) else {
            return nil
        }
        return url
    }
    
}
