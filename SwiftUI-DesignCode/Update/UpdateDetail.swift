//
//  UpdateDetail.swift
//  SwiftUI-DesignCode
//
//  Created by QDSG on 2019/12/18.
//  Copyright © 2019 unitTao. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var update = Update(image: "Illustration1", title: "SwiftUI", text: "加载中...", date: "")
    var body: some View {
        VStack(spacing: 20.0) {
            Text(update.title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200.0)
            Text(update.text)
                .lineLimit(nil)
                .frame(minWidth: 0.0, maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding(30.0)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
