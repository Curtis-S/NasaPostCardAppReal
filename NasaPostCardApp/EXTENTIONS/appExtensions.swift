//
//  extentions.swift
//  NasaPostCardApp
//
//  Created by curtis scott on 29/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func setBackGround(imgView:UIImageView, img:UIImage){
        imgView.image = img
        imgView.frame = self.view.frame
                 imgView.alpha = 0.3
                 imgView.contentMode = .scaleAspectFill
               self.view.addSubview(imgView)
        self.view.sendSubviewToBack(imgView)
    }

    
}

extension UIButton {
        func roundButton (){
          // self.layer.cornerRadius = 5
           //self.layer.borderWidth = 1
           // self.layer.borderColor = UIColor.black.cgColor

            self.backgroundColor = UIColor.systemYellow
            // Shadow and Radius
            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            self.layer.shadowOpacity = 1.0
            self.layer.shadowRadius = 0.0
           self.layer.masksToBounds = false
            self.layer.cornerRadius = 4
            self.tintColor = UIColor.black
       }
    
}

extension UIImageView {
      func roundImage (){
       self.layer.cornerRadius = 6
           self.layer.borderWidth = 1
           self.contentMode = .scaleAspectFill
       }
    
}

