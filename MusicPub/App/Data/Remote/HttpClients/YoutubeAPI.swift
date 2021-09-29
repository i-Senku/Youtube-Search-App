//
//  YoutubeAPI.swift
//  MusicPub
//
//  Created by Ercan Garip on 22.09.2021.
//

import Foundation

enum YoutubeAPI  : BaseClientGenerator {
    
    
    //MARK: - Routes
    case search(word : String)
    case video(id : String)
    

    var scheme: String { "https" }
    var host: String {"www.googleapis.com"}
    
    var path: String {
        switch self {
        case .search(_):
            return "/youtube/v3/search"
        case .video(_):
            return "/youtube/v3/videos"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        var query : [URLQueryItem]?
        switch self {
        case .search(let word):
            query = [
                URLQueryItem(name: "part", value: "snippet"),
                URLQueryItem(name: "maxResults", value: "20"),
                URLQueryItem(name: "type", value: "video"),
                URLQueryItem(name: "q", value: word)
            ]
        case .video(let videoID):
            query = [
                URLQueryItem(name: "part", value: "snippet,statistics"),
                URLQueryItem(name: "id", value: videoID)
            ]
        }
        query?.append(URLQueryItem(name: "key", value: "AIzaSyBjY9q_zK5FiAoR3pgPfsDMLfCvJRVuWSU"))
        return query
    }
    
    var method: HttpMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var header: [HttpHeader]? {
        switch self {
        default:
            return nil
        }
    }
    
    var body: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
    
}
