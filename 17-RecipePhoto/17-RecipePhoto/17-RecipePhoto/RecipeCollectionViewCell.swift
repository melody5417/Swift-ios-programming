//
//  RecipeCollectionViewCell.swift
//  17-RecipePhoto
//
//  Created by Yiqi Wang on 15/11/24.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var imageView: UIImageView!
  var recipeImageView:UIImageView!;
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    recipeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
    recipeImageView.contentMode = UIViewContentMode.ScaleToFill
    contentView.addSubview(recipeImageView)
    
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
}
