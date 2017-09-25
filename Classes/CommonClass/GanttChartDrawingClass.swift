//
//  GanttChartDrawingClass.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/16.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

class GanttChartDrawingClass {
    //MARK: - Draw Line
    class func drawDateSeparator(in view: UIView, rect: CGRect, lineWidth: CGFloat, color: UIColor) {
        let linePath = UIBezierPath()
        linePath.lineWidth = lineWidth
        
        color.setStroke()
        
        let dateWidth = GanttChartSize.sharedInstance.dateWidth
        
        var x: CGFloat = 0
        
        while x < rect.size.width {
            
            let startPoint = CGPoint(x: x, y: view.frame.origin.y)
            linePath.move(to: startPoint)
            
            let endPoint = CGPoint(x: x, y: view.frame.origin.y + view.frame.size.height)
            linePath.addLine(to: endPoint)
            
            x += dateWidth
        }
        linePath.stroke()
    }
    
    
    class func drawCellSeparator(rect: CGRect, lineWidth: CGFloat, color: UIColor) {
        let separatorPath = UIBezierPath()
        
        color.setStroke()
        separatorPath.lineWidth = lineWidth
        
        let y = rect.size.height - lineWidth/2
        
        separatorPath.move(to: CGPoint(x: rect.origin.x, y: y))
        separatorPath.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: y))
        
        separatorPath.stroke()
    }
    
    
    class func drawCenterSeparator(rect: CGRect, center: CGFloat, lineWidth: CGFloat, color: UIColor, dashPattern: UnsafePointer<CGFloat>?) {
        let separatorPath = UIBezierPath()
        
        color.setStroke()
        separatorPath.lineWidth = lineWidth
        
        if let pattern = dashPattern {
            separatorPath.setLineDash(pattern, count: 2, phase: 0)
        }
        
        separatorPath.move(to: CGPoint(x: rect.origin.x, y: center))
        separatorPath.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: center))
        
        separatorPath.stroke()
    }
    
    
    // MARK: - Draw Background
    class func drawBackground(rect: CGRect, color: UIColor) {
        let backgroundPath = UIBezierPath(rect: rect)
        color.setFill()
        backgroundPath.fill()
    }
    
    
    // MARK: - Draw String
    class func draw(_ string: String,
                    rect: CGRect,
                    font: UIFont,
                    fontColor: UIColor,
                    backgroundColor: UIColor,
                    textAlignment: NSTextAlignment,
                    lineBreakMode: NSLineBreakMode,
                    isAdjustFontSize: Bool) {
        
        var resizedRect = rect
        var resizedFont = font
        
        if isAdjustFontSize {
            
            var stringSize = string.size(attributes: [NSFontAttributeName: font])
            
            while stringSize.width > rect.size.width || stringSize.height > rect.size.height {
                resizedFont = UIFont.systemFont(ofSize: font.pointSize)
                stringSize = string.size(attributes: [NSFontAttributeName: resizedFont])
                resizedRect = CGRect(x: resizedRect.origin.x,
                                     y: resizedRect.origin.y + 0.5,
                                     width: resizedRect.size.height,
                                     height: resizedRect.size.width)
            }
        }
        
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = lineBreakMode
        style.alignment = textAlignment
        
        let attributes: [String: Any] = [NSForegroundColorAttributeName: fontColor,
                                         NSBackgroundColorAttributeName: backgroundColor,
                                         NSFontAttributeName: resizedFont,
                                         NSParagraphStyleAttributeName: style]
        
        string.draw(in: resizedRect, withAttributes: attributes)
    }
    
    
    // MARK: - Draw Figure
    class func draw(figurePath: UIBezierPath, strokeWidth: CGFloat, strokeColor: UIColor, fillColor: UIColor) {
        figurePath.lineWidth = strokeWidth
        
        fillColor.setFill()
        strokeColor.setStroke()
        
        figurePath.fill()
        figurePath.stroke()
    }
}
