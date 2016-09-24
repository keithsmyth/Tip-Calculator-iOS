//
//  DefaultsDao.swift
//  Talc
//
//  Created by Keith Smyth on 23/09/2016.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import Foundation

class DefaultsDao {
    
    static let defaultTipIndex = "default_tip_index"

    func setDefaultTipIndex(index: Int) {
        let defaults = UserDefaults.standard
        defaults.set(index, forKey: DefaultsDao.defaultTipIndex)
        defaults.synchronize()
    }
    
    func getDefaultTipIndex() -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: DefaultsDao.defaultTipIndex)
    }
}
