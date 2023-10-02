//
//  carbonEmissionDetailView.swift
//  taskSubmissionPIN
//
//  Created by Noga Gercsak on 9/20/23.
//

import SwiftUI

struct CarbonEmissionsDetailView: View {
    var carbonFootprint: Double
    var carbonValue: String
    var reductionMinutes: Double {
        return calculateReductionMinutes(carbonFootprint: carbonFootprint)
    }

    init(carbonFootprint: Double, carbonValue: String) {
        self.carbonFootprint = carbonFootprint
        self.carbonValue = carbonValue
    }

    var body: some View {

        return ZStack {
            Color(red: 246/255, green: 240/255, blue: 214/255)
                .ignoresSafeArea()
            VStack {
                
                HStack{
                    Text("Ride Info")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 70))
                        .padding()
                    Image("carbonCounterGlobe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                Text("Your Emmisions:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 40))
                
                Text("Carbon Footprint per Person: \n\(String(format: "%.2f", carbonFootprint)) kg CO2")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                    .offset(y:-30)
                

                // Facts and suggestions based on carbon footprint
                Text("What does this mean?")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 35))
                    .offset(y:-40)
                    .padding()
                
                if carbonFootprint >= 5 {
                    Text("Consider reducing your car rides to lower your emissions. If you reduced your car rides by \(Int(reductionMinutes)) minutes per week, you could lower your emissions by 10%. ")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding()
                        .offset(y:-60)
                } else {
                    Text("Great job! Your carbon emissions are low.\nContinue to make sustainable choices to reduce your carbon footprint.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding()
                        .offset(y:-60)
                  
                }
            }
        }
    }

 

    func calculateReductionMinutes(carbonFootprint: Double) -> Double {
        // Calculate the reduction in car rides needed to lower emissions by 10%
        let reductionPercentage: Double = 10.0
        let reductionFactor = (carbonFootprint * reductionPercentage) / 100.0
        // Assuming an emission factor for car rides, you can estimate the reduction in minutes
        let emissionFactorPerMinute: Double = 0.01 // Adjust this based on your data
        let reductionMinutes = reductionFactor / emissionFactorPerMinute
        return reductionMinutes
    }
}


struct CarbonEmissionsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarbonEmissionsDetailView(carbonFootprint: 0.0, carbonValue: "")
    }
}

