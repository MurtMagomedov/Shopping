//
//  ToolBarView.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 15.09.2024.
//

import SwiftUI

struct ToolBarView: View {
    var count: Int
    var body: some View {
        HStack {
            NavigationLink(destination: FavoritesView()) {
                Image(systemName: "heart.fill")
                    .font(.title)
                    .foregroundColor(.red)
            }
            
            Spacer()
            
            NavigationLink(destination: CartView()) {
                CartButtonOfNumberView(numberOfProducts: count)
            }
        }
    }
}

#Preview {
    ToolBarView(count: 7)
}
