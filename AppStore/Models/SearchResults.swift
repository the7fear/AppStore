//
//  SearchResults.swift
//  AppStore
//
//  Created by Niko Kim on 26.09.2020.
//

import UIKit

struct SearchResults: Decodable {
  let resultCount: Int
  let results: [Result]
}

struct Result: Decodable {
  let trackName: String
  let primaryGenreName: String
  let averageUserRating: Float
  let artworkUrl100: String
  let screenshotUrls: [String]
}
