//
//  VideoDetailVC.swift
//  MusicPub
//
//  Created by Ercan Garip on 23.09.2021.
//

import UIKit
import youtube_ios_player_helper

class VideoDetailVC: UIViewController {

    @IBOutlet weak var statisticsBar: StatisticsBar!
    @IBOutlet weak var youtubePlayer: YTPlayerView!
    var videoID : String!
    
    var viewModel : VideoDetailViewModelContracts =
        VideoDetailViewModel(
            YoutubeRepository(ytService: YoutubeService()),
            FavoriteRepository(FavoritesLocalService())
        )
    
    init(coder : NSCoder,videoID : String) {
        self.videoID = videoID
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func showMenu(_ sender: Any) {
        let alertVC = UIAlertController(title: "Menu", message: nil, preferredStyle: .actionSheet)
        let isAvailable = viewModel.favoriteItemIsAvailable(videoID: videoID) != nil
        
        let addFavoriteButton = UIAlertAction(title: isAvailable ? "Remove From Favorites" : "Add to Favorites", style: .default) { _ in
            
            if isAvailable {
                self.viewModel.removeFavorite()
            }else{
                self.viewModel.addFavorite()
            }
            
        }
        let shareButton = UIAlertAction(title: "Share", style: .default) { _ in
            self.viewModel.share()
        }
        let cancelButton = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        
        shareButton.setValue(UIImage(systemName: "square.and.arrow.up",withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), forKey: "image")
        addFavoriteButton.setValue(UIImage(systemName: "heart",withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), forKey: "image")

        cancelButton.setValue(UIColor.red, forKey: "titleTextColor")
        alertVC.addAction(addFavoriteButton)
        alertVC.addAction(shareButton)
        alertVC.addAction(cancelButton)
        present(alertVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        youtubePlayer.load(withVideoId: videoID)
        viewModel.delegate = self
        viewModel.getVideo(videoID: videoID)
    }
}

extension VideoDetailVC : VideoDetailViewModelDelegate {
    func handleOutput(outPut: VideoDetailViewModelOutput) {
        switch outPut {
        
        case .videoDetail(let item):
            statisticsBar.viewsConfiguration(item: item.statistics)
            
        case .shareVideo(let link):
            if let link = NSURL(string: link) {
                let objectsToShare = [link] as [Any]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                self.present(activityVC, animated: true, completion: nil)
            }
            
        case .added :
            showBasicAlert(title: "Added", message: "Added to favorites", actionTitle: "Close")
            
        case .removed :
            showBasicAlert(title: "Removed", message: "Removed from favorites", actionTitle: "Close")
            
        }
    }
}
