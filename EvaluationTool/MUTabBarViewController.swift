//
//  MUTabBarViewController.swift
//  EvaluationTool
//
//  Created by mutianyou1 on 16/6/25.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import UIKit

class MUTabBarViewController: UITabBarController {
    private lazy var vcs = [UITabBarItem]()
    private let tabBarView = MUTabBarView.init(frame: CGRectMake(0, kheight - 49, kwidth, 49))
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarView.layer.borderColor = UIColor.lightGrayColor().CGColor
        tabBarView.layer.borderWidth = 0.5
        self.view.addSubview(tabBarView)
        self.tabBar.hidden = true
    }
    override func setViewControllers(viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        vcs.removeAll()
        for vc in viewControllers!{
            vcs.append(vc.tabBarItem)
        }
        tabBarView.setItmes(vcs)
        tabBarView.setSelectedBlock { (index) -> Void in
            self.clickChooseTabbar(index)
        }
        self.selectedIndex = 1
    }
    private func clickChooseTabbar(index : NSInteger) {
        if self.selectedIndex + 1 == index {
            return
        }
      self.selectedIndex = index - 1
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
