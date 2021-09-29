//
//  SearchRepository.swift
//  MusicPub
//
//  Created by Ercan Garip on 22.09.2021.
//

import Foundation

struct YoutubeRepository: YoutubeRepositoryContracs {
    
    let ytService : YoutubeServiceDataSource
    
    func search(
        word: String,
        completion: @escaping (Result<YTSearch, SwError>) -> Void) {
        ytService.search(word: word) { result in
            switch result {
            case .success(let searchModel):
                completion(.success(searchModel))
            case .failure(_):
                completion(.failure(SwError(statusCode: nil, message: "Search Error", status: false)))
            }
        }
    }
    
    
    func video(
        videoID: String,
        completion: @escaping (Result<Videos, SwError>) -> Void) {
        ytService.video(videoID: videoID) { result in
            switch result {
            case .success(let searchModel):
                completion(.success(searchModel))
            case .failure(_):
                completion(.failure(.init( statusCode: nil, message: "Video Error", status: false)))
            }
        }
    }
    
    
}
