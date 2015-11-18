//
//  ViewController.swift
//  9-SegueTest
//
//  Created by Yiqi Wang on 15/11/18.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  let tableviewCellIdentifier = "tableview_cell_identifier"
  let viewcontrollerDetailSegue = "viewcontroller_detail_segue"
  
  var RecipeArray = [Recipe]()
  var recipeNameArray = [String]()
  var recipeImageNameArray = [String]()
  
  @IBOutlet weak var recipeTableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //load data
    recipeNameArray = ["Egg Benedict", "Mushroom Risotto", "Full Breakfast", "Hamburger", "Ham and Egg Sandwich", "Creme Brelee", "White Chocolate Donut", "Starbucks Coffee", "Vegetable Curry", "Instant Noodle with Egg", "Noodle with BBQ Pork", "Japanese Noodle with Pork", "Green Tea", "Thai Shrimp Cake", "Angry Birds Cake", "Ham and Cheese Panini"]
    
    recipeImageNameArray = ["egg_benedict.jpg", "mushroom_risotto.jpg", "full_breakfast.jpg", "hamburger.jpg", "ham_and_egg_sandwich.jpg", "creme_brelee.jpg", "white_chocolate_donut.jpg", "starbucks_coffee.jpg", "vegetable_curry.jpg", "instant_noodle_with_egg.jpg", "noodle_with_bbq_pork.jpg", "japanese_noodle_with_pork.jpg", "green_tea.jpg", "thai_shrimp_cake.jpg", "angry_birds_cake.jpg", "ham_and_cheese_panini.jpg"]
    
    for i in 0 ..< (recipeNameArray.count) {
      let temp = Recipe(name: recipeNameArray[i],
                   imageName: recipeImageNameArray[i])
      RecipeArray.append(temp)
    }
    
    recipeTableView.dataSource = self
    recipeTableView.delegate = self
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return RecipeArray.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier(tableviewCellIdentifier)
    
    if cell == nil {
      cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: tableviewCellIdentifier)
    }
    let retCell = cell as! RecipeCell
    
    retCell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
    retCell.recipeImageView.image = UIImage(named: RecipeArray[indexPath.row].recipeImageName)
    retCell.recipeNameLabel.text = RecipeArray[indexPath.row].recipeName
    
    return retCell
  }

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    /*
    下面的语句若不注释掉 则DetailViewController会awake两次 对于下面这两个语句是不是一个作用 研究下哈
    Normally, segues are initiated automatically and not using this method. However, you can use this method in cases where the segue could not be configured in your storyboard file. For example, you might call it from a custom action handler used in response to shake or accelerometer events.
    */
    
//    self.performSegueWithIdentifier(viewcontrollerDetailSegue, sender: self)
  }
  
  
  /*
  Because segues can be triggered from multiple sources, you can use the information in the segue and sender parameters to disambiguate between different logical paths in your app. For example, if the segue originated from a table view, the sender parameter would identify the table view cell that the user tapped. You could then use that information to set the data on the destination view controller.
  */
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == viewcontrollerDetailSegue {
      let detailViewcontroller = segue.destinationViewController as! DetailViewController

      detailViewcontroller.recipeName = RecipeArray[(self.recipeTableView.indexPathForSelectedRow?.row)!].recipeName
      detailViewcontroller.recipeImageName = RecipeArray[(self.recipeTableView.indexPathForSelectedRow?.row)!].recipeImageName
      /*
      //detailViewcontroller.view.backgroundColor = UIColor.lightGrayColor()
      之所以注释掉上面的语句 下面的就会crash 是因为如果上面的没显示 此时text和imageview都为nil
      detailViewcontroller.detailRecipeName.text = RecipeArray[(self.recipeTableView.indexPathForSelectedRow?.row)!].recipeName
      detailViewcontroller.detailImageView.image = UIImage(named: RecipeArray[(self.recipeTableView.indexPathForSelectedRow?.row)!].recipeImageName)
      */
    }
  }


}

