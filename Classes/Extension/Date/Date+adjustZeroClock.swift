//
//  Date+adjustZeroClock.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/17.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

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
