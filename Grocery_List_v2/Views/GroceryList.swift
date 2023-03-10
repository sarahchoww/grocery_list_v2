//
//  GroceryList.swift
//  Grocery_List_v2
//
//

import SwiftUI

struct GroceryList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var name: String = ""
    @State private var date: String = "current date"

    
    var groceries: [Grocery] {
        modelData.groceries
    }
    
    var body: some View {
        
        NavigationView {
            VStack{
                
                HStack {
                    TextField("Name", text: $name)
                    
                    Button{
                        addNewList()
                    } label: {
                        Text("Add List")
                    }
                }.padding()
            
            
                
                List {
                    ForEach(groceries){ grocery in
                        
                        Section(header: Text(grocery.date)) {
                            NavigationLink {
                                GroceryDetail(grocery: grocery)
                                
                            } label: {
                                GroceryRow(grocery: grocery)
                            }
                        }
                        

                    }
                    .onDelete(){ indexSet in
                        modelData.groceries.remove(atOffsets: indexSet)
                    }

                }

            }
        }
    }
    
    func addNewList(){
        let newList = Grocery(id: modelData.groceries.last!.id + 1, name: self.name, date: self.date, items: [])
        
        modelData.groceries.append(newList)
        
    }
    
}

struct GroceryList_Previews: PreviewProvider {
    static var previews: some View {
        GroceryList()
            .environmentObject(ModelData())
    }
}
