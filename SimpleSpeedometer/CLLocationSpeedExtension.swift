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
    var kph     : CDouble { return (self * 3.6) }
    var knots   : CDouble { return (self * 1.943_844) }
    var fts     : CDouble { return (self * 3.280_840) }
    var mph     : CDouble { return (self * 2.236_936) }
};