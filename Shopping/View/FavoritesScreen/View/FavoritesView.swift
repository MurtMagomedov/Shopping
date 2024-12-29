//
//  FavoritesView.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 12.09.2024.
//

import SwiftUI
import FirebaseFirestore

struct FavoritesView: View {
    
    @FirestoreQuery(collectionPath: "shop", predicates: [.isEqualTo("isFavorite", true)]) var items: [Product]
    
    var columns = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        NavigationLink(destination: DetailView(product: item)) {
                            ProductCardView(product: item)
                        }
                    }
                }
            }
            .padding(.horizontal, 10)
            .background(Color("BackColor"))
            
            BackButtonView()
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    FavoritesView()
}
