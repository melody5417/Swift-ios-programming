//
//  RecipeCollectionViewCell.swift
//  18-RecipePhotoSuper
//
//  Created by Yiqi Wang on 15/11/25.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
  var recipeImageView:(UIImageView)!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    recipeImageView = UIImageView.init(frame:CGRect(x: 0, y: 0, width: 100, height: 100))
    self.addSubview(recipeImageView)
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
