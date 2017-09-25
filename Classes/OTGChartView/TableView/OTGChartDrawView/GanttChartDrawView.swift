//
//  GanttChartDrawView.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/16.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import UIKit

protocol GanttchartDrawViewDelegate: class {
    func chartBackgroundColor(for date:Date) -> UIColor?
}

class GanttChartDrawView: UIView {

    weak var delegate: GanttchartDrawViewDelegate?
    
    let sizes = GanttChartSize.sharedInstance
    let colors = GanttChartColor.sharedInstance
    let showDateArray = GanttChartData.sharedInstance.showDateArray
    
    var processAreaHeight: CGFloat = 0
    var pointAreaHeight: CGFloat = 0
    
    var todayLineEnabled = false
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initialize() {
        backgroundColor = UIColor.clear
    }
    
    
    // MARK: - Draw
    override func draw(_ rect: CGRect) {
        if processAreaHeight > 0 {
            let processRect = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width, height: processAreaHeight)
            GanttChartDrawingClass.drawBackground(rect: processRect, color: colors.processAreaBackgroundColor)
        }
        
        if pointAreaHeight > 0 {
            let pointRect = CGRect(x: rect.origin.x, y: self.processAreaHeight, width: rect.size.width, height: pointAreaHeight)
            GanttChartDrawingClass.drawBackground(rect: pointRect, color: colors.pointAreaBackgroundColor)
        }
        
        GanttChartDrawingClass.drawDateSeparator(in: self, rect: rect, lineWidth: sizes.dateSeparatorWidth, color: colors.dateSeparatorColor)
        
        drawDateBackground(rect)
        
        if todayLineEnabled {
            drawTodayLine(rect)
        }
        
        if rect.size.height > 0 {
            GanttChartDrawingClass.drawCellSeparator(rect: rect,
                                                     lineWidth: sizes.rowSeparatorWidth,
                                                     color: colors.rowSeparatorColor)
            
            GanttChartDrawingClass.drawCenterSeparator(rect: rect,
                                                       center: processAreaHeight,
                                                       lineWidth: sizes.dotSeparatorWidth,
                                                       color: colors.dotSeparatorColor,
                                                       dashPattern: nil)
        }
    }
    
    
    func drawDateBackground(_ rect: CGRect) {
        for (index, element) in showDateArray.enumerated() {
            guard let backgroundColor = delegate?.chartBackgroundColor(for: element) else {
                continue
            }
            
            let x = CGFloat(index) + sizes.dateWidth + sizes.dateSeparatorWidth
            let y = rect.origin.y
            let width = sizes.dateWidth - sizes.dateSeparatorWidth * 2
            let height = rect.size.height
            
            let backgroundRect = CGRect(x: x, y: y, width: width, height: height)
            
            
            
            GanttChartDrawingClass.drawBackground(rect: backgroundRect, color: backgroundColor)
        }
    }
    
    
    func drawTodayLine(_ rect: CGRect) {
        guard let todayIndex = GanttChartCommonClass.foundSameDateIndex(from: showDateArray, date: Date()) else {
            return
        }
        
        let linePath = UIBezierPath()
        
        colors.todayLineColor.setStroke()
        linePath.lineWidth = sizes.todayLineWidth
        
        let x = sizes.dateWidth * CGFloat(todayIndex) + sizes.dateWidth
        
        linePath.move(to: CGPoint(x: x, y: rect.origin.y))
        linePath.addLine(to: CGPoint(x: x, y: rect.origin.y + rect.size.height))
        
        linePath.stroke()
    }

}
