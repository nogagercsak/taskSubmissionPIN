//
//  RideShareView.swift
//  taskSubmissionPIN
//
//  Created by Noga Gercsak on 9/20/23.
//

import SwiftUI


struct UberPageView: View {
    var body: some View {
        
        ZStack{
            Color(red: 246/255, green: 240/255, blue: 214/255)
                .ignoresSafeArea()
            VStack {
                
                
                Text("Your Uber")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .padding(.top)
                
                Text("Vehicle : Tesla | Model XYZ | 1234")
                    .background(
                        LinearGradient (gradient: Gradient(colors: [.white, .gray]), startPoint: .top, endPoint: .bottom)
                    )
                
                
                Image("map1")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                
                Spacer()
                Spacer()
                
                HStack{
                    
                    VStack{
                        Text("Total Price = $20.00")
                            .font(.caption)
                            .fontWeight(.medium)
                        
                        Text("Driver Name XYZAD")
                            .font(.caption)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        HStack{
                            Image("car1")
                                .resizable()
                                .frame(width: 50.0, height: 50.0)
                            
                            Image("icon")
                                .resizable()
                                .frame(width: 100.0, height: 100.0)
                            
                        }
                        
                        HStack{
                            Text("PICK UP IN")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            
                            Text("5 Minutes")
                        }
                    }
                    
                    
                    
                    Image("leaf")
                        .resizable(capInsets: EdgeInsets(top: 2.0, leading: 0.0, bottom: 0.0, trailing: 0.0), resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .padding(200.0)
                        .frame(width: 120.0, height: 120.0)
                    
                }
            }
        }
    }
    
struct UberPageView_Previews: PreviewProvider {
    static var previews: some View {
        UberPageView()
        }
    }
}
