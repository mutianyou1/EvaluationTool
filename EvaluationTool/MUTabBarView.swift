//
//  MUTabBarView.swift
//  EvaluationTool
//
//  Created by mutianyou1 on 16/6/25.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import UIKit
import Foundation

class MUTabBarView: UIView {
 
    private lazy var items = [UITabBarItem]()
    private var viewBlock = ({ (index:NSInteger) -> Void in})
   override  init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
    }
    func setItmes(itemsArray : NSArray) {
       self.items = itemsArray as! [UITabBarItem]
        var width : CGFloat = self.bounds.size.width
        width /= CGFloat.init(itemsArray.count)
        var rect_x  : CGFloat = 0.0
        for item in itemsArray {
            rect_x = CGFloat.init(itemsArray.indexOfObject(item))
            rect_x *= width
            let button = MUTabBarButton.init(frame: CGRectMake(rect_x, 0, width, self.bounds.size.height))
            button.setTabBarItme(item as! UITabBarItem)
            button.tag = itemsArray.indexOfObject(item) + 1
            button.addTarget(self, action: "clickItem:", forControlEvents: .TouchUpInside)
            if button.tag == 2 {
               button.setIsSelected(true)
            }else{
               button.setIsSelected(false)
            }
            self.addSubview(button)
        }
     
    }
    func setSelectedBlock(block : (index : NSInteger) -> Void) {
      viewBlock = block
    }
    @objc
    private func clickItem(button:MUTabBarButton) {
        button.setIsSelected(true)
        for index in 1...items.count {
             let item = self.viewWithTag(index) as! MUTabBarButton
            if  index != button.tag && item.isSelect == true {
                item.setIsSelected(false)
            }
            
        }
        viewBlock(button.tag)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   

}
