//
//  FavoriteCell.swift
//  MusicPub
//
//  Created by Ercan Garip on 27.09.2021.
//

import Foundation
import UIKit
import Kingfisher

final class FavoriteCell : UITableViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    func populate(item : Favorites){
        if let thumbnailURL = URL(string: item.thumbnail){
            DispatchQueue.main.async {
                self.thumbnail.kf.setImage(with: thumbnailURL,options: [
                    .processor(DownsamplingImageProcessor(size: CGSize(width: self.thumbnail.bounds.width, height: self.thumbnail.bounds.height))),
                    .scaleFactor(UIScreen.main.scale),
                    .cacheOriginalImage
                ])
            }
        }
        title.text = item.title
    }
}
