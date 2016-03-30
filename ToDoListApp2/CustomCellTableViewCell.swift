//
//  CustomCellTableViewCell.swift
//  ToDoListApp2
//
//  Created by Mac on 3/26/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageViewOutlet: UIImageView!
    @IBOutlet weak var lblTask: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var ViewInCellOutlet: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       self.photoImageViewOutlet.layer.cornerRadius = 7
       self.photoImageViewOutlet.clipsToBounds = true
    }



}
