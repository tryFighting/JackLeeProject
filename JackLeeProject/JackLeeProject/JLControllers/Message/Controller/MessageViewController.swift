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
        title = "消息"
        self.navigationController?.navigationBar.isHidden = true
        let baseV = Base(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))
        self.view.addSubview(baseV)
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
