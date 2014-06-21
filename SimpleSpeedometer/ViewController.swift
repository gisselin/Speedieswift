//
//  ViewController.swift
//  SimpleSpeedometer
//
//  Created by Guillaume Isselin on 21/06/2014.
//  Copyright (c) 2014 Guillaume Isselin. All rights reserved.
//

import UIKit
import CoreLocation
import CoreGraphics

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet var labelVitesse: UILabel
    @IBOutlet var compteurVitesse: UIProgressView
    
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CoreLocation access
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.requestAlwaysAuthorization();
        locationManager.startUpdatingLocation();

        
        //Orientation changes, in a future for a better layout
        let device : UIDevice = UIDevice.currentDevice();
        device.beginGeneratingDeviceOrientationNotifications();
        let nc : NSNotificationCenter = NSNotificationCenter.defaultCenter();
        nc.addObserver(self, selector:Selector("orientationChanged:"), name: UIDeviceOrientationDidChangeNotification, object: device);
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func orientationChanged(note: NSNotification)
    {
        //Handle Device Orientation changes here.
        switch (UIDevice.currentDevice().orientation)
            {
        case UIDeviceOrientation.Portrait :
            Void();
        case UIDeviceOrientation.LandscapeLeft, UIDeviceOrientation.LandscapeRight :
            Void();
        default:
            Void();
        }
    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: AnyObject[]!) {
        
        var speed  = Int(manager.location.speed.kph)
        
        labelVitesse.text = "\(speed)";
        compteurVitesse.progress = CGFloat(speed) / 130.0;
        
        switch speed
            {
        case 0:
                labelVitesse.textColor = UIColor.blackColor()
        case 1...50:
                labelVitesse.textColor = DecimalUIColor(red: 0, green: 112, blue: 255, alpha: 255).getUIColor()
        case 51...90:
                labelVitesse.textColor = DecimalUIColor(red: 67, green: 212, blue: 89, alpha: 255).getUIColor()
        case 91...130:
                labelVitesse.textColor = DecimalUIColor(red: 255, green: 138, blue: 1, alpha: 1).getUIColor()
        default:
                labelVitesse.textColor = DecimalUIColor(red: 255, green: 51, blue: 43, alpha: 1).getUIColor()
        }
    }
}

