//
//  ViewController.swift
//  Simple Table
//
//  Created by Yiqi Wang on 15/11/16.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
  //datasource
  var tableData = [String]()
  var thumbnails = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    tableData = ["Egg Benedict", "Mushroom Risotto", "Full Breakfast", "Hamburger", "Ham and Egg Sandwich", "Creme Brelee", "White Chocolate Donut", "Starbucks Coffee", "Vegetable Curry", "Instant Noodle with Egg", "Noodle with BBQ Pork", "Japanese Noodle with Pork", "Green Tea", "Thai Shrimp Cake", "Angry Birds Cake", "Ham and Cheese Panini"]
    
    thumbnails = ["egg_benedict.jpg", "mushroom_risotto.jpg", "full_breakfast.jpg", "hamburger.jpg", "ham_and_egg_sandwich.jpg", "creme_brelee.jpg", "white_chocolate_donut.jpg", "starbucks_coffee.jpg", "vegetable_curry.jpg", "instant_noodle_with_egg.jpg", "noodle_with_bbq_pork.jpg", "japanese_noodle_with_pork.jpg", "green_tea.jpg", "thai_shrimp_cake.jpg", "angry_birds_cake.jpg", "ham_and_cheese_panini.jpg"];  }


  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableData.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let simpleTableIdentifier = "SimpleTableItem"
    
    var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier)
    if cell == nil {
      cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: simpleTableIdentifier)
    }
    cell!.imageView!.image = UIImage(named:thumbnails[indexPath.row])
    cell!.textLabel!.text = tableData[indexPath.row]
    
    return cell!
  }
  
  //不能用did 否则checkmark和alert show的时机会晚
  func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    let messageAlert = UIAlertController(title: "Row selected", message: String("You've selected \(indexPath.row) row"), preferredStyle: UIAlertControllerStyle.Alert)
    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil);
    messageAlert.addAction(okAction)
    presentViewController(messageAlert, animated: true, completion: nil)
    
    //show check mark
    let cell = tableView.cellForRowAtIndexPath(indexPath)
    cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
    
    
    //select hightlighted
    tableView.deselectRowAtIndexPath(indexPath, animated:true)
    return nil
  }
}

