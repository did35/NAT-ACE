//
//  Bundle.swift
//  NAT-ACE
//
//  Created by Didier Delhaisse on 02/07/2024.
//

import Foundation

extension Bundle {
    func decode<T:Codable>(_ file: String) -> T {
        // 1. Locate the json file
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate the \(file) in bundle.")
        }
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load the \(file) from the bundle.")
        }
        // 3. Create a decoder
        let decoder = JSONDecoder()
        // 4. Create a property for the decoded data
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        // 5. Return the ready to use data
        return decodedData
    }
}
