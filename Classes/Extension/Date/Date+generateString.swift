//
//  Date+generateString.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/17.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

extension Date {
    
    /**
     Generate String from Date.
     
     @param format Return date text's format
     
     @return Generated String
     */
    func generateString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = format;
        
        return dateFormatter.string(from: self)
    }
    
    
    /**
     Generate week text String From Date.
     
     @return Week text
     */
    func generateWeekString() -> String {
        let calendar = Calendar(identifier: .gregorian)
        
        let component = calendar.component(.weekday, from: self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
       
        return dateFormatter.shortWeekdaySymbols[component - 1]
    }
    
}
