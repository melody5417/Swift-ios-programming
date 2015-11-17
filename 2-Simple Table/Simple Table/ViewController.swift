//
//  ViewController.swift
//  Simple Table
//
//  Created by Yiqi Wang on 15/11/16.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

/*
代码和storyboard都搞完 run发现没现象 why
需要将tableview的delegate和datasource赋给viewcontroller
*/

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
  //datasource
  var tableData = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    tableData.append("Ham and Egg Sandwich")
    tableData.append("Full Breakfast")
    tableData.append("Egg Benedict")
    tableData.append("Mushroom Risotto")
    tableData.append("Creme Brelee")
    tableData.append("White Chocolate Donut")
    tableData.append("Starbucks Coffee")
    tableData.append("Vegetable Curry")
    tableData.append("Ham and Egg Sandwich")
    tableData.append("Full Breakfast")
    tableData.append("Egg Benedict")
    tableData.append("Mushroom Risotto")
    tableData.append("Creme Brelee")
    tableData.append("White Chocolate Donut")
    tableData.append("Starbucks Coffee")
    tableData.append("Vegetable Curry")
    tableData.append("Ham and Egg Sandwich")
    tableData.append("Full Breakfast")
    tableData.append("Egg Benedict")
    tableData.append("Mushroom Risotto")
    tableData.append("Creme Brelee")
    tableData.append("White Chocolate Donut")
    tableData.append("Starbucks Coffee")
    tableData.append("Vegetable Curry")
    tableData.append("Ham and Egg Sandwich")
    tableData.append("Full Breakfast")
    tableData.append("Egg Benedict")
    tableData.append("Mushroom Risotto")
    tableData.append("Creme Brelee")
    tableData.append("White Chocolate Donut")
    tableData.append("Starbucks Coffee")
    tableData.append("Vegetable Curry")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableData.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let simpleTableIdentifier = "SimpleTableItem"
    
    var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier)
    if cell == nil {
      cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: simpleTableIdentifier)
    }
    
    cell?.textLabel?.text = tableData[indexPath.row]
    return cell!
  }

}

