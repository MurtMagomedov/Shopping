//
//  CartButtonOfNumberView.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 17.09.2024.
//

import SwiftUI

struct CartButtonOfNumberView: View {
    
    var numberOfProducts: Int
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart.fill")
                .font(.title)
                .foregroundColor(.green)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption).bold()
                    .foregroundColor(.white)
                    .frame(width: 17, height: 17)
                    .background(.red)
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    CartButtonOfNumberView(numberOfProducts: 7)
}
