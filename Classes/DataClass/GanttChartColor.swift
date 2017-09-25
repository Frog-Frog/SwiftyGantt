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
    
    public var dateAreaBackgroundColor = UIColor(hex: "F4F7FC")
    public var dateTextColor = UIColor(hex: "4F4F4F")
    
    public var todayHiligtedBackgroundColor = UIColor(hex: "F4F7FC")
    public var todayHiligtedDateTextColor = UIColor(hex: "4F4F4F")
    public var todayLineColor = UIColor(hex: "FA9420")
    
    public var chartBorderColor = UIColor(hex: "7C7C7C")
    
    public var scrollBackgroundColor = UIColor(hex: "F4F4F4")
    public var refreshArrowColor = UIColor(hex: "9C9C9C")
    
    public var dateSeparatorColor = UIColor(hex: "E8E8E8")
    
    public var processAreaBackgroundColor = UIColor.white
    public var pointAreaBackgroundColor = UIColor.white
    
    public var rowSeparatorColor = UIColor(hex: "C7C7C7")
    public var dotSeparatorColor = UIColor.clear
    
    
    // MARK: - Initialize
    init() {
        theme = .bright
    }

    
    // MARK: - ThemeColor
    func reflectBrightTheme() {
        dateAreaBackgroundColor = UIColor(hex: "F4F7FC")
        dateTextColor = UIColor(hex: "4F4F4F")
        
        todayHiligtedBackgroundColor = UIColor(hex: "F4F7FC")
        todayHiligtedDateTextColor = UIColor(hex: "4F4F4F")
        todayLineColor = UIColor(hex: "FA9420")
        
        chartBorderColor = UIColor(hex: "7C7C7C")
        
        scrollBackgroundColor = UIColor(hex: "F4F4F4")
        refreshArrowColor = UIColor(hex: "9C9C9C")
        
        dateSeparatorColor = UIColor(hex: "E8E8E8")
        
        processAreaBackgroundColor = UIColor.white
        pointAreaBackgroundColor = UIColor.white
        
        rowSeparatorColor = UIColor(hex: "C7C7C7")
        dotSeparatorColor = UIColor.clear
    }
    
    
    func reflectDarkTheme() {
        dateAreaBackgroundColor = UIColor(hex: "3F3F3F")
        dateTextColor = UIColor.white
        
        todayHiligtedBackgroundColor = UIColor(hex: "D07926")
        todayHiligtedDateTextColor = UIColor(hex: "3F3F3F")
        todayLineColor = UIColor(hex: "D07926")
        
        chartBorderColor = UIColor(hex: "8B8B8B")
        
        scrollBackgroundColor = UIColor(hex: "3F3F3F")
        refreshArrowColor = UIColor(hex: "9C9C9C")
        
        dateSeparatorColor = UIColor(hex: "5D5D5D")
        
        processAreaBackgroundColor = UIColor(hex: "383838")
        pointAreaBackgroundColor = UIColor(hex: "3f3f3f")
        
        rowSeparatorColor = UIColor(hex: "515151")
        dotSeparatorColor = UIColor(hex: "595959")
    }    
}
    

