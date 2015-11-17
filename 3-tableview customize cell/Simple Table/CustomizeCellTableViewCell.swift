//
//  CustomizeCellTableViewCell.swift
//  Simple Table
//
//  Created by Yiqi Wang on 15/11/16.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit

class CustomizeCellTableViewCell: UITableViewCell {

  @IBOutlet weak var thumbnailImageView: UIImageView!
  
  @IBOutlet weak var imageNameLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
