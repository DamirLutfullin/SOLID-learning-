//
//  AppGroup.swift
//  SOLID(learning)
//
//  Created by Дамир Лутфуллин on 12.02.2020.
//  Copyright © 2020 Damir Lutfullin. All rights reserved.
//

import Foundation

struct AppGroup: Codable {
    let feed : Feed
}

struct Feed: Codable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Codable {
    let artistName: String
    let name: String
    let id: String
}
