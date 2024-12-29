//
//  BackButtonView.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 15.09.2024.
//

import SwiftUI

struct BackButtonView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss.callAsFunction()
        } label: {
            Image(systemName: "chevron.left")
                .font(.title2)
                .padding(10)
                .foregroundColor(.white)
                .background(Color.black)
                .clipShape(Circle())
                .opacity(0.7)
                .padding(.horizontal, 10)
        }
    }
}

#Preview {
    BackButtonView()
}
