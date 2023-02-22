//
//  ItemDetail.swift
//  Grocery_List_v2
//
//  Created by Sarah Chow on 2023-02-21.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var modelData: ModelData

    @State var item: Item
    var groceryIndex: Int
    @State private var itemDes = ""
    

    var body: some View {
        
        VStack{
            Text(item.name)
            Text(String(item.price))
            TextField(item.description, text: $itemDes)
                .multilineTextAlignment(.center)
            
            Button{
                saveDes()
            } label:{
                Text("Save new description")
            }
        }

        
    }
    
    func saveDes(){
        
        if (itemDes == ""){
            return
        }
        
        modelData.groceries[groceryIndex].items[item.id - 1].description = itemDes
        
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: ModelData().groceries[0].items[0], groceryIndex: 0)
    }
}
