//
//  ContentViewModel.swift
//  NAT-ACE
//
//  Created by Didier Delhaisse on 02/07/2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var accumulatedCycloneEnergy: [AceModel] = Bundle.main.decode("aceNorthAtlantic.json")
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
    
    /*
    // Method to calculate the linear regression coefficients
    func linearRegression() -> (slope: Double, intercept: Double) {
        let n = Double(accumulatedCycloneEnergy.count)
        let sumX = accumulatedCycloneEnergy.reduce(0) { $0 + Double($1.year)! }
        let sumY = accumulatedCycloneEnergy.reduce(0) { $0 + $1.energy }
        let sumXY = accumulatedCycloneEnergy.reduce(0) { $0 + (Double($1.year)! * $1.energy) }
        let sumX2 = accumulatedCycloneEnergy.reduce(0) { $0 + (Double($1.year)! * Double($1.year)!)}
        
        let slope = (n * sumXY - sumX * sumY) / (n * sumX2 - sumX * sumX)
        let intercept = (sumY - slope * sumX) / n
        return (slope, intercept)
    }
    
    // Method to generate trend line points
    func trendLinePoints() -> [AceModel] {
        let (slope, intercept) = linearRegression()
        
        return accumulatedCycloneEnergy.map { data in
            let year = Double(data.year)!
            let energy = slope * year + intercept
            return AceModel(year: data.year, energy: energy)
        }
    }
    */
}
