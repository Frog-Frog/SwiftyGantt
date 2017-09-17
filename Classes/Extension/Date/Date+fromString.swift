//
//  Date+fromString.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/17.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

extension Date {
    
    /**
     Create Date from String.
     
     @param string Date text
     @param format Date text's format
     
     @return Instantiated Date
     */
    static func from(string: String, format: String) -> Date? {
        guard string.isEmpty else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: string)
    }
}
