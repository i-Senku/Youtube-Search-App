//
//  DetailContracts.swift
//  MusicPub
//
//  Created by Ercan Garip on 23.09.2021.
//

import Foundation

protocol VideoDetailViewModelContracts {
    
    var ytRepository : YoutubeRepositoryContracs { get set }
    var favoriteRepository : FavoriteRepositoryContracts { get set }
    var videoItem : VideosItem? { get set }
    var delegate : VideoDetailViewModelDelegate? { get set }
    
    //MARK: - Functions
    func getVideo(videoID : String)
    func share()
    func addFavorite()
    func removeFavorite()
    func favoriteItemIsAvailable(videoID : String) -> Favorites?
}

//MARK: - Outputs
enum VideoDetailViewModelOutput {
    case videoDetail(item : VideosItem)
    case shareVideo(link : String)
    case added
    case removed
}

//MARK: - Delegate
protocol VideoDetailViewModelDelegate : AnyObject {
    func handleOutput(outPut : VideoDetailViewModelOutput)
}
