//
//  ViewController.swift
//  DataStorage-Swift
//
//  Created by vamsi krishna reddy kamjula on 7/26/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
        /*Writing into UserDefaults*/
        
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(blueSlider.value, forKey: "blue")
//        userDefaults.set(greenSlider.value, forKey: "green")
//        userDefaults.set(redSlider.value, forKey: "red")
//
//
//        self.view.backgroundColor = UIColor.init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
//
//        userDefaults.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*Reading from UserDefaults*/
        
//        let userDefaults = UserDefaults.standard
//
//        if userDefaults.object(forKey: "red") != nil {
//            let red = userDefaults.float(forKey: "red")
//            let green = userDefaults.float(forKey: "green")
//            let blue = userDefaults.float(forKey: "blue")
//
//            redSlider.value = red
//            greenSlider.value = green
//            blueSlider.value = blue
//
//            self.view.backgroundColor = UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
//        }
        
        
        /*Reading from pList file "data.plist"*/
        
//        let path = Bundle.main.path(forResource: "data", ofType: "plist")
//        guard let data = FileManager.default.contents(atPath: path!) else {
//            return
//        }
//
//        var format = PropertyListSerialization.PropertyListFormat.xml
//        do {
//            let plistData = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: &format) as! [String:Any]
//            let value = plistData["Model"] as! String
//            let arrayOfPhones = plistData["PhoneArray"] as! [String]
//            print(arrayOfPhones)
//        }catch let error {
//            print(error)
//        }
        
        
        /*write into FileManager*/
        
        let urlString = "https://upload.wikimedia.org/wikipedia/commons/5/51/Google.png"
        let url = URL.init(string: urlString)
        do {
            let data = try Data.init(contentsOf: url!)
            let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).last!
            try  data.write(to: urls.appendingPathComponent("GoogleIcon.png"))
            
            let documentDir = FileManager.SearchPathDirectory.cachesDirectory
            let domainMask = FileManager.SearchPathDomainMask.userDomainMask
            let path = NSSearchPathForDirectoriesInDomains(documentDir, domainMask, true).first
            let imageURL = URL(fileURLWithPath: path!).appendingPathComponent("GoogleIcon.png")
            let image = UIImage(contentsOfFile: imageURL.path)
            displayImage.image = image
            
            
        }catch let error {
            print(error)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

