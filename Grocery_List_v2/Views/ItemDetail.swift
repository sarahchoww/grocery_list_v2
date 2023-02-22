//
//  ItemDetail.swift
//  Grocery_List_v2
//
//  Created by Sarah Chow on 2023-02-21.
//

import SwiftUI

struct ItemDetail: View {
    
    var item: Grocery.Item
    
    var body: some View {
        Text(item.name)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: ModelData().groceries[0].items[0])
    }
}
