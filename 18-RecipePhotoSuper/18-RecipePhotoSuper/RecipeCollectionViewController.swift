//
//  RecipeCollectionViewController.swift
//  18-RecipePhotoSuper
//
//  Created by Yiqi Wang on 15/11/25.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class RecipeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
  //flowlayout protocol use to layout!
{

    var mainDishImages = [String]()
    var drinkDessertImages = [String]()
    var recipeImages:NSArray!
  private let sectionInsets = UIEdgeInsets(top: 50, left: 10, bottom: 50, right: 20);
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
      //init Array
      mainDishImages = ["egg_benedict.jpg", "full_breakfast.jpg", "ham_and_cheese_panini.jpg", "ham_and_egg_sandwich.jpg", "hamburger.jpg", "instant_noodle_with_egg.jpg", "japanese_noodle_with_pork.jpg", "mushroom_risotto.jpg", "noodle_with_bbq_pork.jpg", "thai_shrimp_cake.jpg", "vegetable_curry.jpg"]
      
      drinkDessertImages = ["angry_birds_cake.jpg", "creme_brelee.jpg", "green_tea.jpg", "starbucks_coffee.jpg", "white_chocolate_donut.jpg"]
      
      recipeImages = [mainDishImages, drinkDessertImages]
      
      
      //change view color 
      //下面两句 真正改变collectionview的背景色的是第二句
      //更改collectionview的背景才真正显示出来
      //查看文档 collectionview backgroundcolor写的是collectionview的
      //但是如果collectionview的颜色有透明色 会透出view的颜色
      //所以view应该在backgound的下面
//      self.view.backgroundColor = UIColor.redColor()
      self.collectionView?.backgroundColor = UIColor.lightTextColor()
    
    }

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
        return recipeImages.count
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return recipeImages .objectAtIndex(section).count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
    
        // Configure the cell
      
      let RecipeCell = cell as! RecipeCollectionViewCell
      RecipeCell.recipeImageView.image = UIImage(named: recipeImages.objectAtIndex(indexPath.section).objectAtIndex(indexPath.row) as! String)
      
      RecipeCell.backgroundColor = UIColor.whiteColor()
      
    
        return RecipeCell
    }
  
  // MARK: UICollectionViewDelegateFlowLayout
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    if indexPath.row % 2 == 1 {
      return CGSize(width: 123, height: 157)
    } else {
      return CGSize(width: 110, height: 110)
    }
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
