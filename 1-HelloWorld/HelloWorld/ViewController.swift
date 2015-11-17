//
//  ViewController.swift
//  HelloWorld
//
//  Created by Yiqi Wang on 15/11/16.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var helloButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func showMessages(sender: AnyObject) {
    let alert = UIAlertController(title: "MyAlert",
      message: "Hello, World!", preferredStyle: UIAlertControllerStyle.Alert)
    
    let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,
      handler: nil)
    alert.addAction(defaultAction)
    self.presentViewController(alert, animated: true, completion: nil)
  }
}

