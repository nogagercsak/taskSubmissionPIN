//
//  ContentView.swift
//  taskSubmissionPIN
//
//  Created by Noga Gercsak on 9/20/23.
//

import SwiftUI

struct CarbonCounterView: View {
    @State private var selectedCarType: String = "Compact"
    @State private var distance: Double = 0
    @State private var numberOfPeople: Int = 1
    @State var carbonFootprint: Double = 0.0
    @State var emissionsPerPerson: Double = 0.0
    
    let carTypes = ["Compact", "Sedan", "SUV"]
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                Color(red: 246/255, green: 240/255, blue: 214/255)
                    .ignoresSafeArea()
                
                VStack(spacing:10) {
                    
                    Text("Carbon Tracker")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 40))
                        .offset(y:-70)
                    
                    Text("Enter your ride information to check your carbon emissions")
                        .font(.system(size:22))
                        .padding()
                        .offset(y:-80)
                    
                    
                    Picker("Car Type", selection: $selectedCarType) {
                        ForEach(carTypes, id: \.self) { carType in
                            Text(carType)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .offset(y:-90)
                    .padding()
                    
                    Stepper("Number of People: \(numberOfPeople)", value: $numberOfPeople, in: 1...5)
                        .offset(y:-80)
                        .padding()
                        .font(.title2)
                    
                    Slider(value: $distance, in: 0...100, step: 1)
                        .padding()
                        .offset(y:-100)
                    Text("Distance: \(Int(distance)) km")
                        .font(.title3)
                        .offset(y:-100)
                    
                    
                        Button(action: {
                            // Calculate carbon footprint and update the carbonFootprint variable
                            carbonFootprint = calculateCarbonFootprint(carType: selectedCarType, distance: distance, numberOfPeople: numberOfPeople)
                        }) {
                            Text("Calculate Carbon Footprint")
                                .font(.title2)
                                .foregroundColor(Color.black)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color(hue: 0.137, saturation: 0.263, brightness: 0.842))
                        .offset(y:-40)

                    
                    // Display the result here
                    Text("Carbon Footprint per Person: \n\(String(format: "%.2f", carbonFootprint)) kg CO2")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding()
                        .offset(y:-25)
        
                    
                    // Navigation to the new view
                    NavigationLink(destination: CarbonEmissionsDetailView(carbonFootprint: carbonFootprint, carbonValue: "")) {
                        Text("Show More Info")
                            .font(.title2)
                            .foregroundColor(Color.black)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(hue: 0.137, saturation: 0.263, brightness: 0.842))
                    .offset(y: 0)
                }
            }
        }
    }

    func calculateCarbonFootprint(carType: String, distance: Double, numberOfPeople: Int) -> Double {
        // Define emission factors for different car types in kg CO2 per km
        let emissionFactors: [String: Double] = [
            "Compact": 0.2,
            "Sedan": 0.25,
            "SUV": 0.3
        ]

        // Check if the car type exists in the emission factors dictionary
        guard let emissionFactor = emissionFactors[carType] else {
            // If the car type is not found, return an error value or handle it as needed
            return -1.0 // Replace with appropriate error handling
        }

        // Calculate total emissions for the trip
        let totalEmissions = emissionFactor * distance

        // Calculate emissions per person
        let emissionsPerPerson = totalEmissions / Double(numberOfPeople)

        return emissionsPerPerson
    }
}




struct CarbonCounter_Previews: PreviewProvider {
    static var previews: some View {
        CarbonCounterView()
    }
}

