//
//  FavoriteTableView.swift
//  MusicPub
//
//  Created by Ercan Garip on 27.09.2021.
//

import UIKit

final class FavoriteTableView: UITableView {
    
    var viewModel : FavoriteViewModelContracts?

    override func awakeFromNib() {
        register(UINib(nibName: "FavoriteCell", bundle: nil), forCellReuseIdentifier: "FavoriteCell")
        delegate = self
        dataSource = self
    }
}

extension FavoriteTableView : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.favoriteList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell") as! FavoriteCell
        if let item = viewModel?.favoriteList[indexPath.row] {
            cell.populate(item: item)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectItem(indexPath)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [weak self] action, view, swipe in
            guard let self = self else {return}
            self.viewModel?.deleteFavorite(indexPath: indexPath)
            swipe(true)
        }
        let swipe = UISwipeActionsConfiguration(actions: [action])
        
        return swipe
    }
    
}
