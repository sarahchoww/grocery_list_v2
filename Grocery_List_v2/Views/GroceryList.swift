//
//  GroceryList.swift
//  Grocery_List_v2
//
//  Created by Sarah Chow on 2023-02-21.
//

import SwiftUI

struct GroceryList: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var groceries: [Grocery] {
        modelData.groceries
    }
    
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
                .onDelete(){ indexSet in
                    modelData.groceries.remove(atOffsets: indexSet)
                }

            }

        }
    }
    
    
}

struct GroceryList_Previews: PreviewProvider {
    static var previews: some View {
        GroceryList()
            .environmentObject(ModelData())
    }
}
