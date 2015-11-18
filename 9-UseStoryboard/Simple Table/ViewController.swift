//
//  ViewController.swift
//  Simple Table
//
//  Created by Yiqi Wang on 15/11/16.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//
/*
最开始照着教程试了很多遍 但是都不能成功切换到下个viewcontroller
后来在stackoverflow里找到了答案 爱死stack！
个人总结成功切换vc的三大要素：
1.在xib里成功设置segue 并且一定要记住identifier
2.点选某行或者要切换到下一个vc的button performSegueWithIdentifier("segue", sender: self)
3.prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
*/

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
  //datasource
  var tableData = [String]()
  var thumbnails = [String]()
  
  let showIndexSegue = "showindex"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    tableData = ["Egg Benedict", "Mushroom Risotto", "Full Breakfast", "Hamburger", "Ham and Egg Sandwich", "Creme Brelee", "White Chocolate Donut", "Starbucks Coffee", "Vegetable Curry", "Instant Noodle with Egg", "Noodle with BBQ Pork", "Japanese Noodle with Pork", "Green Tea", "Thai Shrimp Cake", "Angry Birds Cake", "Ham and Cheese Panini"]
    
    thumbnails = ["egg_benedict.jpg", "mushroom_risotto.jpg", "full_breakfast.jpg", "hamburger.jpg", "ham_and_egg_sandwich.jpg", "creme_brelee.jpg", "white_chocolate_donut.jpg", "starbucks_coffee.jpg", "vegetable_curry.jpg", "instant_noodle_with_egg.jpg", "noodle_with_bbq_pork.jpg", "japanese_noodle_with_pork.jpg", "green_tea.jpg", "thai_shrimp_cake.jpg", "angry_birds_cake.jpg", "ham_and_cheese_panini.jpg"];
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
    cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
    cell!.imageView!.image = UIImage(named:thumbnails[indexPath.row])
    cell!.textLabel!.text = tableData[indexPath.row]
    
    return cell!
  }

  func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    //select hightlighted
    tableView.deselectRowAtIndexPath(indexPath, animated:true)
    
    //segue
    self.performSegueWithIdentifier("segue", sender: self)
    
    return nil
  }
  
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let vc = segue.destinationViewController
    //just for test
    vc.view.backgroundColor = UIColor.blueColor()
    
  }
  
  //delete row
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    //delete data
    tableData.removeAtIndex(indexPath.row)
    thumbnails.removeAtIndex(indexPath.row)
    
    //reload tableview datasource 
    //this example only remove array not plist
    tableView.reloadData()
  }
}

