//
//  VideoDetailViewModel.swift
//  MusicPub
//
//  Created by Ercan Garip on 23.09.2021.
//

import Foundation



class VideoDetailViewModel : VideoDetailViewModelContracts{
    
    var ytRepository: YoutubeRepositoryContracs
    var videoItem: VideosItem?
    weak var delegate: VideoDetailViewModelDelegate?
    var favoriteRepository: FavoriteRepositoryContracts
    
    init(_ ytRepository : YoutubeRepositoryContracs,
         _ favoriteRepository : FavoriteRepositoryContracts) {
        self.favoriteRepository = favoriteRepository
        self.ytRepository = ytRepository
    }
    
    func getVideo(videoID: String) {
        ytRepository.video(videoID: videoID) { [weak self]  result in
            guard let self = self else {return}
            
            switch result {
            case .success(let videoModel):
                if let item = videoModel.items.first {
                    self.videoItem = item
                    self.notify(output: .videoDetail(item: item))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func addFavorite() {
        guard let item = videoItem else { return }
        let favorite = Favorites(
            id : item.id,
            title: item.snippet.title,
            thumbnail: item.snippet.thumbnails.medium.url.absoluteString,
            statistics: item.statistics
        )
        let status = favoriteRepository.addFavorite(item: favorite)
        if status{
            notify(output: .added)
        }
    }
    
    func removeFavorite() {
        guard let item = videoItem else { return }
        let status = favoriteRepository.deleteFavoriteById(id: item.id)
        if status {
            notify(output: .removed)
        }
    }
    
    func favoriteItemIsAvailable(videoID : String) -> Favorites? {
        favoriteRepository.favoriteIsAvailable(primaryKey: videoID)
    }
    
    func share() {
        delegate?.handleOutput(outPut: .shareVideo(link: "https://www.youtube.com/watch?v=\(videoItem!.id)"))
    }
    
    fileprivate func notify(output : VideoDetailViewModelOutput){
        delegate?.handleOutput(outPut: output)
    }
    
}
