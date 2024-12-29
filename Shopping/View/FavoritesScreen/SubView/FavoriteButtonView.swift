//
//  FavoriteButtonView.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 17.09.2024.
//

import SwiftUI

struct FavoriteButtonView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    let product: Product
    let font: Font
    var body: some View {
        Button {
            vm.toogleFavorite(product: product)
        } label: {
            Image(systemName: "heart.fill")
                .font(font)
                .foregroundColor(product.isFavorite ? .red : .white)
                .padding(10)
                .background(Color.black)
                .clipShape(Circle())
                .padding(5)
        }
    }
}
