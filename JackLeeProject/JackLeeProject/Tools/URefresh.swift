//
//  URefresh.swift
//  JackLeeProject
//
//  Created by zrq on 2019/5/31.
//  Copyright © 2019 com.baidu.www. All rights reserved.
//

import Foundation
import UIKit
import MJRefresh
extension UIScrollView{
    var uHead: MJRefreshHeader{
        get {return mj_header}
        set {mj_header = newValue}
    }
    var uFoot: MJRefreshFooter{
        get {return mj_footer}
        set {mj_footer = newValue}
    }
}
class URefreshHeader: MJRefreshGifHeader {
    override func prepare() {
        super.prepare()
        setImages([UIImage(named: "pullToRefresh_0_80x60_")!], for: .idle)
        setImages([UIImage(named: "pullToRefresh_0_80x60_")!], for: .pulling)
        setImages([UIImage(named: "pullToRefresh_0_80x60_")!,
                   UIImage(named: "pullToRefresh_1_80x60_")!,
                   UIImage(named: "pullToRefresh_2_80x60_")!,
                   UIImage(named: "pullToRefresh_3_80x60_")!,
                   UIImage(named: "pullToRefresh_4_80x60_")!,
                   UIImage(named: "pullToRefresh_5_80x60_")!,
                   UIImage(named: "pullToRefresh_6_80x60_")!,
                   UIImage(named: "pullToRefresh_7_80x60_")!,
                   UIImage(named: "pullToRefresh_8_80x60_")!,
                   UIImage(named: "pullToRefresh_9_80x60_")!],
                  for: .refreshing)
        lastUpdatedTimeLabel.isHidden = true
        stateLabel.isHidden = true
    }
}
class URefreshAutoHeader: MJRefreshHeader {}
class URrfreshFooter: MJRefreshBackNormalFooter {}
class URefreshAutoFooter: MJRefreshAutoFooter {}
class URefreshDiscoverFooter: MJRefreshBackGifFooter {
    override func prepare() {
        super.prepare()
        backgroundColor = UIColor.clear
        setImages([UIImage(named: "pullToRefresh_0_80x60_")!], for: .idle)
        stateLabel.isHidden = true
        refreshingBlock = {self.endRefreshing()}
    }
}
class URefreshTipKissFooter: MJRefreshBackFooter {
    lazy var tipLabel: UILabel = {
        let t1 = UILabel()
        t1.textAlignment = .center
        t1.textColor = UIColor.lightGray
        t1.font = UIFont.systemFont(ofSize: 14)
        return t1
    }()
    
    lazy var imageView: UIImageView = {
        let imagev = UIImageView()
        imagev.image = UIImage(named: "pullToRefresh_0_80x60_")
        return imagev
    }()
    override func prepare() {
        super.prepare()
        backgroundColor = UIColor.clear
        mj_h = 240
        addSubview(tipLabel)
        addSubview(imageView)
    }
    override func placeSubviews() {
        tipLabel.frame = CGRect(x: 0, y: 40, width: bounds.width, height: 60)
        imageView.frame = CGRect(x: (bounds.width - 80)/2, y: 110, width: 80, height: 80)
    }
    convenience init(with tip:String) {
        self.init()
        refreshingBlock = {self.endRefreshing()}
        tipLabel.text = tip
    }
}
