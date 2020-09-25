//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Niko Kim on 25.09.2020.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
  
  var searchResults: Result! {
    didSet {
      imageView.sd_setImage(with: URL(string: searchResults.artworkUrl100))
      nameLabel.text = searchResults.trackName
      categoryLabel.text = searchResults.primaryGenreName
      ratingLabel.text = "Rating: \(searchResults.averageUserRating)"
      screenshot1ImageView.sd_setImage(with: URL(string: searchResults.screenshotUrls[0]))
      
      if searchResults.screenshotUrls.count > 2 {
        screenshot2ImageView.sd_setImage(with: URL(string: searchResults.screenshotUrls[1]))
      }
      
      if searchResults.screenshotUrls.count > 3 {
        screenshot3ImageView.sd_setImage(with: URL(string: searchResults.screenshotUrls[2]))
      }
    }
  }
  
  let imageView: UIImageView = {
    let iv = UIImageView()
    iv.constrainWidth(constant: 64)
    iv.constrainHeight(constant: 64)
    iv.layer.cornerRadius = 8
    iv.layer.borderWidth = 1
    iv.layer.borderColor = UIColor(white: 0.5, alpha: 1).cgColor
    iv.clipsToBounds = true
    return iv
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.text = "App name"
    return label
  }()
  
  let categoryLabel: UILabel = {
    let label = UILabel()
    label.text = "Photo & Video"
    return label
  }()
  
  let ratingLabel: UILabel = {
    let label = UILabel()
    label.text = "9.2M"
    return label
  }()
  
  let getButton: UIButton = {
    let button = UIButton()
    button.setTitle("GET", for: .normal)
    button.backgroundColor = UIColor(white: 0.95, alpha: 1)
    button.constrainWidth(constant: 70)
    button.setTitleColor(.blue, for: .normal)
    button.layer.cornerRadius = 14
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    return button
  }()
  
  lazy var screenshot1ImageView = createScreenshots()
  lazy var screenshot2ImageView = createScreenshots()
  lazy var screenshot3ImageView = createScreenshots()
  
  fileprivate func createScreenshots() -> UIImageView {
    let iv = UIImageView()
    iv.layer.borderWidth = 1
    iv.layer.borderColor = UIColor(white: 0.5, alpha: 1).cgColor
    iv.layer.cornerRadius = 8
    iv.clipsToBounds = true
    iv.contentMode = .scaleAspectFill
    return iv
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let labelsStackView = VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingLabel])
    
    let infoStackView = UIStackView(arrangedSubviews: [imageView, labelsStackView, getButton])
    infoStackView.alignment = .center
    infoStackView.spacing = 8
    
    let screeshotStackView = UIStackView(arrangedSubviews: [screenshot1ImageView, screenshot2ImageView, screenshot3ImageView])
    screeshotStackView.spacing = 8
    screeshotStackView.distribution = .fillEqually
    
    let overallStackView = VerticalStackView(arrangedSubviews: [infoStackView, screeshotStackView], spacing: 12)
    
    addSubview(overallStackView)
    overallStackView.fillSuperview(padding: .init(top: 12, left: 12, bottom: 12, right: 12))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
