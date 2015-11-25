//
//  RecipeCollectionReusableView.swift
//  18-RecipePhotoSuper
//
//  Created by Yiqi Wang on 15/11/25.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit

class RecipeCollectionReusableView: UICollectionReusableView {
  var sectionLabel:UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    sectionLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    sectionLabel.textAlignment = NSTextAlignment.Center
    sectionLabel.backgroundColor = UIColor.redColor()
    self.addSubview(sectionLabel)
  }

  //会执行下面的语句 就是因为没有registerClass
  
  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
}
