//
//  YoutubeServiceDataSource.swift
//  MusicPub
//
//  Created by Ercan Garip on 22.09.2021.
//

import Foundation

protocol YoutubeServiceDataSource {
    
    func search(
        word : String,
        completion : @escaping (Result<YTSearch,NetworkError>) -> Void)
    
    func video(
        videoID : String,
        completion : @escaping(Result<Videos,NetworkError>)->Void)
    
}
