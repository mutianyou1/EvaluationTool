//
//  MUChartAxes.swift
//  EvaluationTool
//
//  Created by 潘元荣(外包) on 16/7/26.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import UIKit


class MUChartAxesData: NSObject {
    var xTitles = [String]()
    var yTitles = [NSObject]()
    var isShowAxes = true
    var xMax :CGFloat = 20.0
    var yMax :CGFloat = 20.0
}

class MUChartAxes: NSObject {
    var axesData : MUChartAxesData
    init(data :MUChartAxesData) {
        axesData = data
    }
    func stroke(context:CGContextRef){
        if (self.axesData.isShowAxes){
            let linexPath = UIBezierPath.init()
            CGContextSetStrokeColorWithColor(context, UIColor.lightGrayColor().CGColor)
            linexPath.lineWidth = 2
            linexPath.lineJoinStyle = .Round
            linexPath.lineCapStyle = .Round
            linexPath.moveToPoint(CGPointMake(50, kheight - kChartBottomHeight))
            linexPath.addLineToPoint(CGPointMake(kwidth - 50, kheight - kChartBottomHeight))
            linexPath.stroke()
            
            let lineyPath = UIBezierPath.init()
            lineyPath.lineWidth = 2
            lineyPath.lineJoinStyle = .Round
            lineyPath.lineCapStyle = .Round
            lineyPath.moveToPoint(CGPointMake(50, kheight - kChartBottomHeight))
            lineyPath.addLineToPoint(CGPointMake(50,kChartBottomHeight))
            lineyPath.stroke()
            
            
            
            
        }
    }
}
