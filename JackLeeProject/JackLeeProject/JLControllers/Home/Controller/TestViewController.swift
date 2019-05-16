//
//  TestViewController.swift
//  JackLeeProject
//
//  Created by zrq on 2019/5/16.
//  Copyright © 2019 com.baidu.www. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SnapKit
class jsonModel: NSObject {
    var origin: String = ""
    var url: String = ""
    
    
}
class TestViewController: JLBaseViewController {
    let testView = UIView()
    let view1 = UIView()
    let view2 = UIView()
    
    var dataArray = [jsonModel]()
    lazy var myTableVie: UITableView = {
        var myTableView = UITableView()
        myTableView = UITableView(frame: CGRect(x: 0,y: 64,width: view.bounds.size.width,height: view.bounds.size.height - 64))
        myTableView.delegate = self
        myTableView.dataSource = self
        return myTableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        
        view.addSubview(myTableVie)
        
        requestData()
        
        ///测试自动布局
        //testSnap()
    }
    func testSnap(){
        
        //        testView.backgroundColor = UIColor.cyan
        //        view.addSubview(testView)
        view1.backgroundColor = UIColor.red
        view.addSubview(view1)
        view2.backgroundColor = UIColor.yellow
        view1.addSubview(view2)
    }
    //    override func updateViewConstraints() {
    //       super.updateViewConstraints()
    //    }
    override func viewDidLayoutSubviews() {
        //        testView.snp.makeConstraints { (make) in
        ////            make.width.equalTo(100)
        ////            make.height.equalTo(100)
        //            make.width.height.equalTo(300)//链式语法定义宽高
        //            //make.center.equalTo(view)
        //            make.center.equalToSuperview()
        //        }
        
        ///view2位于view1内，view2位于view1的中心，并且距离view的边距的距离都为20
        //        view1.snp.makeConstraints { (make) in
        //            make.width.height.equalTo(300)
        //            make.top.equalTo(64);
        //            make.left.right.equalTo(0)
        //
        //        }
        //        view2.snp.makeConstraints { (make) in
        //            make.center.equalTo(view1)
        ////            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        //            make.width.lessThanOrEqualTo(300)
        //            make.width.greaterThanOrEqualTo(200)//两个联合使用已这个为准
        //            make.height.equalTo(100)
        //
        //        }
    }
    func requestData() {
        let model = jsonModel()
        //
        let jsons = ["origin":"11111111","url":"BAIDU.COM"]
        
        let jsonDict = JSON(jsons)
        model.origin = jsonDict["origin"].string ?? "IP空值"
        model.url = jsonDict["url"].string ?? "url空值"
        self.dataArray.append(model)
        self.myTableVie.reloadData()
        Alamofire.request("https://www.baidu.com", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            print(response.request ?? "")
            print(response.response ?? "")
            print(response.data ?? "")
            print(response.result)
            if response.result.isSuccess{
                if let jsons = response.result.value{
                    let model = jsonModel()
                    //
                    
                    let jsonDict = JSON(jsons)
                    model.origin = jsonDict["origin"].string ?? "IP空值"
                    model.url = jsonDict["url"].string ?? "url空值"
                    self.dataArray.append(model)
                    self.myTableVie.reloadData()
                    
                }
            }else{
                print(response)
            }
        }
    }
}
extension TestViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var model = jsonModel()
        model = self.dataArray[indexPath.row]
        let identifier = "hhhh"
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        cell.textLabel?.text = model.origin
        cell.detailTextLabel?.text = String(format: "%@这是第\(indexPath.row)个", model.url ?? "")
        //禁止交互
        cell.imageView?.image = UIImage(named: "AskDoctoeEarPart")
        return cell
    }
    
    
}
