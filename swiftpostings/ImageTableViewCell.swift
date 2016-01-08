//
//  ImageTableViewCell.swift
//  swiftpostings
//
//  Created by 易诗尧 on 16/1/7.
//  Copyright © 2016年 yishiyao. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var prepTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
