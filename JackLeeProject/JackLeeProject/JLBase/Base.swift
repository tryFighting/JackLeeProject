//
//  Base.swift
//  JackLeeProject
//
//  Created by zrq on 2019/7/25.
//  Copyright © 2019 com.baidu.www. All rights reserved.
//

import UIKit
protocol BaseViewDataSource {
    func navigationBarTitle(navigationBar: Base) -> NSMutableAttributedString?
    func navigationBarBackgroundImage(navigationBar: Base) -> UIImage?
    func navigationBarBackgroundColor(navigationBar: Base) -> UIColor?
    func navigationBarHiddenBottomLine(navigationBar: Base) -> Bool
    func navigationBarHeight(navigationBar: Base) -> CGFloat
    
    func navigationBarLeft(navigationBar: Base) -> UIView
    func navigationBarRight(navigationBar: Base) -> UIView
    func navigationBarMiddle(navigationBar: Base) -> UIView
    func navigationBarLeftButton(navigationBar: Base,left: UIButton) -> UIImage
    func navigationBarRightButton(navigationBar: Base,right: UIButton) -> UIImage
}
protocol BaseViewDelegate {
    func leftButton(navigationBar: Base,left: UIButton)
    func rightButton(navigationBar: Base,right: UIButton)
    func titleClickEvent(navigationBar: Base,title: UILabel)
}
class Base: UIView {
    var bottomBlackLineView: UIView
    let titleView: UIView
    let leftView: UIView
    let rightView: UIView
//    let title: NSMutableAttributedString
//    weak var dataSource: BaseViewDataSource?
//    weak var delegate: BaseViewDelegate?
//    let backImage: UIImage?
    override init(frame: CGRect) {
        
        self.bottomBlackLineView = UIView()
        self.bottomBlackLineView.backgroundColor = UIColor.red
        
        self.titleView = UIView()
        self.titleView.backgroundColor = UIColor.yellow
        
        self.leftView = UIView()
        self.leftView.backgroundColor = UIColor.blue
        
        self.rightView = UIView()
        self.rightView.backgroundColor = UIColor.green
        
        
        
        super.init(frame: frame)
        self.addSubview(self.bottomBlackLineView)
        self.addSubview(self.titleView)
        self.addSubview(self.leftView)
        self.addSubview(self.rightView)
        self.leftView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(click))
        self.backgroundColor = UIColor.white
        self.leftView.addGestureRecognizer(tap)
    }
    @objc func click(){
       print("点击了左侧")
    }
    override func layoutSubviews() {
        self.bottomBlackLineView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(63.5)
            make.bottom.equalTo(0.5)
        }
        self.titleView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(self.bounds.size.width/2)
            make.height.equalTo(self.bounds.size.height/2)
        }
        self.leftView.snp.makeConstraints { (make) in
            make.top.left.equalTo(10)
            make.width.height.equalTo(50)
        }
        self.rightView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(-10)
            make.width.height.equalTo(50)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

