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
