//
//  ProductInfoDisplays.swift
//  CarbonFoodPrint
//
//  Created by csuftitan on 6/28/22.
//

import Foundation
import SwiftUI


struct BananaViewer: View {
    @SceneStorage("productNameBana") var productNameBana: String = "Banana"
    @SceneStorage("productDescripBana") var productDescripBana: String = "Current Price: $2.00"
    //@Binding var TheBunch: Int
    //@Binding var TheList: String
    @EnvironmentObject var man: ProductManager
    @Binding var cost: Int
    var body: some View {
        VStack {
            
            Text("Information for Banana")
                .font(.headline)
                .padding(.bottom, 30)
            HStack {
                Text("Current Price: $2.00")
                /*
                ForEach(man.products) {
                    product in
                    VStack (alignment: .leading) {
                        Text(product.name)
                            .font(.largeTitle)
                        Text(product.description)
                            .font(.caption)
                    }
                }
                 */
                
                Spacer()
            }
            Button(action: {
                man.products.append(Product(name: productNameBana, description: productDescripBana))
                cost += 2
            }) {
                Text("Add to Product Shopping List")
                    .modifier(ButtonDesign())
            }
            Spacer()
            //Spacer()
        }
    }
}

struct AppleViewer: View {
    @SceneStorage("productNameApp") var productNameApp: String = "Apple"
    @SceneStorage("productDescripApp") var productDescripApp: String = "Current Price: $5.00"
    //@Binding var TheList: String
    @EnvironmentObject var man: ProductManager
    @Binding var cost: Int
    var body: some View {
        VStack {
            Text("Information for Apple")
                .font(.headline)
                .padding(.bottom, 30)
            HStack {
                Text("Current Price: $5.00")
                
                Spacer()
            }
            Button(action: {
                man.products.append(Product(name: productNameApp, description: productDescripApp))
                cost += 5
            }) {
                Text("Add to Shopping List")
                    .modifier(ButtonDesign())
            }
            Spacer()
            //Spacer()
        }
    }
}

struct OrangeViewer: View {
    @SceneStorage("productNameOran") var productNameOran: String = "Orange"
    @SceneStorage("productDescripOran") var productDescripOran: String = "Current Price: $4.00"
    //@Binding var TheList: String
    @EnvironmentObject var man: ProductManager
    @Binding var cost: Int
    //@State var message: String = "Added!"
    var body: some View {
        VStack {
            
            Text("Information for Orange")
                .font(.headline)
                .padding(.bottom, 30)
            HStack {
                Text("Current Price: $4.00")
                
                Spacer()
            }
            Button(action: {
                //Text(message)
                man.products.append(Product(name: productNameOran, description: productDescripOran))
                cost += 4
            }) {
                Text("Add to Shopping List")
                    .modifier(ButtonDesign())
            }
            Spacer()
            
            //Spacer()
        }
    }
}



class ProductManager: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        // Add initial crosswalks for testing
        //products.append(Product(name: "Apple", description: "Produces a certain amount of waste."))
        //products.append(Product(name: "Banana", description: "Produces a certain amount of waste."))
        //products.append(Product(name: "Orange", description: "Produces a certain amount of waste."))
        
        //crosswalks.append(CrossWalk(name: "McCarthy Hall", description: "The Only Campus Dr. Fullerton, CA 92831"))
    }
}

struct Product: Identifiable {
    /// The Identifiable protocol requires an id property that should be a unique value
    /// UUID generates a unique random hexadecimal string
    var id = UUID()
    var name: String
    var description: String
}
