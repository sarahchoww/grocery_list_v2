//
//  Groceries.swift
//  Grocery_List_v2
//
//  Created by Sarah Chow on 2023-02-21.
//

import Foundation
import SwiftUI

struct Grocery: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var date: String
    var items: [Item]

    struct Item: Hashable, Codable, Identifiable {
        var id: String
        var name: String
        var price: Float
        var description: String
    }
    
}
