//
//  SettingsViewController.swift
//  Talc
//
//  Created by Keith Smyth on 21/09/2016.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaultsDao = DefaultsDao()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipControl.selectedSegmentIndex = defaultsDao.getDefaultTipIndex()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func updateDefaultTip(_ sender: AnyObject) {
        defaultsDao.setDefaultTipIndex(index: tipControl.selectedSegmentIndex)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
