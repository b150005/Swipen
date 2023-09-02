//
//  Item.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/02.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
