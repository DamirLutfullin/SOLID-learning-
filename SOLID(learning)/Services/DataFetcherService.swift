//
//  DataFetcherService.swift
//  SOLID(learning)
//
//  Created by Дамир Лутфуллин on 12.02.2020.
//  Copyright © 2020 Damir Lutfullin. All rights reserved.
//

import Foundation

class DataFetcherService {
    
    let dataFetcher: DataFetcher

    func fetchNewGames(response: @escaping (AppGroup?) -> ()) {
        let newGame = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-game-we-love/all/10/explicit.json"
        dataFetcher.generalFetch(urlString: newGame, response: response)
    }
    
    func fetchFreeGames(response: @escaping (AppGroup?) -> ()) {
        let gameUrl = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free-ipad/all/10/explicit.json"
        dataFetcher.generalFetch(urlString: gameUrl, response: response)
    }
    
    func fetchModels(response: @escaping ([Model]?) -> ()) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        dataFetcher.generalFetch(urlString: urlString, response: response)
    
    }
    
    init(networkDataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = networkDataFetcher
    }
}
