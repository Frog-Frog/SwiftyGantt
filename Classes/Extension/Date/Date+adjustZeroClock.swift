//
//  Date+adjustZeroClock.swift
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
    //Date's time information change into 12AM.
    
    // Destructive Method
    mutating func adjustZeroClock(){
        
        let calendar = Calendar(identifier: .gregorian)

        self = calendar.startOfDay(for: self)
    }
    
    // Non destructive method
    func adjustedZeroClock() -> Date {
        let calendar = Calendar(identifier: .gregorian)
        
        return calendar.startOfDay(for: self)
    }
    
}
