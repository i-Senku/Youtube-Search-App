//
//  HomeViewModel.swift
//  MusicPub
//
//  Created by Ercan Garip on 22.09.2021.
//

import Foundation

final class HomeViewModel :  HomeViewModelContracts{
    
    weak var delegate: HomeViewModelDelegate?
    var searchItems: [SearchItem] = []
    var youtubeRepository: YoutubeRepositoryContracs
    
    init(_ repo : YoutubeRepositoryContracs) {
        self.youtubeRepository = repo
    }
    
    func search(word: String) {
        clearSearchData()
        self.notify(.setIndicator(true))
        youtubeRepository.search(word: word) { [weak self] result in
            guard let self = self else {return}
            
            self.notify(.setIndicator(false))
            switch result {
            case .success(let searchModel):
                self.searchItems = searchModel.items
                self.notify(.reloadTableView)
                self.notify(.isListEmpty(searchModel.items.isEmpty))
            case .failure(let error):
                self.notify(.searchError(reason: error.message ?? "Error"))
            }
        }
    }
    
    func showVideoDetail(indexPath: IndexPath) {
        delegate?.route(.videoDetail(item: searchItems[indexPath.row
        ]))
    }
    
    func clearSearchData() {
        searchItems = []
        delegate?.handleOutput(output: .reloadTableView)
    }
    
    func searchItemCount() -> Int {
        return searchItems.count
    }
    
    fileprivate func notify(_ output : HomeViewModelOutput){
        delegate?.handleOutput(output: output)
    }
    
}
