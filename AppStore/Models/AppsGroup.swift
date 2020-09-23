//
//  AppsGroup.swift
//  AppStore
//
//  Created by Niko Kim on 23.09.2020.
//

import UIKit

struct AppsGroups: Decodable {
  let feed: Feed
}

struct Feed: Decodable {
  let title: String
  let results: [Results]
}

struct Results: Decodable {
  let artistName, name, artworkUrl100: String
}
