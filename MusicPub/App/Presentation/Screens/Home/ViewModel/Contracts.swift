//
//  Contracts.swift
//  MusicPub
//
//  Created by Ercan Garip on 22.09.2021.
//

import Foundation

protocol HomeViewModelContracts {
    var searchItems : [SearchItem] { get set }
    var youtubeRepository : YoutubeRepositoryContracs { get set }
    var delegate : HomeViewModelDelegate? { get set }
    
    //MARK: - Functions
    func search(word : String)
    func clearSearchData()
    func searchItemCount() -> Int
    func showVideoDetail(indexPath : IndexPath)
}

//MARK: - Routes
enum HomeViewModelRoutes {
    case videoDetail(item : SearchItem)
}

//MARK: - Outputs
enum HomeViewModelOutput {
    case reloadTableView
    case searchError(reason : String)
    case setIndicator(_ : Bool)
    case isListEmpty(Bool)
}

//MARK: - Delegates
protocol HomeViewModelDelegate : AnyObject {
    func handleOutput(output : HomeViewModelOutput)
    func route(_ route : HomeViewModelRoutes)
}
