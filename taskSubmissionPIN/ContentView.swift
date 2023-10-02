//
//  ContentView.swift
//  taskSubmissionPIN
//
//  Created by Noga Gercsak on 9/20/23.
//
import SwiftUI
struct ContentView: View {
    @State private var showingPopover = false
    
    
    
    var body: some View {
        
        VStack{
            Text("Welcome to Uber!")
                .font(.largeTitle)
            
          Text ("What are you looking for today?")
          
            Image("carservice")
                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0), resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .padding(200.0)
                .frame(width: 120.0, height: 120.0)
               
        }
        
        
        
        
        
        
        
        VStack {
           
                
                
                Button("Why UberGreen?"){
                    showingPopover = true
                }
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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

