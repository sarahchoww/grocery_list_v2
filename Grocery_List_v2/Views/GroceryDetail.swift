//
//  GroceryDetail.swift
//  Grocery_List_v2
//
//  Created by Sarah Chow on 2023-02-21.
//

import SwiftUI

struct GroceryDetail: View {
    
    var grocery: Grocery
    
    var body: some View {
        
        List {
            ForEach(grocery.items){ item in
                
                NavigationLink{
                    ItemDetail(item: item)
                } label: {
                    ItemRow(item: item)
                }
                
            }
        }
    }
}

struct GroceryDetail_Previews: PreviewProvider {
    static var previews: some View {
        GroceryDetail(grocery: groceries[0])
    }
}
