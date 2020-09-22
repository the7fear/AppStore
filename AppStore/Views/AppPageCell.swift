//
//  AppPageCell.swift
//  AppStore
//
//  Created by Niko Kim on 20.09.2020.
//

import UIKit

class AppPageCell: UICollectionViewCell {
  
  let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 30))
  
  let horizontalAppsController = HorizontalAppsController()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(titleLabel)
    titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 12, left: 12, bottom: 12, right: 12))
    
    addSubview(horizontalAppsController.view)
    horizontalAppsController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
