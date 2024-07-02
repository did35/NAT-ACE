//
//  AceModel.swift
//  NAT-ACE
//
//  Created by Didier Delhaisse on 02/07/2024.
//

import Foundation

struct AceModel: Identifiable, Codable {
    let id = UUID()
    let year: String
    let energy: Double
    
    enum CodingKeys: String, CodingKey {
        case year, energy
    }
}
