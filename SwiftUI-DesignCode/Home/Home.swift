//
//  Home.swift
//  SwiftUI-DesignCode
//
//  Created by QDSG on 2019/12/17.
//  Copyright © 2019 unitTao. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            MenuRow(image: "person.crop.circle", title: "我的账号")
            MenuRow(image: "creditcard", title: "我的账单")
            MenuRow(image: "person.2", title: "我的分组")
            MenuRow(image: "arrow.uturn.down", title: "退出登录")
            Spacer()
        }
        .padding(.top, 20.0) // 内边距
        .padding(30)
        .frame(minWidth: 0.0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30.0)
        .padding(.trailing, 60.0) // 外边距
        .shadow(radius: 20)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var title = "我的账号"
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 30.0, height: 30.0)
            Text(title)
                .font(.headline)
            Spacer()
        }
    }
}
