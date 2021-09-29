//
//  VideoCell.swift
//  MusicPub
//
//  Created by Ercan Garip on 20.09.2021.
//

import UIKit
import Kingfisher

final class VideoCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!

    func populate(_ item : SearchItem?){
        let snippet = item?.snippet
        title.text = item?.snippet.title
        thumbnail.kf.setImage(with: snippet?.thumbnails.medium.url)
    }

}
