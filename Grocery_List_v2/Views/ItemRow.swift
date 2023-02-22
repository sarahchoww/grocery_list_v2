//
//  ItemRow.swift
//  Grocery_List_v2
//
//  Created by Sarah Chow on 2023-02-21.
//

import SwiftUI

struct ItemRow: View {
    
    var item: Grocery.Item
    
    var body: some View {
        Text(item.name)
        
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: groceries[0].items[0])
    }
}
