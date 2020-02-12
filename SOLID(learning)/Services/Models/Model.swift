//
//  Model.swift
//  SOLID(learning)
//
//  Created by Дамир Лутфуллин on 12.02.2020.
//  Copyright © 2020 Damir Lutfullin. All rights reserved.
//

import Foundation

struct Model: Codable {
    let userId, id: Int
    let title, body: String
}
