//
//  HeaderHorizontalCell.swift
//  AppStore
//
//  Created by Niko Kim on 25.09.2020.
//

import UIKit

class HeaderHorizontalCell: UICollectionViewCell {
  
  let companyLabel = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 12 ))
  let titleLabel = UILabel(text: "Keeping up with friend is faster than ever", font: .systemFont(ofSize: 25))
  
  let imageView = UIImageView(cornerRadius: 12)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    companyLabel.textColor = .blue
    
    titleLabel.numberOfLines = 2
    
    imageView.backgroundColor = .red
    
    let stackView = VerticalStackView(arrangedSubviews: [companyLabel, titleLabel, imageView], spacing: 8)
    addSubview(stackView)
    stackView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
