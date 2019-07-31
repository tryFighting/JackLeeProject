//
//  Protocol.swift
//  JackLeeProject
//
//  Created by zrq on 2019/7/31.
//  Copyright © 2019 com.baidu.www. All rights reserved.
//

import Foundation
import UIKit
@objc protocol BaseViewDataSource: NSObjectProtocol{
    func navigationBarTitle(navigationBar: Base) -> NSMutableAttributedString?
    func navigationBarBackgroundImage(navigationBar: Base) -> UIImage?
    @objc optional func navigationBarBackgroundColor(navigationBar: Base) -> UIColor?
    func navigationBarHiddenBottomLine(navigationBar: Base) -> Bool
    func navigationBarHeight(navigationBar: Base) -> CGFloat
    
    func navigationBarLeft(navigationBar: Base) -> UIView
    func navigationBarRight(navigationBar: Base) -> UIView
    func navigationBarMiddle(navigationBar: Base) -> UIView
    func navigationBarLeftButton(navigationBar: Base,left: UIButton) -> UIImage
    func navigationBarRightButton(navigationBar: Base,right: UIButton) -> UIImage
}
@objc protocol BaseViewDelegate {
    func leftButton(navigationBar: Base,left: UIView)
    func rightButton(navigationBar: Base,right: UIView)
    func titleClickEvent(navigationBar: Base,title: UILabel)
}
