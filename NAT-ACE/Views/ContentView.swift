//
//  ContentView.swift
//  NAT-ACE
//
//  Created by Didier Delhaisse on 02/07/2024.
//

import SwiftUI
import Charts

struct ContentView: View {
    // MARK: - Properties
    @StateObject private var vm = ContentViewModel()
    
    
    // MARK: - Body
    var body: some View {
        ScrollView {
                aceTitle
                aceSubTitle
                aceChart
                highestAndLowest
            GroupBox {
                aceExplanation
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}

// MARK: - Extension
extension ContentView {
    
    private var aceTitle: some View {
        Text("ACE - North Atlantic")
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.blue)
    }
    
    private var aceSubTitle: some View {
        Text("1851 ~ 2021")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.secondary)
    }
    
    private var aceChart: some View {
        
        Chart {
            ForEach(vm.accumulatedCycloneEnergy) {
                BarMark(
                    x: .value("Year", $0.year),
                    y: .value("ace", $0.energy)
                )
                .foregroundStyle(.mint)
            }
           // RuleMark(y: .value("Average bar", vm.averageEnergy))
                //.foregroundStyle(.secondary)
        }
        /*
        Chart {
            ForEach(vm.accumulatedCycloneEnergy) { data in
                LineMark(
                    x: .value("Year", Int(data.year) ?? 0),
                    y: .value("Energy", data.energy)
                )
                .foregroundStyle(.blue)
            }
            
            ForEach(vm.trendLinePoints()) { data in
                LineMark(
                    x: .value("Year", Int(data.year) ?? 0),
                    y: .value("Energy", data.energy)
                )
                .foregroundStyle(.red)
            }
        }
         */
        .frame(height: 300)
        .padding()
    }
    
    /*
    private var averageAce: some View {
        Text("ACE average: \(vm.averageEnergy, specifier: "%.2f")")
            .font(.subheadline)
            .fontWeight(.heavy)
            .foregroundStyle(.secondary)
            .padding(.top, 150)
    }
     */
    
    private var highestAndLowest: some View {
        HStack {
            if let highest = vm.highestEnergy {
                Text("Highest: \(highest.energy, specifier: "%.2f") in \(highest.year)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
            }
            Spacer()
            if let lowest = vm.lowestEnergy {
                Text("Lowest: \(lowest.energy, specifier: "%.2f") in \(lowest.year)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(.green)
            }
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 12)
    }
    
    private var aceExplanation: some View {
        Text("Accumulated cyclone energy (ACE) is a metric used to compare overall activity of tropical cyclones, utilizing the available records of windspeeds at six-hour intervals to synthesize storm duration and strength into a single index value. The ACE index may refer to a single storm or to groups of storms such as those within a particular month, a full season or combined seasons. It is calculated by summing the square of tropical cyclones' maximum sustained winds, as recorded every six hours, but only for windspeeds of at least tropical storm strength (≥ 34 kn; 63 km/h; 39 mph); the resulting figure is divided by 10,000 to place it on a more manageable scale.")
    }
}
