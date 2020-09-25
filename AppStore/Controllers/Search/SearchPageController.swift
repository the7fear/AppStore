//
//  SearchPageController.swift
//  AppStore
//
//  Created by Niko Kim on 25.09.2020.
//

import UIKit

class SearchPageController: BaseController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
  
  fileprivate let cellId = "CellId"
  var searchResults = [Result]()
  let searchController = UISearchController(searchResultsController: nil)
  var timer: Timer?
  
  let enterSearchLabel: UILabel = {
    let label = UILabel()
    label.text = "Please enter a search term above..."
    label.font = .boldSystemFont(ofSize: 20)
    label.textAlignment = .center
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.addSubview(enterSearchLabel)
    enterSearchLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
    
    collectionView.backgroundColor = .white
    collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
    setupSearchBar()
  }
  
  // MARK: - Cell
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    enterSearchLabel.isHidden = searchResults.count != 0
    return searchResults.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
    let searchResult = searchResults[indexPath.item]
    cell.searchResults = searchResult
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 350)
  }
  
  // MARK: - Search
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
    timer?.invalidate()
    timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
      Service.shared.fetchSearchResults(searchText: searchText) { (searchResult, error) in
        self.searchResults = searchResult?.results ?? []
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
      }
    })
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchResults = []
    collectionView.reloadData()
  }
  
  // MARK: - Methods
  
  fileprivate func setupSearchBar() {
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = true
    searchController.searchBar.delegate = self
  }
}
