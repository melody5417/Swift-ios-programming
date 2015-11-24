//
//  RecipeCollectionViewController.swift
//  17-RecipePhoto
//
//  Created by Yiqi Wang on 15/11/24.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//
/*
collectionView真的是折磨 好奇怪的赶脚哈
一. 第一次 仅是自定义了RecipeCollectionViewController 绑定到storeyboard上 然后显示 但是怎么都显示 因为没有重写
  section 所以默认返回了0.

所以搞明白 collectionviewdatasource 必须实现3个方法：
1.override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int { 
感觉这个就相当于论文分几章
2.override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> 
感觉这个就是一章包含几段哈
3.override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
这个就和tableview的一样啦

二：改完这个 将cell设置背景色可以正常显示啦

三：想要自定义RecipeCollectionViewCell 绑定了storeyboard 但是我擦 还是不好使
let recipeCell = cell as! RecipeCollectionViewCell 这个转换不成功
后来发现viewDidLoad中的这个方法
self.collectionView!.registerClass(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
然后注册后 ok啦

四：在cell中的storeyboard中添加imageview 创建iboutlet到RecipeCollectionViewCell中 然后在cellForItemAtIndexPath
中给imageview设置image 但是显示iamgeview返回nil 为啥！ 后来stackoverflow后 让删掉注册的这个代码
self.collectionView!.registerClass(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier) 然后ok啦

五：后来想在Cell里自定义一个recipeImageView
然后在init中创建，然后自动生成了一个init未执行的报错， 然后运行crash 
必须把注册的代码加上 才可以正常运行。

六总结：
感觉自定义collectionviewcell 就是两种方法
1.programmatically 需要注册
2.xib 不能注册
然后这两种方法不能兼用

*/

import UIKit

private let reuseIdentifier = "Cell"

class RecipeCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

  @IBOutlet weak var recipeCellOutlet: RecipeCollectionViewCell!
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
      return 8
  }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
    
        // Configure the cell
      let recipeCell = cell as! RecipeCollectionViewCell
      //first return nil because didn't registerClass in awakfromnib
      recipeCell.recipeImageView.image = UIImage(named: "1")
//      recipeCell.imageView.image = UIImage(named: "1")

      
      return recipeCell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
