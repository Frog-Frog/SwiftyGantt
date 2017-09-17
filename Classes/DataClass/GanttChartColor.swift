//
//  GanttChartColor.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/16.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

enum GanttChartColorTheme {
    case bright
    case dark
}

public class GanttChartColor {
    
    static let sharedInstance = GanttChartColor()
    
    var dateSeparatorColor = UIColor.clear
    var dotSeparatorColor = UIColor.clear
    var chartBorderColor = UIColor.clear
    var todayHiligtedBackgroundColor = UIColor.clear
    var processAreaBackgroundColor = UIColor.clear
    var pointAreaBackgroundColor = UIColor.clear
    var dateAreaBackgroundColor = UIColor.clear
    var scrollBackgroundColor = UIColor.clear
    var rowSeparatorColor = UIColor.clear
    var refreshArrowColor = UIColor.clear
    var dateTextColor = UIColor.clear
    var todayHiligtedDateTextColor = UIColor.clear
    var todayLineColor = UIColor.clear
    
    var theme = GanttChartColorTheme.bright {
        didSet {
            switch theme {
            case .bright:
                reflectBrightTheme()
            case .dark:
                reflectDarkTheme()
            }
        }
    }
    
    
    func reflectBrightTheme() {
        
    }
    
    
    func reflectDarkTheme() {
        
    }
    
}
