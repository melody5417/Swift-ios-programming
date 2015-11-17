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
  
    //find out the path of plist
    let path = NSBundle.mainBundle().pathForResource("tableDataPlist", ofType: "plist")
    
    //load the file content and read the data into arrays
    let dict = NSDictionary(contentsOfFile: path!)
    
    if dict!.objectForKey("tableData") != nil {
      tableData = dict!.objectForKey("tableData") as! [String]
    }
    if dict!.objectForKey("thumbnails") != nil {
    thumbnails = dict!.objectForKey("thumbnails")as! [String]
    }
  
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

