//
//  GroceryRow.swift
//  Grocery_List_v2
//
//

import SwiftUI

struct GroceryRow: View {
    
    var grocery: Grocery
    
    var body: some View {
        
        HStack {
            Text(grocery.name)
            
        }
    }
}

struct GroceryRow_Previews: PreviewProvider {
    
    
    static var previews: some View {
        GroceryRow(grocery: ModelData().groceries[0])
    }
}
