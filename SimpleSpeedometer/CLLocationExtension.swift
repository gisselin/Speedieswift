//
//  CLLocationExtension.swift
//  SimpleSpeedometer
//
//  Created by Guillaume Isselin on 21/06/2014.
//  Copyright (c) 2014 Guillaume Isselin. All rights reserved.
//

import Foundation
import CoreLocation


// Les extensions c'est la vie.
// Extension to CLLOcationSpeed to handle units
extension CLLocationSpeed
{
    var kph     : CDouble { return (self * 1.6093) }
    var knots   : CDouble { return (self * 0.868976) }
    var fts     : CDouble { return (self * 1.466667) }
    var mps     : CDouble { return (self * 0.44704) }
};