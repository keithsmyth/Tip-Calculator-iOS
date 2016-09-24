//
//  ViewController.swift
//  Talc
//
//  Created by Keith Smyth on 21/09/2016.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipTooltipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let tipPercentages = [0.18, 0.2, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDefaultTip()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let hasLongText = tip >= 1000
        hideToolTipLabel(shouldHide: hasLongText)
    }
    
    func hideToolTipLabel(shouldHide: Bool) {
        let alpha = shouldHide ? Float(0) : Float(1)
        let currentAlpha = Float(tipTooltipLabel!.alpha)
        if currentAlpha != alpha {
            UIView.animate(withDuration: 0.2, animations: {
                self.tipTooltipLabel.alpha = CGFloat(alpha)
            })
        }
    }
    
    func initDefaultTip() {
        tipControl.selectedSegmentIndex = DefaultsDao().getDefaultTipIndex()
    }
}

