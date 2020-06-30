//
//  PhotoDownloader.swift
//  NasaPostCardApp
//
//  Created by curtis scott on 19/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import Foundation
import UIKit
class PhotoDownloader {
    

    
    let imageSession = URLSession(configuration: .ephemeral)

    let cache = NSCache<NSURL, UIImage>()

    func loadImage(from url: URL, completion: @escaping (UIImage?,Error?) -> Void)
    {
      if let image = cache.object(forKey: url as NSURL)
      {
        completion(image,nil)
      }
      else
      {
        let task = imageSession.dataTask(with: url) { (imageData, _, _) in
          guard let imageData = imageData,
          let image = UIImage(data: imageData)
            else { completion(nil,NasaAppError.requestFailed)
            return
                
            }
          
         self.cache.setObject(image, forKey: url as NSURL)
          DispatchQueue.main.async {
            completion(image,nil)
          }
          
        }
        task.resume()
      }
    }
    
   
    
}


//client.getPhotos{ photos , error in
  //        if let marsPhotos = photos {
    
     //         self.photos = marsPhotos
    //          guard let url = self.photos!.photos[0].imageDl() else {
      //            return
  //            }

    //          self.photoDl.loadImage(from: url) {image ,_ in
      //            if let img = image{
        //              self.testimg.image = img
          //
            //      }
              //}
          //}
      //}
