//
//  RecipeCollectionViewController.swift
//  18-RecipePhotoSuper
//
//  Created by Yiqi Wang on 15/11/25.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let reuseHealderIdentifier = "Header"
private let reuseFootIdentifier = "Foot"

class RecipeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
  //flowlayout protocol use to layout!
{

    var mainDishImages = [String]()
    var drinkDessertImages = [String]()
    var recipeImages:NSArray!

  var largePhotoIndexPath : NSIndexPath? {
    didSet {
      var indexPaths = [NSIndexPath]()
      if largePhotoIndexPath != nil {
        indexPaths.append(largePhotoIndexPath!)
      }
      
      collectionView?.performBatchUpdates({
                  self.collectionView?.reloadItemsAtIndexPaths(indexPaths)
                  return
        }, completion:nil
//        {
//          (Value:Bool) in
//          if self.largePhotoIndexPath != nil {
//                        self.collectionView?.scrollToItemAtIndexPath(self.largePhotoIndexPath!, atScrollPosition: .CenteredVertically, animated: true)
//          }
//      }
    )
      
      
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
      
      //register header view
      self.collectionView?.registerClass(RecipeCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseHealderIdentifier)

        // Do any additional setup after loading the view.
      //init Array
      mainDishImages = ["egg_benedict.jpg", "full_breakfast.jpg", "ham_and_cheese_panini.jpg", "ham_and_egg_sandwich.jpg", "hamburger.jpg", "instant_noodle_with_egg.jpg", "japanese_noodle_with_pork.jpg", "mushroom_risotto.jpg", "noodle_with_bbq_pork.jpg", "thai_shrimp_cake.jpg", "vegetable_curry.jpg"]
      
      drinkDessertImages = ["angry_birds_cake.jpg", "creme_brelee.jpg", "green_tea.jpg", "starbucks_coffee.jpg", "white_chocolate_donut.jpg"]
      
      recipeImages = [mainDishImages, drinkDessertImages]
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
  
        return RecipeCell
    }
  
  //section header & foot
  override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionElementKindSectionHeader:
      let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: reuseHealderIdentifier, forIndexPath: indexPath)  as! RecipeCollectionReusableView

      
      headerView.sectionLabel.text = "Header"
      return headerView
    
    case UICollectionElementKindSectionFooter:
      let footView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: reuseFootIdentifier, forIndexPath: indexPath)
      return footView
      
    default:
      assert(false, "unexpected element kind")
    }
  }
  
  
  
  // MARK: UICollectionViewDelegateFlowLayout
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    if indexPath == largePhotoIndexPath {
      print("\(indexPath)")
      return CGSize(width: 110, height: 110)
    }
    else {
      return CGSize(width: 100, height: 100)
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


extension RecipeCollectionViewController  {
  override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    if largePhotoIndexPath == indexPath {
      largePhotoIndexPath = nil
    }
    else {
      largePhotoIndexPath = indexPath
    }
    return false
  }
}
