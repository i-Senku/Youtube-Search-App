//
//  StatisticsBar.swift
//  MusicPub
//
//  Created by Ercan Garip on 24.09.2021.
//

import UIKit

@IBDesignable
final class StatisticsBar: UIView {
    
    @IBOutlet weak var likesCount: UILabel!
    @IBOutlet weak var commentsCount: UILabel!
    @IBOutlet weak var dislikesCount: UILabel!
    
    override func awakeFromNib() {
        loadView()
    }
    
    func viewsConfiguration(item : Statistics?){
        if let statistics = item {
            likesCount.text = statistics.likeCount
            commentsCount.text = statistics.commentCount
            dislikesCount.text = statistics.dislikeCount
        }
    }
    
    func loadView() {
        guard let contentView = loadViewFromNib(nibName: "StatisticsBar") else { return }
        contentView.frame = bounds
        addSubview(contentView)
    }
}
