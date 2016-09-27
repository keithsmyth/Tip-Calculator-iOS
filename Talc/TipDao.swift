//
//  TipDao.swift
//  Talc
//
//  Created by Keith Smyth on 26/09/2016.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import Foundation
import UIKit

class TipDao {
    
    let tipPercentages = [0.18, 0.2, 0.25]
    
    func initTipControl(tipControl: UISegmentedControl) {
        tipControl.removeAllSegments()
        tipControl.insertSegment(withTitle: "18%", at: 0, animated: false)
        tipControl.insertSegment(withTitle: "20%", at: 1, animated: false)
        tipControl.insertSegment(withTitle: "25%", at: 2, animated: false)
    }
    
    func getTipAmount(position: Int) -> Double {
        return tipPercentages[position]
    }
    
}
