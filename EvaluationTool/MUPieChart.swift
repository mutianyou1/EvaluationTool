//
//  MUPieChart.swift
//  EvaluationTool
//
//  Created by 潘元荣(外包) on 16/7/27.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import UIKit

class MUPieChartDataItem: NSObject {
    var numberOfParts : Int = 3
    var piePercentArray = [CGFloat]()
    var titles = [String]()
    var strokeColor = UIColor.redColor()
    var fillColor = UIColor.blackColor()
    var title = "abc"
    var lineWidth :CGFloat = 100.0
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
        
    
        var angle :CGFloat = CGFloat.init(M_PI) * (-0.5)
        var _angle :CGFloat = 0.0
        var angleTo :CGFloat = 0.0
        var colorDegree : CGFloat = 0.0
        for(var i = 0; i < pieChartDataItem.titles.count; i++){
            //if( i == 5){
            colorDegree += pieChartDataItem.piePercentArray[i]
            if(i == 0){
              _angle += (pieChartDataItem.piePercentArray[i] * CGFloat.init(M_PI * 2))
            }else{
              _angle += (pieChartDataItem.piePercentArray[i] * CGFloat.init(M_PI * 2))
            }
            if(i == pieChartDataItem.titles.count - 1 ){
                _angle = CGFloat.init(M_PI) * 1.5
               // closeWise = false
            }
            //let toPoint = CGPointMake(kwidth * 0.5 + sin(_angle) * (kwidth * 0.5 - 50.0), kheight * 0.5 - cos(_angle) * (kwidth * 0.5 - 50.0))
            
           // path.addArcWithCenter(CGPointMake(self.bounds.size.width * 0.5 , kheight * 0.5), radius: kwidth * 0.5 - 50.0, startAngle: angle, endAngle: _angle, clockwise: true)
          let color = UIColor(red: colorDegree * 0.9, green: 0.6, blue:0.2, alpha: 1)
               angleTo = _angle
            if(i != self.pieChartDataItem.titles.count - 1){
               angleTo -= CGFloat.init(M_PI_2)
            }
           // if(_angle > CGFloat.init(M_PI)){
            print(i,"xiaoyu")
            self.pieCenterArray.append(CGPointMake(kwidth * 0.5 +  0.5*(kwidth*0.5 - 50)*sin(_angle*0.5) , kheight * 0.5 - 0.5*(kwidth*0.5 - 50)*cos(_angle*0.5)))
           // }
//            else{
//            
//             self.pieCenterArray.append(CGPointMake(kwidth * 0.5 -  0.5*(kwidth*0.5 - 50)*sin(_angle*0.5) , kheight * 0.5 - 0.5*(kwidth*0.5 - 50)*cos(_angle*0.5)))
//            }
          let layer = self.getSubLayer(CGPointMake(kwidth*0.5, kheight*0.5), raduis: kwidth*0.5 - 100, startAngle: angle, endAngle: angleTo , lineWidth: pieChartDataItem.lineWidth, color:color, isCloseWise: true)
            if(i == 0){
               angle = 0
            }
            
            angle = angleTo
            chartLayer.addSublayer(layer)
        }
        
        
        
        for(var i = 0 ; i < self.pieCenterArray.count ; i++){
             let centerPoint = self.pieCenterArray[i]
             let label = UILabel.init()
            label.text = self.pieChartDataItem.titles[i]
            label.center = centerPoint
            //label.backgroundColor = UIColor.redColor()
            label.sizeToFit()
           // print(centerPoint)
            self.addSubview(label)
        }
        
        
        
        
        //动画
        CATransaction.begin()
        let animation = CABasicAnimation.init(keyPath: "strokeEnd")
        animation.duration = 3
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fromValue = 0.0
        animation.toValue = 1.0
        chartLayer.addAnimation(animation, forKey: "maskAnimation")
        CATransaction.commit()
        
        UIGraphicsEndImageContext()
      
        
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
