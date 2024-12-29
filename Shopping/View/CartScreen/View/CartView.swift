//
//  CartView.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 12.09.2024.
//

import SwiftUI
import FirebaseFirestore

struct CartView: View {
    
    @EnvironmentObject var vm: ViewModel
    @FirestoreQuery(collectionPath: "shop") private var items: [Product]
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                ScrollView {
                    ForEach(items.filter { $0.quantityInCard ?? 0 > 0}) { item in
                        NavigationLink(destination: DetailView(product: item)) {
                            ProductRowView(product: item)
                        }
                    }
                }
                
                Text("Общая сумма: \(vm.totalPrice)")
                    .nameFont()
                    .padding(.bottom)
                
                CartButtonView(title: "Купить", color: .black) {
                    
                }
                .padding(.horizontal, 50)
            }
            .background(Color("BackColor"))
            
            BackButtonView()
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    CartView()
        .environmentObject(ViewModel())
}
