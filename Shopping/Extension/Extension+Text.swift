//
//  Extension+Text.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 14.09.2024.
//

import SwiftUI

extension Text {
    
    func nameFont() -> some View {
        self
            .foregroundStyle(.white)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .opacity(0.8)
    }
    
    func descriptionFont() -> some View {
        self
            .foregroundStyle(.white)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .opacity(0.8)
    }
    
    func priceFont() -> some View {
        self
            .foregroundStyle(.white)
            .font(.system(size: 15, weight: .regular, design: .rounded))
            .opacity(0.8)
    }
}

struct TextFont: View {
    var body: some View {
        Text("Name Font")
            .nameFont()
        Text("Price Font")
            .priceFont()
    }
}

#Preview {
    TextFont()
}
