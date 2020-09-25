//
//  HorizontalAppCell.swift
//  AppStore
//
//  Created by Niko Kim on 22.09.2020.
//

import UIKit

class HorizontalAppCell: UICollectionViewCell {
  
  let imageView = UIImageView(cornerRadius: 8)
  
  let nameLabel = UILabel(text: "App name", font: .systemFont(ofSize: 18))
  let companyName = UILabel(text: "Company name", font: .systemFont(ofSize: 14))
  
  let getButton = UIButton(title: "GET", cornerRadius: 14)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    imageView.backgroundColor = .purple
    imageView.constrainWidth(constant: 64)
    imageView.constrainHeight(constant: 64)
    
    getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
    getButton.setTitleColor(.blue, for: .normal)
    getButton.constrainWidth(constant: 70)
    
    let labelsStackView = VerticalStackView(arrangedSubviews: [nameLabel, companyName], spacing: 2)
    
    let stackView = UIStackView(arrangedSubviews: [imageView, labelsStackView, getButton])
    stackView.alignment = .center
    stackView.spacing = 8
    addSubview(stackView)
    stackView.fillSuperview()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
