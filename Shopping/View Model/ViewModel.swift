//
//  ViewModel.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 15.09.2024.
//

import Foundation
import SwiftUI
import FirebaseFirestore

final class ViewModel: ObservableObject {
    
    @Published var cartItems: [Product] = []
    
    var countItem: Int {
        cartItems.filter { $0.quantityInCard ?? 0 > 0}.count
    }
    var totalPrice: Int {
        cartItems.reduce(0) { $0 + ($1.price * ($1.quantityInCard ?? 0))}
    }
    private let dataBase = Firestore.firestore().collection("shop")
    
    init() {
        fetchItems()
    }
    
    private func fetchItems() {
        dataBase.addSnapshotListener { snapshot, error in
            guard let document = snapshot?.documents else {
                print("Error \(error!)")
                return
            }
            
            self.cartItems = document.compactMap { document -> Product? in
                try? document.data(as: Product.self)
            }
        }
    }
    
    private func updateItem(product: Product, data: [String : Any]) {
        guard let id = product.id else { return }
        dataBase.document(id).updateData(data)
    }
    
    func toogleFavorite(product: Product) {
        updateItem(product: product, data: ["isFavorite" : !product.isFavorite])
    }
    
    func addToCart (product: Product) {
        updateItem(product: product, data: ["quantityInCard" : 1])
    }
    
    func plusToQuantity(product: Product) {
        guard let quantityInCard = product.quantityInCard else { return }
        updateItem(product: product, data: ["quantityInCard" : quantityInCard + 1])
    }
    
    func minusToQuantity(product: Product) {
        guard let quantityInCard = product.quantityInCard else { return }
        updateItem(product: product, data: ["quantityInCard" : max(quantityInCard - 1, 1)])
    }
    
    func deleteQuantity(product: Product) {
        updateItem(product: product, data: ["quantityInCard" : 0])
    }
    
    func getColor (product: Product) -> Color {
        guard let quantityInCard = product.quantityInCard else { return .black }
        if quantityInCard != 0 {
            return .green
        } else {
            return .black
        }
    }
    
    func getTitle (product: Product) -> String {
        guard let quantityInCard = product.quantityInCard else { return "Добавить в корзину" }
        if quantityInCard != 0 {
            return "В корзине"
        } else {
            return "Добавить в корзину"
        }
    }
}
