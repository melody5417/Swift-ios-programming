//
//  ViewController.swift
//  CustomizeTableViewCell
//
//  Created by Yiqi Wang on 15/11/16.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

  var tableData = [String]()
  var thumbnails = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    tableData = ["Egg Benedict", "Mushroom Risotto", "Full Breakfast", "Hamburger", "Ham and Egg Sandwich", "Creme Brelee", "White Chocolate Donut", "Starbucks Coffee", "Vegetable Curry", "Instant Noodle with Egg", "Noodle with BBQ Pork", "Japanese Noodle with Pork", "Green Tea", "Thai Shrimp Cake", "Angry Birds Cake", "Ham and Cheese Panini"]
    
    thumbnails = ["egg_benedict.jpg", "mushroom_risotto.jpg", "full_breakfast.jpg", "hamburger.jpg", "ham_and_egg_sandwich.jpg", "creme_brelee.jpg", "white_chocolate_donut.jpg", "starbucks_coffee.jpg", "vegetable_curry.jpg", "instant_noodle_with_egg.jpg", "noodle_with_bbq_pork.jpg", "japanese_noodle_with_pork.jpg", "green_tea.jpg", "thai_shrimp_cake.jpg", "angry_birds_cake.jpg", "ham_and_cheese_panini.jpg"];
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let tableIdentifier = "tableIdentifier"
    
    var cell = tableView.dequeueReusableCellWithIdentifier(tableIdentifier)
    if cell == nil {
      cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: tableIdentifier)
    }
    cell?.textLabel?.text = tableData[indexPath.row]
    cell?.imageView?.image = UIImage(named: thumbnails[indexPath.row])
    
    return cell!
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableData.count
  }

}

