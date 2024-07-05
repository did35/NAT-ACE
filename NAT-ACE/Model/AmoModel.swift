//
//  AmoModel.swift
//  NAT-ACE
//
//  Created by Didier Delhaisse on 05/07/2024.
//

import Foundation

struct AmoModel: Identifiable, Codable {
    let id = UUID()
    let year: Int
    let month: Int
    let value: Double
    
    private enum CodingKeys: String, CodingKey {
        case year, month, value
    }
}
