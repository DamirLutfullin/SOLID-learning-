//
//  DataStorage.swift
//  SOLID(learning)
//
//  Created by Дамир Лутфуллин on 11.02.2020.
//  Copyright © 2020 Damir Lutfullin. All rights reserved.
//

import Foundation

class DataStorage {
    
    // сохраняем данные в кеше / базе данных
    func saveNameInCache(name: String) {
        print("\(name) is saved")
    }
    
    // получаем данные из кеша / базы данных
    func getNameFromCahce() -> String {
        return "Some name"
    }
    
    
}
