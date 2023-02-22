//
//  GroceryDetail.swift
//  Grocery_List_v2
//
//  Created by Sarah Chow on 2023-02-21.
//

import SwiftUI

struct GroceryDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var grocery: Grocery
    
    var groceryIndex: Int {
        modelData.groceries.firstIndex(where: { $0.id == grocery.id})!
    }
    
    
    var body: some View {
        
        List{
            ForEach(grocery.items, id: \.self){ item in
                
                NavigationLink{
                    ItemDetail(item: item)
                } label: {
                    ItemRow(item: item)
                }
            }
            .onDelete(){ indexSet in
                modelData.groceries[groceryIndex].items.remove(atOffsets: indexSet)
            }
        }
    }

}

struct GroceryDetail_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        GroceryDetail(grocery: ModelData().groceries[0])
            .environmentObject(modelData)
    }
}
