//
//  MUChartAxes.swift
//  EvaluationTool
//
//  Created by 潘元荣(外包) on 16/7/26.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import UIKit

let kArrowHeight :CGFloat = 3.0
let kArrowMargin :CGFloat = 7.0
let kDegreeHeightOrWidth :CGFloat = 8.0
class MUChartAxesData: NSObject {
    var xTitles = [String]()
    var yTitles = [String]()
    var isShowAxes = true
    var isShowXDegrees = true
    var isShowYDegrees = true
    var xMax :CGFloat = 20.0
    var yMax :CGFloat = 20.0
    var title : String = "abc"
    var targetView = UIView.init()
    var xTitleAlignment = NSTextAlignment.Center
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
            linexPath.lineWidth = 1.5
            linexPath.lineJoinStyle = .Round
            linexPath.lineCapStyle = .Round
            linexPath.moveToPoint(CGPointMake(50, kheight - kChartBottomHeight))
            linexPath.addLineToPoint(CGPointMake(kwidth - 50, kheight - kChartBottomHeight))
            linexPath.stroke()
            
            let lineyPath = UIBezierPath.init()
            lineyPath.lineWidth = 1.5
            lineyPath.lineJoinStyle = .Round
            lineyPath.lineCapStyle = .Round
            lineyPath.moveToPoint(CGPointMake(50, kheight - kChartBottomHeight))
            lineyPath.addLineToPoint(CGPointMake(50,kChartBottomHeight))
            lineyPath.stroke()
            
            //箭头
            let arrowPath = UIBezierPath.init()
            arrowPath.lineWidth = 1.5
            arrowPath.lineJoinStyle = .Round
            arrowPath.lineCapStyle = .Round
            
            arrowPath.moveToPoint(CGPointMake(kwidth - 50.0, kheight - kChartBottomHeight))
            arrowPath.addLineToPoint(CGPointMake(kwidth - 40.0 ,kheight - kChartBottomHeight))
            arrowPath.addLineToPoint(CGPointMake(kwidth - 50.0 + kArrowMargin, kheight - kChartBottomHeight + kArrowHeight))
            arrowPath.addLineToPoint(CGPointMake(kwidth - 50.0 + kArrowMargin, kheight - kChartBottomHeight - kArrowHeight ))
            arrowPath.addLineToPoint(CGPointMake(kwidth - 40.0 ,kheight - kChartBottomHeight))
            arrowPath.stroke()
        
        if(self.axesData.isShowXDegrees){
           let degreesPath = UIBezierPath.init()
            degreesPath.lineCapStyle = .Round
            degreesPath.lineJoinStyle = .Round
            degreesPath.lineWidth = 1.5
            for(var  i = 1;i <= self.axesData.xTitles.count;  i++){
                let width = (kwidth - 100)/(CGFloat.init(self.axesData.xTitles.count))
                let point = CGPointMake(50 + width * CGFloat.init(i) , kheight - kChartBottomHeight)
                let toPoint = CGPointMake(50 + width * CGFloat.init(i) , kheight - kChartBottomHeight - kDegreeHeightOrWidth)
               degreesPath.moveToPoint(point)
               degreesPath.addLineToPoint(toPoint)
            }
            degreesPath.stroke()
            
            
            
        }
            //x轴内容
            let centerX = (kwidth - 100.0)/(CGFloat.init(self.axesData.xTitles.count*2))
            for(var i = 0;i < self.axesData.xTitles.count ;i++){
                let string = self.axesData.xTitles[i]
                let label = UILabel()
                label.frame.origin.x = 50.0 + centerX * CGFloat.init(i  + i )
                label.frame.origin.y = kheight - kChartBottomHeight
                label.frame.size = CGSizeMake(centerX + centerX, centerX + centerX)
                label.text = string
                label.textAlignment = self.axesData.xTitleAlignment
                //label.backgroundColor = UIColor.redColor()
                label.font = UIFont.systemFontOfSize(10)
                self.axesData.targetView.addSubview(label)
                
            }
        if(self.axesData.isShowYDegrees){
            let degreesPath = UIBezierPath.init()
            degreesPath.lineCapStyle = .Round
            degreesPath.lineJoinStyle = .Round
            degreesPath.lineWidth = 1.5
            for(var  i = 0;i < self.axesData.yTitles.count  ;  i++){
                let height = (kheight - kChartBottomHeight - kChartBottomHeight)/(CGFloat.init(self.axesData.yTitles.count - 1))
                let point = CGPointMake(50 ,kheight - kChartBottomHeight - height * CGFloat.init(i))
                let toPoint = CGPointMake(50 + kDegreeHeightOrWidth, kheight - kChartBottomHeight - height * CGFloat.init(i))
                degreesPath.moveToPoint(point)
                degreesPath.addLineToPoint(toPoint)
            }
            degreesPath.stroke()
            //箭头
            let arrowPath = UIBezierPath.init()
            arrowPath.lineWidth = 1.5
            arrowPath.lineJoinStyle = .Round
            arrowPath.lineCapStyle = .Round
            
            arrowPath.moveToPoint(CGPointMake(50.0,kChartBottomHeight))
            arrowPath.addLineToPoint(CGPointMake(50,kChartBottomHeight - kArrowHeight - kArrowMargin))
            arrowPath.addLineToPoint(CGPointMake(50 - kArrowHeight,kChartBottomHeight - kArrowMargin))
            arrowPath.addLineToPoint(CGPointMake(50 + kArrowHeight,kChartBottomHeight - kArrowMargin))
            arrowPath.addLineToPoint(CGPointMake(50,kChartBottomHeight - kArrowMargin - kArrowHeight))
            arrowPath.stroke()
            
            //y轴内容
           let centerY = (kheight - kChartBottomHeight - kChartBottomHeight)/(CGFloat.init(self.axesData.yTitles.count - 1))
            for(var i = 0;i < self.axesData.yTitles.count ;i++){
                let str = self.axesData.yTitles[i]
                let label = UILabel()
                label.frame.origin.x = 0.0
                label.frame.origin.y = kChartBottomHeight + centerY * CGFloat.init(i) - centerY * 0.5
                label.frame.size = CGSizeMake(45, centerY)
                label.text =  String.init(str)
                label.font = UIFont.systemFontOfSize(10)
                label.textAlignment = .Right
                self.axesData.targetView.addSubview(label)
                if(i == 0){
                   let titleLabel = UILabel()
                   titleLabel.center.x = 25
                   titleLabel.center.y = kChartBottomHeight - 30
                   titleLabel.text = self.axesData.title
                   titleLabel.font = UIFont.systemFontOfSize(10)
                   titleLabel.sizeToFit()
                 self.axesData.targetView.addSubview(titleLabel)
                }
                
            }
        }
    }else{
            let titleLabel = UILabel()
            titleLabel.center.x = 25
            titleLabel.center.y = kChartBottomHeight - 30
            titleLabel.text = self.axesData.title
            titleLabel.font = UIFont.systemFontOfSize(10)
            titleLabel.sizeToFit()
            self.axesData.targetView.addSubview(titleLabel)
        }
        
        
    }
}
