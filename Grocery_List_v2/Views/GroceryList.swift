//
//  GroceryList.swift
//  Grocery_List_v2
//
//  Created by Sarah Chow on 2023-02-21.
//

import SwiftUI

struct GroceryList: View {
        
    var body: some View {
        NavigationView {
            List {
                
                ForEach(groceries){ grocery in
                    NavigationLink {
                        GroceryDetail(grocery: grocery)
                        
                    } label: {
                        GroceryRow(grocery: grocery)
                    }
                }
            }
            
        }
    }
}

struct GroceryList_Previews: PreviewProvider {
    static var previews: some View {
        GroceryList()
    }
}
