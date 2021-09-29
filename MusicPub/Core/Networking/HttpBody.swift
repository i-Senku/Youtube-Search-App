//
//  HttpBody.swift
//  MusicPub
//
//  Created by Ercan Garip on 29.09.2021.
//

import Foundation

enum HttpBody {
    case data(name : String,value : Any)
    
    func toData() -> [String : Any]{
        switch self {
        case .data(let key, let value):
            return [key : value]
        }
    }
}
