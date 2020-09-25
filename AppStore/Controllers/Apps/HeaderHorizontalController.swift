//
//  HeaderHorizontalController.swift
//  AppStore
//
//  Created by Niko Kim on 25.09.2020.
//

import UIKit

class HeaderHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
  
  fileprivate let cellId = "CellId"
  var socialApps = [SocialApp]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .white
    collectionView.register(HeaderHorizontalCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.contentInset = .init(top: 0, left: 12, bottom: 0, right: 12)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return socialApps.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HeaderHorizontalCell
    let socialApp = socialApps[indexPath.item]
    cell.companyLabel.text = socialApp.name
    cell.titleLabel.text = socialApp.tagline
    cell.imageView.sd_setImage(with: URL(string: socialApp.imageUrl))
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width - 48, height: 300)
  }
}
