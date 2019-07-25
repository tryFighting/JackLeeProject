//
//  JLMyController.swift
//  JackLeeProject
//
//  Created by zrq on 2019/5/31.
//  Copyright © 2019 com.baidu.www. All rights reserved.
//

import UIKit

class JLMyController: UIViewController {

    private let LBFMMineMakeCellID = "LBFMMineMakeCell"
    private let LBFMMineShopCellID = "LBFMMineShopCell"
    
    private lazy var dataSource: Array = {
        return [[["icon":"钱数", "title": "分享赚钱"],
                 ["icon":"沙漏", "title": "免流量服务"]],
                [["icon":"扫一扫", "title": "扫一扫"],
                 ["icon":"月亮", "title": "夜间模式"]],
                [["icon":"意见反馈", "title": "帮助与反馈"]]]
    }()
    ///懒加载顶部头视图
   private lazy var headView: JLMyHeadView = {
        let v1 = JLMyHeadView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300))
        v1.delegate = self
        return v1
    }()
    ///懒加载tableview
    private lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame:CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height), style: UITableView.Style.plain)
        tableView.contentInset = UIEdgeInsets(top: -CGFloat(64), left: 0, bottom: 0, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.red
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: LBFMMineMakeCellID)
        tableView.tableHeaderView = headView
        return tableView
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.headView.setAnimationVipView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.headView.stopAnimation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "我的"
        view.addSubview(self.tableView)
    }

}
extension JLMyController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 || section == 2 {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 100
        }else {
            return 44
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: LBFMMineMakeCellID, for: indexPath) as! MyTableViewCell
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.selectionStyle = .none
            let sectionArray = dataSource[indexPath.section-1]
            let dict: [String: String] = sectionArray[indexPath.row]
            cell.imageView?.image =  UIImage(named: dict["icon"] ?? "")
            cell.textLabel?.text = dict["title"]
            if indexPath.section == 3 && indexPath.row == 1{
                let cellSwitch = UISwitch.init()
                cell.accessoryView = cellSwitch
            }else {
                cell.accessoryType = .disclosureIndicator
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.red
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.red
        return headerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ///测试算法
        test()
    }
    
}

/// 归并排序
/*
 归并排序是创建在归并操作上的一种有序的排序算法，效率为O(nlogn)
 该算法是采用分治法递归可以同时进行，归并操作也叫归并算法，指的是将两个已经排序好的序列合并成一个序列的操作，归并操作也叫归并归并算法，指的是将两个已经排好序的序列合并成一个序列的操作。归并排序算法依赖归并操作
 思路：
 1.将序列每两个数字进行归并操作，形成floor(n/2)个序列，排序后每个序列包含两个元素
 2.将上述序列再次归并，形成floor(n/4)个序列，每个序列包含四个元素
 3.重复步骤2，直到所有元素排序完毕
 
 */
fileprivate func test(){
    
}
extension JLMyController: JLMyHeadViewDelegate{
    func shopBtnClick(tag: Int) {
        
    }
}
