//
//  GroceryDetail.swift
//  Grocery_List_v2
//
//  Created by Sarah Chow on 2023-02-21.
//

import SwiftUI

struct GroceryDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var itemName: String = ""
    @State private var itemPrice: Float = 0.00
    @State private var itemDes: String = ""

    var grocery: Grocery
    
    var groceryIndex: Int {
        modelData.groceries.firstIndex(where: { $0.id == grocery.id})!
    }
    
    private let numberFormatter: NumberFormatter

    init(grocery: Grocery) {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        
        self.grocery = grocery
        
    }
    
    var body: some View {
        
        VStack {
            TextField("New Item", text: $itemName)
            TextField("Price", value: $itemPrice, formatter: numberFormatter)
                .keyboardType(.decimalPad)
            
            TextField("Description", text: $itemDes)

            Button {
                addNewItem()
            } label: {
                Text("Add Item")
            }
        }
        .padding(10)
        
        List{
            ForEach(grocery.items, id: \.self){ item in
                
                NavigationLink{
                    ItemDetail(item: item, groceryIndex: groceryIndex)
                } label: {
                    ItemRow(item: item)
                }
            }
            .onDelete(){ indexSet in
                modelData.groceries[groceryIndex].items.remove(atOffsets: indexSet)
            }
        }
    }
    
    func addNewItem(){
        let newItem = Item(id: modelData.groceries[groceryIndex].items
            .last!.id + 1, name: itemName, price: itemPrice, description: itemDes)
        
        if (itemName == "" || itemPrice == 0.00 || itemDes == ""){
            return
        }
        
        modelData.groceries[groceryIndex].items.append(newItem)
        
    }

}

struct GroceryDetail_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        GroceryDetail(grocery: ModelData().groceries[0])
            .environmentObject(modelData)
    }
}
