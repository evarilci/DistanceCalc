//
//  ContentView.swift
//  DistanceCalc
//
//  Created by Eymen Varilci on 25.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 100.0
   // @State private var distanceOutput = 0.0
    let units = ["KM","Meter","Feet","Yards","Miles"]
    
    @State private var inputUnit = "KM"
    @State private var outputUnit = "Miles"
    @FocusState private var inputIsFocused: Bool
    var calculater : String {
        let inputToMeters : Double
        let metersToOutput : Double
        
        switch inputUnit {
        case "KM" :
            inputToMeters = 1000
        case "Feet":
            inputToMeters = 0.3048
        case "Yards":
            inputToMeters = 0.9144
        case "Miles" :
            inputToMeters = 1609.34
        default :
            inputToMeters = 1.0
            
        }
        switch outputUnit {
        case "KM" :
            metersToOutput = 0.001
        case "Feet":
            metersToOutput = 3.28084
        case "Yards":
            metersToOutput = 1.09361
        case "Miles":
            metersToOutput = 0.000621371
        default:
            metersToOutput = 1.0
        }
        
        let inputInMeters = input * inputToMeters
        let output = inputInMeters * metersToOutput
        let outputString = output.formatted()
       
        
        return "\(outputString) \(outputUnit.lowercased())"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    TextField("INPUT", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    Picker("convert from", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                        
                    } .pickerStyle(.segmented)
                }
                Section {
                    Text("\(calculater)")
                        
                    Picker("Miles", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                        
                    } .pickerStyle(.segmented)
                }
            }
            .navigationTitle("DistanceCalc")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done"){
                    inputIsFocused = false
                  }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
