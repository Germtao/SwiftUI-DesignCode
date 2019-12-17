//
//  Home.swift
//  SwiftUI-DesignCode
//
//  Created by QDSG on 2019/12/17.
//  Copyright © 2019 unitTao. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            Button(action: { self.show.toggle() }) {
                Text("Open Menu")
            }
            
            MenuView(show: $show)
        }
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

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "我的账号", icon: "person.crop.circle"),
    Menu(title: "我的账单", icon: "creditcard"),
    Menu(title: "我的分组", icon: "person.2"),
    Menu(title: "退出登录", icon: "arrow.uturn.down")
]

struct MenuView: View {
    var menus = menuData
    @Binding var show: Bool // 依赖主组件的状态
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            
            ForEach(menus) { menu in
                MenuRow(image: menu.icon, title: menu.title)
            }
            
            Spacer()
        }
            .padding(.top, 20.0) // 内边距
            .padding(30)
            .frame(minWidth: 0.0, maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(30.0)
            .padding(.trailing, 60.0) // 外边距
            .shadow(radius: 20)
            .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0.0, y: 10.0, z: 0.0))
            .animation(.default)
            .offset(x: show ? 0 : -UIScreen.main.bounds.width)
            .onTapGesture {
                self.show.toggle()
        }
    }
}
