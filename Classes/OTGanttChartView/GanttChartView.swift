//
//  GanttChartView.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/16.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//
//  https://github.com/PKPK-Carnage/SwiftyGantt

/**
 [SwiftyGantt]
 
 Copyright (c) [2017] [Tomosuke Okada]
 
 This software is released under the MIT License.
 http://opensource.org/licenses/mit-license.ph
 
 */

import UIKit

public enum FigureType {
    case none
    case circle
    case triange
    case diamond
    case square
}


public enum HorizontalScrollPosition
{
    case left
    case center
    case right
    case automatic
    case none
}

public class GanttChartView: UIView, UIScrollViewDelegate {

   
    
    public weak var dataSource: GanttChartViewDataSource?
    public weak var delegate: GanttChartViewDelegate?
    
    // Color
    public let color = GanttChartColor.sharedInstance
    
    public let size = GanttChartSize.sharedInstance
    
    public var isEnableTodayLine = false
    public var todayFigureType = FigureType.none
    
    public var isEnableLeftRefreshControl = false
    
    public var isEnableRightRefreshControl = false
    
    private(set) var currentStartDate = Date()
    private(set) var currentLastDate = Date()
    
    private let data = GanttChartData.sharedInstance
    
    @IBOutlet private weak var leftArrowIcon: UIImageView!
    @IBOutlet private weak var rightArrowIcon: UIImageView!
    
    @IBOutlet private weak var scrollView: UIScrollView!
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
