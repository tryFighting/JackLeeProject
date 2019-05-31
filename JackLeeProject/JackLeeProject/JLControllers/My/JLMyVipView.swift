//
//  JLMyVipView.swift
//  JackLeeProject
//
//  Created by zrq on 2019/5/31.
//  Copyright © 2019 com.baidu.www. All rights reserved.
//

import UIKit

///上下浮动VIP领取view
class JLMyVipView: UIView {

    //图片
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "vip")
        return imageView
    }()
    
    //标题
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "VIP会员"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    // 介绍
    private lazy var desLabel:UILabel = {
        let label = UILabel()
        label.text = "免费领取7天会员"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    //箭头
    private lazy var arrowsLabel: UILabel = {
        let l = UILabel()
        l.text = ">"
        l.font = UIFont.systemFont(ofSize: 20)
        l.textColor = UIColor.gray
        return l
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.imageView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.desLabel)
        self.addSubview(self.arrowsLabel)
    }
    override func layoutSubviews() {
        self.imageView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(5)
            make.width.height.equalTo(30)
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.imageView.snp.right).offset(5)
            make.width.equalTo(100)
            make.height.equalTo(20)
            make.centerY.equalTo(self.imageView)
        }
        self.desLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(5)
            make.top.equalTo(self.imageView.snp.bottom).offset(5)
            make.width.equalTo(180)
            make.height.equalTo(20)
        }
        self.arrowsLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.width.height.equalTo(20)
            make.top.equalTo(20)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
