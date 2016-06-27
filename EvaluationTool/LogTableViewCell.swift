//
//  LogTableViewCell.swift
//  EvaluationTool
//
//  Created by 潘元荣(外包) on 16/6/27.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import UIKit

class LogTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    private let dateLabel = UILabel()
    var logData = PersonLogData()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  override  init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.frame = CGRectZero
        contentLabel.frame = CGRectZero
        dateLabel.frame = CGRectZero
        titleLabel.textAlignment = .Left
        contentLabel.textAlignment = .Left
        dateLabel.textAlignment = .Right
        titleLabel.numberOfLines = 0
        contentLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFontOfSize(12)
        dateLabel.font = titleLabel.font
        contentLabel.font = UIFont.systemFontOfSize(16)
        contentLabel.layer.cornerRadius = 3
        contentLabel.layer.borderColor = UIColor.lightGrayColor().CGColor
        contentLabel.layer.borderWidth = 0.5
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(contentLabel)
        self.contentView.addSubview(dateLabel)
    }
    func setPersonLogData (log :PersonLogData) {
       logData = log
       let heightModle = MUHeightForCell.init()
       let titleHeigt = heightModle.heightForCellWithString(log.logTitle, type: ViewType.titleLable)
      let contentHeight = heightModle.heightForCellWithString(log.logContent, type: ViewType.contentLabel)
      let timeWidth = heightModle.heightForCellWithString(log.logTime, type: ViewType.timeLable)
       titleLabel.frame = CGRectMake(20, 0, kwidth * 0.5, titleHeigt)
       contentLabel.frame = CGRectMake(20, titleHeigt + 10, kwidth - 40, contentHeight)
       dateLabel.frame = CGRectMake(kwidth - 20 - timeWidth, 0, timeWidth, 20)
       titleLabel.text = log.logTitle
       dateLabel.text = log.logTime
       contentLabel.text = log.logContent
        
    }
  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
