//
//  MessageViewController.swift
//  JackLeeProject
//
//  Created by zrq on 2018/10/17.
//  Copyright © 2018年 com.baidu.www. All rights reserved.
//

import UIKit

class MessageViewController: JLBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "消息"
    //self.navigationController?.navigationBar.isHidden = true
        
    }

}
extension MessageViewController{
   override func navigationBarBackgroundColor(navigationBar: Base) -> UIColor? {
        return UIColor.white
    }
   override func navigationBarHiddenBottomLine(navigationBar: Base) -> Bool {
        return true
    }
   override func navigationBarTitle(navigationBar: Base) -> NSMutableAttributedString? {
        ///改变文本的颜色
        return self.changeTitle(input: "我的消息")
    }
    override func navigationBarBackgroundImage(navigationBar: Base) -> UIImage? {
        return UIImage(named: "1.png")
    }
    override func leftButton(navigationBar: Base, left: UIView) {
        let web = JLBaseWebController()
        web.loadUrlString = "http://www.baidu.com"
        self.navigationController?.pushViewController(web, animated: true)
    }
}
