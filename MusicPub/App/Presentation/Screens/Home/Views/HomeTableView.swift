//
//  HomeTableView.swift
//  MusicPub
//
//  Created by Ercan Garip on 20.09.2021.
//

import UIKit
final class HomeTableView: UITableView {
    
    var viewModel : HomeViewModelContracts!
    
    override func awakeFromNib() {
        register(UINib(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "videoCell")
        delegate = self
        dataSource = self
    }
}

extension  HomeTableView : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchItemCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell") as! VideoCell
        cell.populate(viewModel.searchItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showVideoDetail(indexPath: indexPath)
    }
}
