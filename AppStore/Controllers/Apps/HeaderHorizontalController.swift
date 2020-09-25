//
//  HeaderHorizontalController.swift
//  AppStore
//
//  Created by Niko Kim on 25.09.2020.
//

import UIKit

class HeaderHorizontalController: BaseController, UICollectionViewDelegateFlowLayout {
  
  fileprivate let cellId = "CellId"
  var socialApps = [SocialApp]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .white
    collectionView.register(HeaderHorizontalCell.self, forCellWithReuseIdentifier: cellId)
    
    if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
      layout.scrollDirection = .horizontal
    }
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
