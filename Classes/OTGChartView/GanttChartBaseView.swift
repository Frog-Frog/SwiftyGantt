//
//  GanttChartBaseView.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/16.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import UIKit

class GanttChartBaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    
    private func initialize() {
        // load Xib
        let bundle = Bundle(for: type(of: self))
        let nibName = GanttChartBaseView.stringFromClass()
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

}
