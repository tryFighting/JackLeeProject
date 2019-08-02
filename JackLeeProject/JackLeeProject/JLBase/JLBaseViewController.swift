//
//  JLBaseViewController.swift
//  JackLeeProject
//
//  Created by zrq on 2018/10/17.
//  Copyright © 2018年 com.baidu.www. All rights reserved.
//

import UIKit
@objc protocol BaseUIViewControllerDataSource {
    @objc optional func navUIControllerNeedNavBar(navUIController: JLBaseViewController) -> Bool
}
class JLBaseViewController: UIViewController {
    lazy var baseV: Base = {
        let base = Base(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 0))
        base.isHidden = !navUIControllerNeedNavBar(navUIController: self)
        base.backgroundColor = UIColor.white
        base.delegate = self
        base.datasource = self
        return base
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(baseV)
        setupNavigationBar()
        self.title = "我是基础类"
        self.navigationController?.navigationBar.isHidden = true
    }
    //MARK:视图即将出现
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    //MARK:视图已经消失
    override func viewDidDisappear(_ animated: Bool) {
       super.viewDidDisappear(animated)
    }
    func setupNavigationBar() -> () {
        let askImage = UIImage(named: "V5TopAsk")
        let askButton = UIButton.init(type: .custom)
        askButton.frame = CGRect.init(x: 0, y: 0, width: 46, height: 46)
        askButton.setImage(askImage, for: .normal)
        askButton.addTarget(self, action: #selector(JLBaseViewController.askDoctorButtonItemOnTapped), for: .touchUpInside)
        let rightButtonItem = UIBarButtonItem.init(customView: askButton)
        navigationItem.rightBarButtonItem = rightButtonItem
        
    }

}

extension JLBaseViewController {
    @objc func askDoctorButtonItemOnTapped(_ sender: UIBarButtonItem) {
        // Subclass implement
    }
}
extension JLBaseViewController: BaseViewDelegate{
    func titleClickEvent(navigationBar: Base, title: UILabel) {
        print(navigationBar)
        print(title)
    }
    
    func rightButton(navigationBar: Base, right: UIView) {
        print(navigationBar)
        print(right)
    }
    
    func leftButton(navigationBar: Base, left: UIView) {
        print(navigationBar)
        print(left)
    }
}
extension JLBaseViewController: BaseUIViewControllerDataSource{
    func navUIControllerNeedNavBar(navUIController: JLBaseViewController) -> Bool {
        return true
    }
}
extension JLBaseViewController: BaseViewDataSource{
    func navigationBarTitle(navigationBar: Base) -> NSMutableAttributedString? {
        ///改变文本的颜色
        return self.changeTitle(input: self.title ?? self.navigationItem.title ?? "")
    }
    func changeTitle(input: String) -> NSMutableAttributedString?{
        let title: NSMutableAttributedString = NSMutableAttributedString(string: input)
        title.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], range: NSMakeRange(0,title.length))
        title.addAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)], range: NSMakeRange(0,title.length))
        return title
    }
    func navigationBarBackgroundImage(navigationBar: Base) -> UIImage? {
        ///导航栏的背景图片
        return nil
    }
    
    func navigationBarBackgroundColor(navigationBar: Base) -> UIColor? {
        ///导航栏的背景颜色
        return UIColor.white
    }
    
    func navigationBarHiddenBottomLine(navigationBar: Base) -> Bool {
        ///导航栏隐藏底部下线
        return false
    }
    
    func navigationBarHeight(navigationBar: Base) -> CGFloat {
        ///设置导航栏的高度
        
        return UIApplication.shared.statusBarFrame.height + 44;
    }
    
    func navigationBarLeft(navigationBar: Base) -> UIView? {
        ///设置左部视图
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))

        let left = UIView.init(frame: CGRect(x: 10, y: 20, width: 30, height: 30))
        left.backgroundColor = UIColor.green
        view.addSubview(left)

        let click: UIButton = UIButton(frame: CGRect(x: 100, y: 20, width: 30, height: 30))
        click.backgroundColor = UIColor.red
        view.addSubview(click)
        return view
    }
    
    func navigationBarRight(navigationBar: Base) -> UIView? {
        let right = UIView.init(frame: CGRect(x:0, y: 20, width: 30, height: 30))
        right.backgroundColor = UIColor.yellow
        return nil
    }
    
    func navigationBarMiddle(navigationBar: Base) -> UIView? {
        return nil
    }
    
    func navigationBarLeftButton(navigationBar: Base, left: UIButton) -> UIImage {
        return UIImage(named: "1.png")!
    }
    
    func navigationBarRightButton(navigationBar: Base, right: UIButton) -> UIImage {
         return UIImage(named: "1.png")!
    }
    
    
}
