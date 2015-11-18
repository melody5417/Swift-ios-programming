//
//  Recipe.swift
//  9-SegueTest
//
//  Created by Yiqi Wang on 15/11/18.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit

class Recipe {
  var recipeName:String!
  var recipeImageName:String!
  
  init(name:String, imageName:String) {
    recipeName = name
    recipeImageName = imageName
  }
}

class RecipeCell: UITableViewCell {
  
  @IBOutlet weak var recipeImageView: UIImageView!
  @IBOutlet weak var recipeNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }

}