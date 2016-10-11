//
//  ViewController.swift
//  TableViewExplore
//
//  Created by 徐开源 on 2016/10/11.
//  Copyright © 2016年 kyxu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var tableData = [String]()
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableData = ["0", "1", "2", "3"]
    }
    
    @IBAction func update(_ sender: AnyObject) {
        tableData.append("\(tableData.count)")
        tableData.append("\(tableData.count)")
        print("-----")
        tableView.beginUpdates()
        let indexPaths = [IndexPath(row: tableData.count-2, section: 0), IndexPath(row: tableData.count-1, section: 0)]
        tableView.insertRows(at: indexPaths, with: UITableViewRowAnimation.automatic)
        tableView.endUpdates()
//        tableView.reloadData()
        print("-----")
    }
    
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number of rows")
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cell for row\(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
     numberOfRows 方法调用：都只调用一次 numberOfRows 方法
     
     cellForRow 方法调用次数：reloadData 会为当前显示的所有cell调用这个方法，updates 只会为新增的cell调用这个方法
     cellForRow 方法调用时间：reloadData 会在 numberOfRows 方法调用后的某一时间异步调用 cellForRow 方法，updates 会在 numberOfRows 方法调用后马上调用 cellForRow 方法
     
     reloadData 方法缺陷：带来额外的不必要开销，缺乏动画
     updates 方法缺陷：deleteRows 不会调用 cellForRow 方法，可能导致显示结果与数据源不一致；需要手动保证 insertRows、deleteRows 之后，row 的数量与 numberOfRows 的结果一致，否则会运行时崩溃
     */
    
    
    
    
}
