//
//  ContentView.swift
//  SwiftUI-DesignCode
//
//  Created by QDSG on 2019/12/16.
//  Copyright © 2019 unitTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Card Back")
            }
            .frame(width: 270.0, height: 220.0)
            .background(Color.blue)
            .cornerRadius(10.0)
            .shadow(radius: 10)
            .offset(x: 0.0, y: -40)
            
            VStack {
                Text("Card Back")
            }
            .frame(width: 310.0, height: 220.0)
            .background(Color.pink)
            .cornerRadius(10.0)
            .shadow(radius: 10)
            .offset(x: 0.0, y: -20)

            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("UI Design")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("accent"))
                            .padding(.top)
                        Text("Certificate")
                            .foregroundColor(Color.white)
                            .padding(.top, 8.0)
                    }
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                }
                .padding(.horizontal)
                Spacer()
                Image("Background")
            }
            .frame(width: 340.0, height: 220.0)
            .background(Color.black)
            .cornerRadius(10.0)
            .shadow(radius: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
