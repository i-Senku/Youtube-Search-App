//
//  OthersCell.swift
//  MusicPub
//
//  Created by Ercan Garip on 28.09.2021.
//

import UIKit

class OthersCell: UITableViewCell {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var leaginImage: UIImageView!
    
    func populate(title : String?,image : String){
        self.titleText.text = title
        self.leaginImage.image = UIImage(systemName: image)
    }

    
}
