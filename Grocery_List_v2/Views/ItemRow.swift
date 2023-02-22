//
//  ItemRow.swift
//  Grocery_List_v2
//
//

import SwiftUI

struct ItemRow: View {
    
    @State private var checked = false
    var item: Item
    
    var body: some View {
        HStack{
            CheckboxView(checked: $checked)
            Text(item.name)

        }
        
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: ModelData().groceries[0].items[0])
    }
}
