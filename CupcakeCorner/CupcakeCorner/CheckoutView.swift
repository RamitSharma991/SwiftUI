//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ramit sharma on 03/12/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var showingCOnfirmation = false
    
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cup1")
                    .resizable()
                    .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Your order is $\(self.order.cost, specifier: "%.2f") ")
                        .font(.title)
                    
                    Button("Place Order") {
                        // place order
                        self.placeOrder()
                        
                    }
                .padding()
                }
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert(isPresented: $showingCOnfirmation) { Alert(title: Text("Thank You!"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
    }
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order)
            else {
                print("Error")
//                    .alert(isPresented: $showingCOnfirmation) { Alert(title: Text("There is an Error!"), message: Text("Check connectivity"), dismissButton: .default(Text("Go back")))
//                }
                return
        }
        
        let url = URL(string: "http://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            // handle the result
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your oder for \(decodedOrder.quantity)x\(Order.types[decodedOrder.type].lowercased()) cupcake is on its way!"
                self.showingCOnfirmation = true
            } else {
                print("Invald response from the server")
            }
        }.resume()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
