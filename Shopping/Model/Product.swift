//
//  Product.swift
//  Shopping
//
//  Created by Муртазали Магомедов on 08.09.2024.
//

import Foundation
import FirebaseFirestore

struct Product: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var description: String
    var image: String
    var price: Int
    var isFavorite: Bool
    var quantityInCard: Int?
}
