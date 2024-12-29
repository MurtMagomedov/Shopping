//
//  CartButtonView.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 15.09.2024.
//

import SwiftUI

struct CartButtonView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    let title: String
    let color: Color
    let action: () -> ()
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(color)
                .clipShape(Capsule())
            
        }
    }
}
