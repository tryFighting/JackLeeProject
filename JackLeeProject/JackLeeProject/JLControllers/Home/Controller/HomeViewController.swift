//
//  HomeViewController.swift
//  JackLeeProject
//
//  Created by zrq on 2018/10/17.
//  Copyright © 2018年 com.baidu.www. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SnapKit
import DNSPageView

class HomeViewController: JLBaseViewController {
    override func viewDidLoad() {
        title = "首页"
        view.backgroundColor = UIColor.white
        setupPageStyle()
    }
    func setupPageStyle() {
        ///创建DNSPageStyle，设置样式
        let style = DNSPageStyle()
        style.isTitleScrollEnable = false
        style.isShowBottomLine = true
        style.titleSelectedColor = UIColor.black
        style.titleColor = UIColor.gray
        style.bottomLineColor = UIColor(red: 242/255.0, green: 77/255.0, blue: 51/255.0, alpha: 1)
        style.bottomLineHeight = 2
        
        let titles = ["推荐","分类","VIP","直播","广播"]
        let viewControllers: [UIViewController] = [JLRecommendViewController(),JLClassifyViewController(),JLVIPViewController(),JLLiveViewController(),JLBrocastViewController()]
        for vc in viewControllers {
            self.addChild(vc)
        }
        let pageView = DNSPageView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 64 - 49), style: style, titles: titles, childViewControllers: viewControllers)
        pageView.contentView.backgroundColor = UIColor.red
        view.addSubview(pageView)
    }
}

