//
//  ContentView.swift
//  taskSubmissionPIN
//
//  Created by Noga Gercsak on 9/20/23.
//

import SwiftUI
struct HomePageView: View {
    
    @State private var showingPopover = false
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Color(red: 246/255, green: 240/255, blue: 214/255)
                    .ignoresSafeArea()
                VStack(spacing:50) {
                    
                    Text("Welcome to \nUber!")
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text (" What are you looking for today?")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    
                    
                  
                    NavigationLink(destination: DonationView()) {
                        Text("Donate")
                            .font(.system(size: 40))
                            .foregroundColor(Color.black)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(hue: 0.137, saturation: 0.263, brightness: 0.842))
                    
                    NavigationLink(destination:CarbonCounterView()) {
                        Text("Carbon Counter")
                            .font(.system(size: 40))
                            .foregroundColor(Color.black)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(hue: 0.137, saturation: 0.263, brightness: 0.842))
                    
                    NavigationLink(destination: UberPageView()){
                        Text("Ride Info")
                            .font(.system(size: 40))
                            .foregroundColor(Color.black)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(hue: 0.137, saturation: 0.263, brightness: 0.842))
                    .offset(y: 0)
                    
                    Button("Why UberGreen?"){
                        showingPopover = true
                    }
                    .buttonStyle(.borderedProminent)         .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .tint(Color(red: 151 / 255, green: 196 / 255, blue: 133 / 255))

                    .popover(isPresented : $showingPopover){
                        VStack{
                                Text("Why UberGreen?")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(hue: 0.254, saturation: 0.981, brightness: 0.85))
                                         }
                                         
                    Text("As UberLand moves towards a greener, cleaner future, Uber aims to implement newer, more impactful features to reduce carbon emissions and further enhance existing elements ")
                                             .font(.headline)
                                             .padding()
                                         
                                         
                                         
                                         
                                         Image("the green way (1)")
                                             .resizable(capInsets: EdgeInsets(top: 30.0, leading: 0.0, bottom: 20.0, trailing: 0.0), resizingMode: .stretch)
                                             .aspectRatio(contentMode: .fit)
                                            
                                                 
                                                                 
                                         HStack{
                                             Text("Helping our planet, one trip at a time")
                                                 .font(.title2)
                                                 .fontWeight(.heavy)
                                                 .foregroundColor(Color.green)
                                             
                                             Text("- UberGreen Mission Statement, 2023")
                                                 .font(.subheadline)
                                                 .fontWeight(.thin)
                                             
                                             
                                         }
                                         
                                     }
                                     
                                 }

                        }
                    }
                }
            }



struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
