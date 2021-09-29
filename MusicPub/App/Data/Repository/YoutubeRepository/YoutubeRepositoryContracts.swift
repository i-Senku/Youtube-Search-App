//
//  SearchRepositoryContracts.swift
//  MusicPub
//
//  Created by Ercan Garip on 22.09.2021.
//

import Foundation

protocol YoutubeRepositoryContracs {
    func search(word : String,completion : @escaping (Result<YTSearch,SwError>)-> Void
    )
    
    func video(videoID : String,completion : @escaping (Result<Videos,SwError>) -> Void)
}
