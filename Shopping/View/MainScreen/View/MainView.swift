//
//  ContentView.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 08.09.2024.
//

import SwiftUI
import FirebaseFirestore

struct MainView: View {
    
    @FirestoreQuery(collectionPath: "shop") var items: [Product]
    @EnvironmentObject var vm: ViewModel
    
    var columns = Array(repeating: GridItem(), count: 2)
    var body: some View {
        NavigationStack {
            VStack {
                ToolBarView(count: vm.countItem)
                    .padding(.horizontal, 10)
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns) {                ForEach(items) { item in
                            NavigationLink(destination: DetailView(product: item)) {
                                ProductCardView(product: item)
                            }
                        }
                    }
                }
                .padding(.horizontal, 10)
                
            }
            .background(Color("BackColor"))
        }
    }
}

#Preview {
        MainView()
            .environmentObject(ViewModel())
}
