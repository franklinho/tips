//
//  ViewController.swift
//  tips
//
//  Created by Franklin Ho on 9/8/14.
//  Copyright (c) 2014 Slide Flash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    @IBOutlet weak var fiveLabel: UILabel!
    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var billLabel: UILabel!

    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billView.hidden = true
        billView.frame.origin.y = 357
        tipControl.hidden = true
        tipControl.frame.origin.y = 301
        
        billField.frame.origin.y = 196
        billLabel.frame.origin.y = 196
        billField.becomeFirstResponder()
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        if billField.text != "" {
            UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    self.billLabel.frame.origin.y = 86
                    self.billField.frame.origin.y = 86
                    self.billView.hidden = false
                    self.billView.frame.origin.y = 217
                    self.tipControl.hidden = false
                    self.tipControl.frame.origin.y = 180
                }, completion: { finished in
                    
            })
        } else {
            UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                self.billLabel.frame.origin.y = 196
                self.billField.frame.origin.y = 196
                
                self.billView.frame.origin.y = 357
                
                self.tipControl.frame.origin.y = 320
                self.billView.hidden = true
                self.tipControl.hidden = true
                }, completion: { finished in
                    
            })
        }
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billString = NSString(string: billField.text)
        var billAmount = billString.doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoLabel.text = String(format: "$%.2f", total/2)
        threeLabel.text = String(format: "$%.2f", total/3)
        fourLabel.text = String(format: "$%.2f", total/4)
        fiveLabel.text = String(format: "$%.2f", total/5)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
 
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTipPercentage")
        self.onEditingChanged(tipControl)
    }
}



