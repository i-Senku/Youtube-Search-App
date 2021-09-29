//
//  YoutubeService.swift
//  MusicPub
//
//  Created by Ercan Garip on 22.09.2021.
//

import Foundation

struct YoutubeService : YoutubeServiceDataSource {
    func search(
        word: String,
        completion: @escaping (Result<YTSearch, NetworkError>) -> Void) {
        
        NetworkExecuter.shared.execute(
            route: YoutubeAPI.search(word: word),
            responseModel: YTSearch.self,
            completion: completion)
    }
    
    func video(
        videoID: String,
        completion: @escaping (Result<Videos, NetworkError>) -> Void) {
        
        NetworkExecuter.shared.execute(
            route: YoutubeAPI.video(id: videoID),
            responseModel: Videos.self,
            completion: completion)
    }
}
