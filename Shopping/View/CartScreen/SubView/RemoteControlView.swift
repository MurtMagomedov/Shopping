//
//  RemoteControlView.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 16.09.2024.
//

import SwiftUI

struct RemoteControlView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    let product: Product
    var body: some View {
        VStack(alignment: .trailing, spacing: 30) {
            Button {
                vm.deleteQuantity(product: product)
            } label: {
                Image(systemName: "xmark.circle.fill")
//                        .frame(width: 30, height: 30)
                    .font(.title2)
                    .foregroundColor(.white)
//                        .background(.white)
//                        .cornerRadius(10)
            }
            
            HStack {
                Button {
                    vm.minusToQuantity(product: product)
                } label: {
                    Image(systemName: "minus")
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(10)
                }
                
                if let count = product.quantityInCard {
                    Text("\(count)")
                        .nameFont()
                        .lineLimit(1)
                        .frame(width: 30, height: 30)
                }
                
                Button {
                    vm.plusToQuantity(product: product)
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

