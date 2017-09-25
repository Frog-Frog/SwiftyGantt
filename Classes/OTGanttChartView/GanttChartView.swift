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
    case triangle
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
    public let colors = GanttChartColor.sharedInstance
    
    public let sizes = GanttChartSize.sharedInstance
    
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
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    
    func initialize() {
        // load Xib
        let bundle = Bundle(for: type(of: self))
        let nibName = GanttChartView.stringFromClass()
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        
        // adjust size
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view": view]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                      options: NSLayoutFormatOptions(rawValue: 0),
                                                      metrics: nil,
                                                      views: bindings))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                      options: NSLayoutFormatOptions(rawValue: 0),
                                                      metrics: nil,
                                                      views: bindings))
    }
    
    // MARK: - Reload
    // reload GanttChartView
    public func reloadData() {
        
    }
    
    
    // reload OTGanttChartView. But GanttChartView hold current horizontal scroll contentOffset.
    public func redrawData () {
        
    }
    
    
    // reload GanttChartView's row.
    public func reloadRows(at indexPaths:Array<IndexPath>, with animation: UITableViewRowAnimation) {
        
    }
    
    
    // reload GanttChartView's sections.
    public func reloadSections(sections: IndexSet, with animation: UITableViewRowAnimation) {
        
    }

    
    // MARK: - Set scroll position
    // If argument date were not showing, set contentOffset CGpointZero.
    public func setHorizontalContentOffset(from date:Date, at position: HorizontalScrollPosition, animated: Bool) {
        
    }
    
    
    public func setHorizontalContentOffset(contentOffset: CGPoint, animated: Bool) {
        
    }
    
    
    public func setVerticalContentOffset(contentOffset: CGPoint, animated: Bool) {
        
    }
    
    
    public func scrollToRow(at indexPath: IndexPath, at positon: UITableViewScrollPosition, animated: Bool) {
        
    }
    
    
    // MARK: - Get date from scroll position
    public func getCurrentLeftDate() -> Date {
        return Date()
    }

    
    public func getCurrentCenterDate() -> Date {
        return Date()
    }
    
    
    public func getCurrentRightDate() -> Date {
        return Date()
    }
    
    
    // If you use left menu, yow must use these method and get
    public func getSectionHeight(at section: Int) -> CGFloat {
        return 0
    }
    
    
    public func getRowHeight(at indexPath: IndexPath) -> CGFloat {
        return 0
    }
    
    
    public func getProcessAreaHeight(section: Int) -> CGFloat {
        return 0
    }
    
    
    public func getPointAreaHeight(section: Int) -> CGFloat {
        return 0
    }
    
    
    public func getProcessAreaHeight(at IndexPath: IndexPath) -> CGFloat {
        return 0
    }
    
    
    public func getPointAreaHeight(at indexPath: IndexPath) -> CGFloat {
        return 0
    }
}
