//
//  ContentViewModel.swift
//  NAT-ACE
//
//  Created by Didier Delhaisse on 02/07/2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var accumulatedCycloneEnergy: [AceModel] = Bundle.main.decode("aceNorthAtlantic.json")
    @Published var amo: [AmoModel] = Bundle.main.decode("amo.json")
    @Published var averageDifference: Double = 0.0
    
    var averageEnergy: Double {
        let totalEnergy = accumulatedCycloneEnergy.reduce(0) { $0 + $1.energy }
        return totalEnergy / Double(accumulatedCycloneEnergy.count)
    }
    
    var highestEnergy: (year: String, energy: Double)? {
        if let highest = accumulatedCycloneEnergy.max(by: {$0.energy < $1.energy}) {
            return (highest.year, highest.energy)
        }
        return nil
    }
    
    var lowestEnergy: (year: String, energy: Double)? {
        if let lowest = accumulatedCycloneEnergy.min(by: {$0.energy < $1.energy}) {
            return (lowest.year, lowest.energy)
        }
        return nil
    }
}
