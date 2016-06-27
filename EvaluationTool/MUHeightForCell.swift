//
//  MUHeightForCell.swift
//  EvaluationTool
//
//  Created by 潘元荣(外包) on 16/6/27.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import UIKit

public enum ViewType {case contentLabel,titleLable,timeLable}
class MUHeightForCell: NSObject {
    
    override init() {
        super.init()
    }
    func heightForCellWithString(string: String , type : ViewType) -> CGFloat {
        var height : CGFloat = 0.0
        let attributeString = NSMutableAttributedString.init(string: string)
        
        let name = NSString.init(string: string)
        if type == .contentLabel {
           attributeString.addAttribute(NSFontAttributeName, value:UIFont.systemFontOfSize(16) , range:NSMakeRange(0, name.length) )
        }else{
           attributeString.addAttribute(NSFontAttributeName, value:UIFont.systemFontOfSize(12) , range:NSMakeRange(0, name.length) )
        }
        attributeString.addAttribute(NSStrokeWidthAttributeName, value: -1.5, range: NSMakeRange(0, name.length))
        let pStyle = NSMutableParagraphStyle.init()
        pStyle.paragraphSpacing = 0.5
        pStyle.lineBreakMode = .ByWordWrapping
 
        attributeString.addAttribute(NSParagraphStyleAttributeName, value:pStyle , range: NSMakeRange(0,name.length))
        
        switch type {
        case .contentLabel:
            let rect = attributeString.boundingRectWithSize(CGSize.init(width: kwidth - 40, height: CGFloat.max), options: .UsesLineFragmentOrigin, context: nil)
            height = rect.size.height
        case .timeLable:
            let rect = attributeString.boundingRectWithSize(CGSize.init(width: CGFloat.max, height: 20), options: .UsesLineFragmentOrigin, context: nil)
            height = rect.size.width
        case .titleLable:
            let rect = attributeString.boundingRectWithSize(CGSize.init(width: kwidth * 0.5, height: CGFloat.max), options: .UsesLineFragmentOrigin, context: nil)
            height = rect.size.height
        }
        
       return height
    }
}
