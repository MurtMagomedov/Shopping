//
//  ProductCardView.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 12.09.2024.
//

import SwiftUI

struct ProductCardView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    let product: Product
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            ZStack(alignment: .bottom) {
                ZStack(alignment: .topTrailing) {
        
                    if let url = URL(string: product.image) {
                        CardImageView(
                            url: url,
                            width: size.width,
                            height: size.height
                        )
                        
                        FavoriteButtonView(product: product, font: .title3)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .nameFont()
                        .lineLimit(2)
                    Text("\(product.price) ₽")
                        .priceFont()
                }
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("BackColor").opacity(0.5))
                .cornerRadius(20)
                .padding(5)
            }
        }
        .frame(height: UIScreen.main.bounds.width * 0.6)
//        .padding(10)
        .background(Color("BackColor").opacity(0.6))
    }
}

#Preview {
//    ProductCardView(
//        product: Product(
//            name: "Пенал",
//            description: "Красивый пенал",
//            image: "https://firebasestorage.googleapis.com/v0/b/shopping-66f2f.appspot.com/o/products%2F10.jpg?alt=media&token=21a35651-fe3a-4bc2-a08b-08f696677cd7",
//            price: 250,
//            isFavorite: false
//        )
//    )
    MainView()
        .environmentObject(ViewModel())
}
