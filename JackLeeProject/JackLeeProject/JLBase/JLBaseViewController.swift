//
//  JLBaseViewController.swift
//  JackLeeProject
//
//  Created by zrq on 2018/10/17.
//  Copyright © 2018年 com.baidu.www. All rights reserved.
//

import UIKit

class JLBaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        
        self.navigationController?.navigationBar.isHidden = true
        
        let baseV = Base(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))
        
        baseV.backgroundColor = UIColor.white
        baseV.delegate = self
        baseV.datasource = self
        self.view.addSubview(baseV)
        
        baseV.backgroundColor = baseV.datasource?.navigationBarBackgroundColor(navigationBar: baseV)
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
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
extension JLBaseViewController: BaseViewDataSource{
    func navigationBarTitle(navigationBar: Base) -> NSMutableAttributedString? {
        ///改变文本的颜色
        return nil
    }
    
    func navigationBarBackgroundImage(navigationBar: Base) -> UIImage? {
        ///导航栏的背景图片
        return UIImage(named: "1.png")
    }
    
    func navigationBarBackgroundColor(navigationBar: Base) -> UIColor? {
        ///导航栏的背景颜色
        return UIColor.red
    }
    
    func navigationBarHiddenBottomLine(navigationBar: Base) -> Bool {
        ///导航栏隐藏底部下线
        return false
    }
    
    func navigationBarHeight(navigationBar: Base) -> CGFloat {
        ///设置导航栏的高度
        return 44
    }
    
    func navigationBarLeft(navigationBar: Base) -> UIView {
        ///设置左部视图
        return UIView()
    }
    
    func navigationBarRight(navigationBar: Base) -> UIView {
        return UIView()
    }
    
    func navigationBarMiddle(navigationBar: Base) -> UIView {
        return UIView()
    }
    
    func navigationBarLeftButton(navigationBar: Base, left: UIButton) -> UIImage {
        return UIImage(named: "1.png")!
    }
    
    func navigationBarRightButton(navigationBar: Base, right: UIButton) -> UIImage {
         return UIImage(named: "1.png")!
    }
    
    
}
