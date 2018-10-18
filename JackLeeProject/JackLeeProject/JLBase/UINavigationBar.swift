//
//  UINavigationBar.swift
//  JackLeeProject
//
//  Created by zrq on 2018/10/18.
//  Copyright © 2018年 com.baidu.www. All rights reserved.
//

import Foundation
import UIKit
extension UIToolbar{
    func hideHairline() {
        let navigationBarImageView = hairlineImageViewInToolbar(self)
        navigationBarImageView!.isHidden = true
    }
    
    func showHairline() {
        let navigationBarImageView = hairlineImageViewInToolbar(self)
        navigationBarImageView!.isHidden = false
    }
    
    fileprivate func hairlineImageViewInToolbar(_ view: UIView) -> UIImageView? {
        if view.isKind(of: UIImageView.self) && view.bounds.height <= 1.0 {
            return (view as! UIImageView)
        }
        
        let subviews = (view.subviews as [UIView])
        for subview: UIView in subviews {
            if let imageView: UIImageView = hairlineImageViewInToolbar(subview) {
                return imageView
            }
        }
        
        return nil
    }
}
extension UINavigationBar{
    /// 隐藏分割线
    func hideBottomHairline() -> () {
        let navigationBarImageView = hairlineImageViewInNavigationBar(self)
        navigationBarImageView?.isHidden = true
        
    }
    /// 显示分割线
    func showBottomHairLine() {
        let navigationBarImageView = hairlineImageViewInNavigationBar(self)
        navigationBarImageView!.isHidden = false
    }
    fileprivate func hairlineImageViewInNavigationBar(_ view: UIView) -> UIImageView? {
        if view.isKind(of: UIImageView.self) && view.bounds.height <= 1.0{
            return (view as! UIImageView)
        }
        let subviews = (view.subviews as [UIView])
        for subview: UIView in subviews {
            if let imageView = hairlineImageViewInNavigationBar(subview){
                 return imageView
            }
        }
        return nil
    }
}
