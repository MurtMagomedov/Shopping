//
//  DetailInfoView.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 15.09.2024.
//

import SwiftUI

struct DetailInfoView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    let product: Product
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(product.name)
                    .nameFont()
                Spacer()
                Text("\(product.price) ₽")
                    .nameFont()
            }
            Text(product.description)
                .priceFont()

            Spacer()
            
            CartButtonView(
                title: vm.getTitle(product: product),
                color: vm.getColor(product: product)
            ) {
                vm.addToCart(product: product)
            }
        }
    }
}

