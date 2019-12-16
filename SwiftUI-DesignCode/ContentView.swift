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
        VStack {
            VStack {
                Text("UI Design")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("accent"))
                    .padding(.top)
                Text("Certificate")
                    .foregroundColor(Color.white)
            }
            Image("Background")
        }
        .background(Color.black)
        .cornerRadius(10.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
