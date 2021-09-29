//
//  YTSearch.swift
//  MusicPub
//
//  Created by Ercan Garip on 22.09.2021.
//

import Foundation

struct YTSearch : Decodable{
    let regionCode : String?
    let etag : String
    let nextPageToken : String?
    let items : [SearchItem]
    let pageInfo : SearchPageInfo
}
