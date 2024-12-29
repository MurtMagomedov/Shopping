//
//  ProductRowView.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 16.09.2024.
//

import SwiftUI

struct ProductRowView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    let product: Product
    var body: some View {
        HStack(spacing: 20) {
            if let url = URL(string: product.image) {
                CardImageView(url: url, width: 100, height: 100)
            }
            
            VStack(alignment: .leading, spacing: 30) {
                Text(product.name)
                    .nameFont()
                
                if let quantityInCard = product.quantityInCard {
                    Text("\(product.price * quantityInCard) ₽")
                        .priceFont()
                }
                
            }
            Spacer()
            
            RemoteControlView(product: product)
        }
        .padding(10)
        .background(.black)
        .cornerRadius(30)
        .padding(.horizontal , 10)
    }
}

#Preview {
    ProductRowView(
        product: Product(
            name: "Пенал",
            description: "Красивый пенал",
            image: "https://firebasestorage.googleapis.com/v0/b/shopping-66f2f.appspot.com/o/products%2F10.jpg?alt=media&token=21a35651-fe3a-4bc2-a08b-08f696677cd7",
            price: 250,
            isFavorite: false,
            quantityInCard: 2
        )
    )
    .environmentObject(ViewModel())
}
