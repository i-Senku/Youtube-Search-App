//
//  Videos.swift
//  MusicPub
//
//  Created by Ercan Garip on 23.09.2021.
//

import Foundation
import CoreData
import RealmSwift

struct Videos : Decodable{
    let pageInfo : SearchPageInfo
    let items : [VideosItem]
}

//MARK: - Videos Item
public class VideosItem : NSObject, Decodable{
    let kind : String
    let etag : String
    let id : String
    let snippet : Snippet
    let statistics : Statistics
}

//MARK: - Statistics
public class Statistics : Object,Decodable {
    @Persisted var viewCount : String?
    @Persisted var  likeCount : String?
    @Persisted var  dislikeCount : String?
    @Persisted var  favoriteCount : String?
    @Persisted var  commentCount : String?
}
