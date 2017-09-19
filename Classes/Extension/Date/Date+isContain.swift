//
//  Date+isContain.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/17.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//
//  https://github.com/PKPK-Carnage/SwiftyGantt

/**
 [SwiftyGantt]
 
 Copyright (c) [2017] [Tomosuke Okada]
 
 This software is released under the MIT License.
 http://opensource.org/licenses/mit-license.ph
 */

import Foundation

extension Date {
    func isContain(from firstDate:Date?, to lastDate:Date?) -> Bool{
        
        guard let firstDate = firstDate else {
            return false
        }
        
        guard let lastDate = lastDate else {
            return false
        }
        
        let adjustSelf = self.adjustedZeroClock()
        let adjustFirstDate = firstDate.adjustedZeroClock()
        let adjustLastDate = lastDate.adjustedZeroClock()
        
        if adjustFirstDate <= adjustSelf && adjustSelf <= adjustLastDate {
            return true
        }
        return false
    }
}
