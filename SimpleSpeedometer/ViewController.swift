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
    @IBOutlet var brightnessProgressTest: UIProgressView
    
    var locationManager:CLLocationManager!;
    var const : Constants!
    
    override func viewDidLoad() {

        const = Constants();
        
        //CoreLocation access
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.requestAlwaysAuthorization();
        locationManager.startUpdatingLocation();
        
        
        //Orientation + brightness changes, to adjust the UI
        let device : UIDevice = UIDevice.currentDevice();
        let screen : UIScreen = UIScreen.mainScreen();
        device.beginGeneratingDeviceOrientationNotifications();
        let nc = NSNotificationCenter.defaultCenter();
        nc.addObserver(self, selector:Selector("orientationChanged:"), name: UIDeviceOrientationDidChangeNotification, object: device);
        nc.addObserver(self, selector: Selector("brightnessChanged:"), name: UIScreenBrightnessDidChangeNotification, object: screen)

        
        // Disable sleep if device plugged in
        let currentBatteryState = device.batteryState;
        if currentBatteryState == .Charging || currentBatteryState == .Full
        {
            UIApplication.sharedApplication().idleTimerDisabled = true;
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func brightnessChanged(note:NSNotification)
    {
        brightnessProgressTest.progress = UIScreen.mainScreen().brightness;
        switch (UIScreen.mainScreen().brightness)
            {
        case 0.0...0.30:
            self.view.backgroundColor = UIColor.blackColor();
        case 0.31...1.0:
            self.view.backgroundColor = UIColor.whiteColor();
        default:
            self.view.backgroundColor = UIColor.whiteColor();
        }
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
        
        //130 kph Max speed in France.
        compteurVitesse.progress = CGFloat(speed) / 130.0;
        
        switch speed
            {
        case 0:
            //Adjust speed label text color depending on background color
            labelVitesse.textColor = (self.view.backgroundColor == UIColor.blackColor() ? UIColor.whiteColor() : UIColor.blackColor());
        case 1...50:
            labelVitesse.textColor = const.SlowSpeedBlue;
        case 51...90:
            labelVitesse.textColor = const.MidSpeedGreen;
        case 91...130:
            labelVitesse.textColor = const.HighSpeedOrange;
        default:
            labelVitesse.textColor = const.AbnormalSpeedRed;
        }
    }
}

