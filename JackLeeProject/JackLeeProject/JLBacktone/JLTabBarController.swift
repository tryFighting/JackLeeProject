//
//  JLTabBarController.swift
//  JackLeeProject
//
//  Created by zrq on 2018/10/17.
//  Copyright © 2018年 com.baidu.www. All rights reserved.
//

import UIKit

class JLTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = UIColor.red
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem.title = "首页"
        homeVC.tabBarItem.image = UIImage(named: "V5FootHome")
        homeVC.tabBarItem.selectedImage = UIImage(named: "V5FootHomeSel")
        
        let searchVC = SearchViewController()
        searchVC.tabBarItem.title = "搜索"
        searchVC.tabBarItem.image = UIImage(named: "V5FootSearch")
        searchVC.tabBarItem.selectedImage = UIImage(named: "V5FootSearchSel")
        
        
        let messageVC = MessageViewController()
        messageVC.tabBarItem.title = "信息"
        messageVC.tabBarItem.image = UIImage(named: "V5FootInfo")
        messageVC.tabBarItem.selectedImage = UIImage(named: "V5FootInfoSel")
        
        let homeNav = createNavigationController(homeVC)
        homeNav.navigationBar.hideBottomHairline()
        let searchNav = createNavigationController(searchVC)
        let messageNav = createNavigationController(messageVC)
        self.viewControllers = [homeNav,searchNav,messageNav]
        
    }
    
    private func createNavigationController(_ rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.barTintColor = UIColor.white
        navigationController.navigationBar.tintColor = UIColor.yellow
        //[self.navigationController.navigationBarsetTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColorwhiteColor],NSFontAttributeName:[UIFontsystemFontOfSize:23.0f]}]
        
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        return navigationController
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
