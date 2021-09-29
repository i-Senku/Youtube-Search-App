//
//  SearchBar.swift
//  MusicPub
//
//  Created by Ercan Garip on 22.09.2021.
//

import UIKit

final class SearchBar: UISearchBar {
    
    var viewModel : HomeViewModelContracts?
    
    override func awakeFromNib() {
        delegate = self
    }
}

extension SearchBar : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text{
            if !searchText.isEmpty {
                viewModel?.search(word: searchText)
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            viewModel?.clearSearchData()
        }
    }
    
}
