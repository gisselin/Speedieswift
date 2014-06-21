//
//  DecimalRGBColor.swift
//  SimpleSpeedometer
//
//  Created by Guillaume Isselin on 22/06/2014.
//  Copyright (c) 2014 Guillaume Isselin. All rights reserved.
//

import Foundation
import UIKit

//Easier UIColor construction
class DecimalUIColor {
    var r = 0;
    var g = 0;
    var b = 0;
    var a = 0;
     init(red redDecimal: Int, green greenDecimal: Int, blue blueDecimal: Int, alpha alphaDecimal: Int) {
        self.r = redDecimal;
        self.g = greenDecimal;
        self.b = blueDecimal;
        self.a = alphaDecimal;
        
    }
    func getUIColor() -> UIColor {
        let gR : CGFloat = CGFloat(self.r) / 255.0;
        let gG : CGFloat = CGFloat(self.g) / 255.0;
        let gB : CGFloat = CGFloat(self.b) / 255.0;
        let gA : CGFloat = CGFloat(self.a) / 255.0;
        
        return UIColor(red: gR, green: gG, blue: gB, alpha: gA);
    }
};