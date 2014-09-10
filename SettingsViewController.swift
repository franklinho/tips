//
//  SettingsViewController.swift
//  tips
//
//  Created by Franklin Ho on 9/9/14.
//  Copyright (c) 2014 Slide Flash. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var defaultTipValue = defaults.integerForKey("defaultTipPercentage")
        println("\(defaultTipValue)")
        defaultTipControl.selectedSegmentIndex = defaultTipValue
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onEditingChanged(sender: AnyObject) {
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey:"defaultTipPercentage")
        defaults.synchronize()
    }
}
