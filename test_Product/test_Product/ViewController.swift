//
//  TestNetViewController.swift
//  test_Product
//
//  Created by 孟凡君 on 2020/12/15.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    var array = ["item1", "item2", "item3", "item4", "item5", "item6", "item7"]
    var someArray = [Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("是否已经进入控制器啦")
        // 在这里延迟5秒做网络请求  并缓存数据
        let deadline = DispatchTime.now() + 5.0
        print("start")
        DispatchQueue.global().asyncAfter(deadline: deadline) {
            
            TestModel.requestFun(succ: {(model) in
                self.someArray = model
                print("网络请求成功了")
                
                self.tableView.reloadData()
                
            }) { (errStr) in
                print("失败了")
            }
        }
        
        // 创建tableview列表
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    private lazy var tableView: UITableView = {
        let tab = UITableView(frame: CGRect.zero, style: .plain)
        tab.backgroundColor = UIColor.white
        tab.separatorStyle = UITableViewCell.SeparatorStyle.none
        tab.showsVerticalScrollIndicator = false
        tab.tableFooterView = UIView()
        tab.dataSource = self
        tab.delegate = self
        // 注册重用
        tab.register(TestNetTableViewCell.self, forCellReuseIdentifier: "reuse")
        return tab
    }()

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        print(self.someArray.count)
        return self.someArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// 定义一个cell
        let str: String = "reuse"

        var cell: TestNetTableViewCell = tableView.dequeueReusableCell(withIdentifier: str, for: indexPath) as! TestNetTableViewCell
        if cell.isEqual(nil) {
            cell = TestNetTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: str)
        }
        /**
         cell赋值
         */
        let obj:[String:String] = self.someArray[indexPath.row] as! [String : String]
        cell.TitleLbl.text = obj["key"]
        cell.detailLabel.text = obj["value"]
        return cell
    }

    /**
     row的高度 方法
     */
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 76
    }
}
