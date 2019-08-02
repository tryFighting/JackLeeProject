//
//  SearchViewController.swift
//  JackLeeProject
//
//  Created by zrq on 2018/10/17.
//  Copyright © 2018年 com.baidu.www. All rights reserved.
//

import UIKit

class SearchViewController: JLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "搜索"
        // Do any additional setup after loading the view.
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
extension SearchViewController{
    override func navigationBarTitle(navigationBar: Base) -> NSMutableAttributedString? {
        ///改变文本的颜色
        return self.changeTitle(input: "我的搜索")
    }
    override func navUIControllerNeedNavBar(navUIController: JLBaseViewController) -> Bool {
        return true
    }
}

