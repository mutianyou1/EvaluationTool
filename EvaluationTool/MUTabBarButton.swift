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
    
   override init(frame: CGRect) {
        super.init(frame: frame)
    
    }

   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    


}
