//
//  ViewController.swift
//  9-SegueTest
//
//  Created by Yiqi Wang on 15/11/18.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

/*
拖拽search bar and search display controller 一定要拖到合适的位置 会自动嵌进去哒
*/

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate {

  let tableviewCellIdentifier = "tableview_cell_identifier"
  let viewcontrollerDetailSegue = "viewcontroller_detail_segue"
  
  var RecipeArray = [Recipe]()
  var recipeNameArray = [String]()
  var recipeImageNameArray = [String]()
  var searchArray = [Recipe]()
  
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

  func recipeNamesForSearchText(searchText: String) {
    // Filter the array using the filter method
    self.searchArray = self.RecipeArray.filter({(recipe : Recipe) -> Bool in
      let nameMatch = recipe.recipeName.rangeOfString(searchText)
      return nameMatch != nil
    })
  }
  
  
  //设置区域的行数（重点），这个就是使用委托之后需要判断是否需要使用search后的视图
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == self.searchDisplayController!.searchResultsTableView {
      return self.searchArray.count
    } else {
      return self.RecipeArray.count
    }
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier(tableviewCellIdentifier)
    
    if cell == nil {
      cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: tableviewCellIdentifier)
    }

    // Check to see whether the normal table or search results table
    //is being displayed and set the Candy object from the appropriate array
    if tableView == self.searchDisplayController!.searchResultsTableView {
      let recipe:Recipe = searchArray[indexPath.row]
      cell!.accessoryType = UITableViewCellAccessoryType.None
      cell!.textLabel?.text = recipe.recipeName
      cell!.imageView?.image = UIImage(named: recipe.recipeImageName)
      return cell!
    } else {
      let retCell = cell as! RecipeCell
      retCell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
      retCell.recipeImageView.image = UIImage(named: RecipeArray[indexPath.row].recipeImageName)
      retCell.recipeNameLabel.text = RecipeArray[indexPath.row].recipeName
      return retCell
    }
}
  

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == viewcontrollerDetailSegue {
      let detailViewcontroller = segue.destinationViewController as! DetailViewController

      detailViewcontroller.recipeName = RecipeArray[(self.recipeTableView.indexPathForSelectedRow?.row)!].recipeName
      detailViewcontroller.recipeImageName = RecipeArray[(self.recipeTableView.indexPathForSelectedRow?.row)!].recipeImageName
    }
  }
  
  //searchbar delegate
  func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool {
    recipeNamesForSearchText(searchString!)
    return true
  }
  
  func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
    recipeNamesForSearchText(self.searchDisplayController!.searchBar.text!)
    return true
  }
  
  
  
  


}

