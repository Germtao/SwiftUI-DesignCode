//
//  CertificateRow.swift
//  SwiftUI-DesignCode
//
//  Created by QDSG on 2019/12/20.
//  Copyright © 2019 unitTao. All rights reserved.
//

import SwiftUI

struct CertificateRow: View {
    var certificates = certificateData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Certificates")
                .font(.system(size: 20.0))
                .fontWeight(.heavy)
                .padding(.leading, 30.0)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20.0) {
                    ForEach(certificates) { item in
                        CertificateView(item: item)
                    }
                }
                .padding(20.0)
                .padding(.leading, 10.0)
            }
        }
    }
}

struct CertificateRow_Previews: PreviewProvider {
    static var previews: some View {
        CertificateRow()
    }
}

struct Certificate: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var width: Int
    var height: Int
}

let certificateData = [
    Certificate(title: "UI Design", image: "Certificate1", width: 230, height: 150),
    Certificate(title: "SwiftUI", image: "Certificate2", width: 230, height: 150),
    Certificate(title: "Sketch", image: "Certificate3", width: 230, height: 150),
    Certificate(title: "Framer", image: "Certificate4", width: 230, height: 150)
]
