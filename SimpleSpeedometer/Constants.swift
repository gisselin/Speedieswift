//
//  Constants.swift
//  SimpleSpeedometer
//
//  Created by Guillaume Isselin on 29/06/2014.
//  Copyright (c) 2014 Guillaume Isselin. All rights reserved.
//

import Foundation
import CoreGraphics

struct Constants {
    var SlowSpeedBlue = DecimalUIColor(red: 0, green: 112, blue: 255, alpha: 255).getUIColor();
    var MidSpeedGreen = DecimalUIColor(red: 67, green: 212, blue: 89, alpha: 255).getUIColor();
    var HighSpeedOrange = DecimalUIColor(red: 255, green: 138, blue: 1, alpha: 255).getUIColor();
    var AbnormalSpeedRed = DecimalUIColor(red: 255, green: 51, blue: 43, alpha: 255).getUIColor();
}