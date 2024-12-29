//
//  DetailView.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 15.09.2024.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    let product: Product
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
                        .ignoresSafeArea()
                }
                HStack {
                    BackButtonView()
                    
                    Spacer()
                    
                    FavoriteButtonView(product: product, font: .title2)
                }
            }
            Spacer()
            DetailInfoView(product: product)
            .padding(.horizontal, 30)
            
        }
        .navigationBarBackButtonHidden()
        .background(Color("BackColor").ignoresSafeArea())
        .frame(maxHeight: .infinity)
        
        
    }
}

#Preview {
    DetailView(
        product: Product(
            name: "Пенал",
            description: "Красивый пенал",
            image: "https://firebasestorage.googleapis.com/v0/b/shopping-66f2f.appspot.com/o/products%2F10.jpg?alt=media&token=21a35651-fe3a-4bc2-a08b-08f696677cd7",
            price: 250,
            isFavorite: false
        )
    )
    .environmentObject(ViewModel())
}
