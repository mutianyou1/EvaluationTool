//
//  MUPieChart.swift
//  EvaluationTool
//
//  Created by 潘元荣(外包) on 16/7/27.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import UIKit

class MUPieChartDataItem: NSObject {
    
    var piePercentArray = [CGFloat]()
    var titles = [String]()
    var strokeColor = UIColor.redColor()
    var fillColor = UIColor.blackColor()
    var title = "abc"
    var lineWidth :CGFloat = 80.0
}
class MUPieChart: MUChart {

    let pieChartDataItem = MUPieChartDataItem()
    private lazy var pieCenterArray = [CGPoint]()
    private let startAngle = 0.0
    override func stroke() {
        //绘图
        let chartLayer = CAShapeLayer.init()
        chartLayer.backgroundColor = UIColor.clearColor().CGColor
        self.layer.addSublayer(chartLayer)
        UIGraphicsBeginImageContext(self.frame.size)
        
        //起始位置
        var angle :CGFloat = CGFloat.init(M_PI) * (-0.5)
        //累计角度
        var _angle :CGFloat = 0.0
        //结束角度
        var angleTo :CGFloat = 0.0
        //色彩
        var colorDegree : CGFloat = 0.0
        for(var i = 0; i < pieChartDataItem.titles.count; i++){
            //中心角度
            let originX = kwidth * 0.5 +  (kwidth*0.5 - 100.0)*sin(_angle+(pieChartDataItem.piePercentArray[i] * CGFloat.init(M_PI * 1)))
            
            let originY = kheight * 0.5 - (kwidth*0.5 - 100)*cos(_angle+(pieChartDataItem.piePercentArray[i] * CGFloat.init(M_PI * 1)))
            
            self.pieCenterArray.append(CGPointMake(originX ,originY))
            
            colorDegree += pieChartDataItem.piePercentArray[i]
            
            _angle += (pieChartDataItem.piePercentArray[i] * CGFloat.init(M_PI * 2))
            
            if(i == pieChartDataItem.titles.count - 1 ){
                _angle = CGFloat.init(M_PI) * 1.5
            }
            
            let color = UIColor(red: colorDegree * 0.9, green: 0.6, blue:0.2, alpha: 1)
            
            angleTo = _angle
            
            if(i != self.pieChartDataItem.titles.count - 1){
                angleTo -= CGFloat.init(M_PI_2)
            }
          //大圆形外正方形计算 w = raduis*2 +pieChartDataItem.lineWidth
          //白色圆形外的正方形 计算：w = radius*2 - pieChartDataItem.lineWidth
           let layer = self.getSubLayer(CGPointMake(kwidth*0.5, kheight*0.5), raduis: kwidth*0.5 - 100, startAngle: angle, endAngle: angleTo , lineWidth: pieChartDataItem.lineWidth , color:color, isCloseWise: true)
            if(i == 0){
               angle = 0
            }
            angle = angleTo
            chartLayer.addSublayer(layer)
        }
        
        
        
        
        
        //mask
        let maskLayer = self.getSubLayer(CGPointMake(kwidth*0.5, kheight*0.5), raduis: kwidth*0.5 - 100, startAngle: -CGFloat(M_PI) / 2, endAngle: CGFloat(M_PI) * 2 - CGFloat(M_PI) / 2, lineWidth: pieChartDataItem.lineWidth, color: UIColor.redColor(), isCloseWise: true)
        maskLayer.strokeStart = 0.0
        maskLayer.strokeEnd = 1.0
        
        
        
        //动画
        //CATransaction.begin()
        let animation = CABasicAnimation.init(keyPath: "strokeEnd")
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.removedOnCompletion = true
        maskLayer.addAnimation(animation, forKey: "maskAnimation")
        chartLayer.mask = maskLayer
        
        UIGraphicsEndImageContext()
      
        for(var i = 0 ; i < self.pieCenterArray.count; i++){
            let centerPoint = self.pieCenterArray[i]
            let label = UILabel.init()
            label.text = self.pieChartDataItem.titles[i]
            label.font = UIFont.systemFontOfSize(20)
            label.textColor = UIColor.whiteColor()
            //label.backgroundColor = UIColor.redColor()
             label.sizeToFit()
            label.center = centerPoint
            label.alpha = 0.0
            
            UIView.animateWithDuration(NSTimeInterval.init(2), animations: { () -> Void in
                label.alpha = 1
            })
            self.addSubview(label)
        }
    }
    func getSubLayer(center:CGPoint,raduis:CGFloat,startAngle:CGFloat,endAngle:CGFloat, lineWidth:CGFloat, color:UIColor ,isCloseWise:Bool)->CAShapeLayer{
        let layer = CAShapeLayer.init()
        layer.lineCap = kCALineCapButt
        layer.lineWidth = pieChartDataItem.lineWidth
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = color.CGColor
        layer.backgroundColor = UIColor.clearColor().CGColor
        layer.strokeStart = 0.0
        layer.strokeEnd = 1.0
        
        
        let path = UIBezierPath.init()
        path.lineWidth = lineWidth
        
        path.addArcWithCenter(center, radius: raduis, startAngle: startAngle, endAngle: endAngle, clockwise: isCloseWise)
        layer.path = path.CGPath
        path.stroke()
       
        return  layer
    }
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let axes = MUChartAxesData()
        axes.isShowAxes = false
        axes.isShowXDegrees = false
        axes.isShowYDegrees = false
        axes.targetView = self
        axes.title = pieChartDataItem.title
        let chartAxes = MUChartAxes.init(data: axes)
        chartAxes.stroke(UIGraphicsGetCurrentContext()!)
    }


}
