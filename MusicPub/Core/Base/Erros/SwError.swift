//
//  SwError.swift
//  MusicPub
//
//  Created by Ercan Garip on 22.09.2021.
//

import Foundation

struct SwError : Error{
    let statusCode : Int?
    let message : String?
    let status : Bool
}
