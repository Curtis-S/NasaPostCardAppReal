//
//  Animators.swift
//  NasaPostCardApp
//
//  Created by curtis scott on 27/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import Foundation
import UIKit


class Animator {
    
    //static func fadePicture (imgView: UIImageView , toImage: UIImage , change:Bool){
       // if change {
           // delay(seconds: 3.0) {
                //UIView.transition(with: imgView, duration: 1.0, options: .transitionCrossDissolve, animations: {
               //     imgView.image = toImage
             //   }, completion: nil)
           //   self.fadePicture(imgView: imgView, toImage: UIImage(named: "Geely_Sat")!,change: !change)
         //   }
       // } else {
            
            //delay(seconds: 3.0) {
                //UIView.transition(with: imgView, duration: 1.0, options: .transitionCrossDissolve, animations: {
                //    imgView.image = toImage
              //  }, completion: nil)
            //  self.fadePicture(imgView: imgView, toImage: UIImage(named: "pia23492")!,change: !change)
          //  }
        //
      //  }
        
    //}
    
    static func fadePicture2 (imgView: UIImageView , image1: UIImage , image2: UIImage){
        if imgView.image  == image1 {
                 UIView.transition(with: imgView, duration: 1.0, options: .transitionCrossDissolve, animations: {
                     imgView.image = image2
                 }, completion: nil)
        } else {
            UIView.transition(with: imgView, duration: 1.0, options: .transitionCrossDissolve, animations: {
                               imgView.image = image1
                           }, completion: nil)
            
        }
         }
        
          

         
     
    
    // A delay function
   //  static func delay(seconds: Double, completion: @escaping ()-> Void) {
   //   DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
  //  }

    
}
