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
           self.layer.cornerRadius = 5
           self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.black.cgColor
       }
    
}

extension UIImageView {
      func roundImage (){
       self.layer.cornerRadius = 6
           self.layer.borderWidth = 1
           self.contentMode = .scaleAspectFill
       }
    
}

