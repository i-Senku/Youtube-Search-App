//
//  SearchItem.swift
//  MusicPub
//
//  Created by Ercan Garip on 22.09.2021.
//

import Foundation

//MARK: - Search Item
struct SearchItem : Decodable{
    let kind : String
    let etag : String
    let id : SearchItemID
    let snippet : Snippet
}

//MARK: - Item ID
struct SearchItemID  : Decodable {
    let kind : String
    let videoId : String
}

// MARK: - Snippet
struct Snippet: Decodable {
    let publishedAt: String
    let channelId, title, description: String
    let thumbnails: Thumbnails
    let channelTitle, liveBroadcastContent: String
    let publishTime: String?
}

// MARK: - Thumbnails
struct Thumbnails: Decodable {
    let medium, high: Default
}

// MARK: - Default
struct Default: Decodable {
    let url: URL
    let width, height: Int
}

