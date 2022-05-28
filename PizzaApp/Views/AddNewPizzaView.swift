//
//  AddNewPizzaView.swift
//  PizzaApp
//
//  Created by Chamika Perera on 2022-05-14.
//

import SwiftUI

// Add new pizza view
struct AddNewPizzaView: View {

    @StateObject private var vm: ViewModel = ViewModel()
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Color.gray
                        .opacity(0.2)
                    VStack (alignment: .leading) {
                        TextField("Enter Pizza name", text: $vm.name)
                            .textFieldStyle(.roundedBorder)
                            .padding(.bottom)
                        
                        Text("Enter Ingredients :-")
                            .font(.system(size: 15, weight: Font.Weight.bold))
                            
                        TextEditor(text: $vm.ingredients)
                            .textFieldStyle(.roundedBorder)
                            .frame(height: 200)
                            .padding(.bottom)
                            
                        TextField("Enter Image name", text: $vm.imageName)
                            .textFieldStyle(.roundedBorder)
                            .padding(.bottom)
                            
                        TextField("Enter Image Thumbnail Name", text: $vm.imageName)
                            .textFieldStyle(.roundedBorder)
                            .padding(.bottom)
                        
                        Text("Select Type :-")
                            .font(.system(size: 15, weight: Font.Weight.bold))
                            
                        Picker(selection: $vm.selectedType, label: Text("Category")) {
                            Text("Meat🥩").tag(PizzaType.meat)
                            Text("Veggie🥦").tag(PizzaType.vegetarian)
                        }.pickerStyle(SegmentedPickerStyle()).foregroundColor(Color.orange)
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        Spacer()

                    }.padding()
                }
            }
            .navigationTitle("New Pizza")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button(action: save) {
                        Label("Add", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Label("Cancel", systemImage: "cancel")
                            .labelStyle(.titleOnly)
                    }
                }
            }
            .alert(isPresented: $vm.shouldShowAlert, content: {
                Alert(title: Text("Fill all the Fields"), message: Text(""))
            })
        }
    }
    
    private func save() {
        withAnimation {
            
            if(vm.name.isEmpty || vm.imageName.isEmpty || vm.ingredients.isEmpty) {
                vm.shouldShowAlert = true
            } else {
                vm.savePizza()
                dismiss()
            }
        }
    }
}

struct AddPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPizzaView()
    }
}

