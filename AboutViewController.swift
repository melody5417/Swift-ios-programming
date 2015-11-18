//
//  AboutViewController.swift
//  9-SegueTest
//
//  Created by Yiqi Wang on 15/11/18.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit
import Foundation

class AboutViewController: UIViewController {

  @IBOutlet weak var aboutWebView: UIWebView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("about.html", ofType:nil )!)
      let request = NSURLRequest(URL: url)
      aboutWebView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
