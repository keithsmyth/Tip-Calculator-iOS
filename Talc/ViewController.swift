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
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billTotalView: UIView!
    
    let tipDao = TipDao()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipDao.initTipControl(tipControl: tipControl)
        billTotalView.alpha = 0
        initDefaultTip()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipDao.getTipAmount(position: tipControl.selectedSegmentIndex)
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        updateViews(bill: bill, tip: tip)
    }
    
    func updateViews(bill: Double, tip: Double) {
        hideView(view: billTotalView, shouldHide: bill == 0)
    }
    
    func hideView(view: UIView, shouldHide: Bool) {
        let alpha = shouldHide ? Float(0) : Float(1)
        let currentAlpha = Float(view.alpha)
        if currentAlpha != alpha {
            UIView.animate(withDuration: 0.4, animations: {
                view.alpha = CGFloat(alpha)
            })
        }
    }
    
    func initDefaultTip() {
        tipControl.selectedSegmentIndex = DefaultsDao().getDefaultTipIndex()
    }
}

