//
//  MUTabBarButton.swift
//  EvaluationTool
//
//  Created by mutianyou1 on 16/6/25.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import UIKit

class MUTabBarButton: UIControl {
    private lazy var tabBarItem = UITabBarItem()
    private lazy var badgeLabel = UILabel()
    private lazy var imageView = UIImageView()
    private lazy var titleLabel = UILabel()
    var isSelect = true
   override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.contentMode = .Center
    }
    func setTabBarItme(item : UITabBarItem) {
         tabBarItem = item
        if item.badgeValue?.isEmpty == false {
          badgeLabel.text = item.badgeValue
          badgeLabel.frame = CGRectMake(self.bounds.size.width * 0.5 , 0, 15, 15)
          badgeLabel.layer.cornerRadius = 7.5
          badgeLabel.clipsToBounds = true
          badgeLabel.textAlignment = .Center
          badgeLabel.backgroundColor = UIColor.redColor()
          badgeLabel.textColor = UIColor.whiteColor()
        }
        titleLabel.text = item.title
        titleLabel.font = UIFont.systemFontOfSize(8)
        titleLabel.textColor = UIColor.lightGrayColor()
        titleLabel.frame = CGRectMake(0, 30, self.bounds.size.width, 19)
        titleLabel.textAlignment = .Center
    }
    func setIsSelected(selected : Bool) {
    
        imageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)
        if selected == true {
            imageView.image = tabBarItem.selectedImage
            isSelect = true
            imageView.backgroundColor = UIColor.redColor();
        }else{
            imageView.image = tabBarItem.image
            isSelect = false
            imageView.backgroundColor = UIColor.lightGrayColor();
        }
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(badgeLabel)
    }
   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    


}
