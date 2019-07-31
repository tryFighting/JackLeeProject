//
//  Base.swift
//  JackLeeProject
//
//  Created by zrq on 2019/7/25.
//  Copyright © 2019 com.baidu.www. All rights reserved.
//

import UIKit

class Base: UIView {
    var delegate: BaseViewDelegate?
    var backImage: UIImage?
   private var _datasource: BaseViewDataSource?
    
    var datasource: BaseViewDataSource?{
        get{
            return _datasource
        }set{
            _datasource = newValue
            ///数据源协议背景颜色
            self.backgroundColor = self.datasource?.navigationBarBackgroundColor!(navigationBar: self) 
            ///数据源协议是否隐藏分割线
            self.bottomBlackLineView.isHidden = self.datasource?.navigationBarHiddenBottomLine(navigationBar: self) ?? false
            
            ///数据源协议背景图片
            self.backImage = self.datasource?.navigationBarBackgroundImage(navigationBar: self)
             self.layer.contents = self.backImage?.cgImage
            
            ///数据源的文本属性
            self.title = self.datasource?.navigationBarTitle(navigationBar: self)
        }
    }
    var bottomBlackLineView: UIView
    let titleView: UILabel
    let leftView: UIView
    let rightView: UIView
    private var _title: NSMutableAttributedString?
    var title: NSMutableAttributedString?{
        get{
            return _title
        }set{
            _title = newValue
            self.titleView.textColor = UIColor.black
            self.titleView.numberOfLines = 0
            self.titleView.textAlignment = NSTextAlignment.center
            self.titleView.isUserInteractionEnabled = true
            self.titleView.lineBreakMode = NSLineBreakMode.byClipping
            self.titleView.attributedText = _title
        }
    }
    
  
    override init(frame: CGRect) {
        
        self.bottomBlackLineView = UIView()
        self.bottomBlackLineView.backgroundColor = UIColor.red
        self.titleView = UILabel()
        self.titleView.backgroundColor = UIColor.white
        
        self.leftView = UIView()
        self.leftView.backgroundColor = UIColor.white
        
        self.rightView = UIView()
        self.rightView.backgroundColor = UIColor.white
        
        
        super.init(frame: frame)
        
        self.addSubview(self.bottomBlackLineView)
        self.addSubview(self.titleView)
        self.addSubview(self.leftView)
        self.addSubview(self.rightView)
        self.leftView.isUserInteractionEnabled = true
        self.titleView.isUserInteractionEnabled = true
        let left = UITapGestureRecognizer(target: self, action: #selector(click(sender:)))
        self.backgroundColor = UIColor.white
        self.leftView.addGestureRecognizer(left)
        
        let right = UITapGestureRecognizer(target: self, action: #selector(click(sender1:)))
        self.rightView.addGestureRecognizer(right)
        
        let middle = UITapGestureRecognizer(target: self, action: #selector(click(sender2:)))
        self.titleView.addGestureRecognizer(middle)
       
        
        ///设置数据源页面
        setupDataSourceUI()

        
    }
    @objc func click(sender: UITapGestureRecognizer){
        delegate?.leftButton(navigationBar: self, left: sender.view!)
    }
    @objc func click(sender1: UITapGestureRecognizer){
        delegate?.rightButton(navigationBar: self, right: sender1.view!)
    }
    @objc func click(sender2: UITapGestureRecognizer){
        delegate?.titleClickEvent(navigationBar: self, title: sender2.view as! UILabel)
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

extension Base{
    func setupDataSourceUI(){
       
        let time: TimeInterval = 10.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
        
        }
    }
}
