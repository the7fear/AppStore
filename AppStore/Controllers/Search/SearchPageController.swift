//
//  SearchPageController.swift
//  AppStore
//
//  Created by Niko Kim on 25.09.2020.
//

import UIKit

class SearchPageController: BaseController, UICollectionViewDelegateFlowLayout {
  
  fileprivate let cellId = "CellId"
  var searchResults: SearchResults?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .white
    collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
    searchResult()
  }
  
  fileprivate func searchResult() {
    
    Service.shared.fetchSearchResults { (searchResult, error) in
      self.searchResults = searchResult
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return searchResults?.results.count ?? 0
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
    let searchResult = searchResults?.results[indexPath.item]
    cell.searchResults = searchResult
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 350)
  }
}
