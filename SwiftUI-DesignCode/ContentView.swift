//
//  ContentView.swift
//  SwiftUI-DesignCode
//
//  Created by QDSG on 2019/12/16.
//  Copyright © 2019 unitTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)

            CardView()
                .offset(x: 0.0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
//                .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.easeOut(duration: 0.7))
                .blendMode(.hardLight)
            
            CardView()
                .offset(x: 0.0, y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
//                .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.easeOut(duration: 0.5))
                .blendMode(.hardLight)
            
            CertificateView()
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.spring())
                .onTapGesture { self.show.toggle() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            Text("Card Back")
        }
        .frame(width: 340.0, height: 220.0)
        .background(Color.blue)
        .cornerRadius(10.0)
        .shadow(radius: 10)
    }
}

struct CertificateView: View {
    var body: some View {
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

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
        }
        .padding()
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 60.0, height: 6.0)
                .cornerRadius(3.0)
                .opacity(0.2)
            
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .lineLimit(10)
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(30.0)
        .shadow(radius: 20)
        .offset(y: 600.0)
    }
}
