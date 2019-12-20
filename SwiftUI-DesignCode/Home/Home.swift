//
//  Home.swift
//  SwiftUI-DesignCode
//
//  Created by QDSG on 2019/12/17.
//  Copyright © 2019 unitTao. All rights reserved.
//

import SwiftUI

let statusBarH = UIApplication.shared.windows.last?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

struct Home: View {
    @State var show = false
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            
            HomeList()
                .blur(radius: show ? 20.0 : 0.0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)
            
            ContentView()
                .frame(minWidth: 0.0, maxWidth: 712.0)
                .cornerRadius(30.0)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? statusBarH + 40 : UIScreen.main.bounds.height)
            
            MenuRightView(show: $showProfile)
                .offset(x: -16, y: showProfile ? statusBarH : 88)
                .animation(.spring())
            
            MenuButton(show: $show)
                .offset(x: -40,
                        y: showProfile ? statusBarH : 80)
                .animation(.spring())
            
            MenuView(show: $show)
        }
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home().previewDevice("iPhone SE")
            Home().previewDevice("iPhone 11")
            Home().previewDevice("iPad Pro (9.7-inch)")
        }
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
                .foregroundColor(.primary)
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
    Menu(title: "设置", icon: "gear"),
    Menu(title: "退出登录", icon: "arrow.uturn.down")
]

struct MenuView: View {
    var menus = menuData
    @Binding var show: Bool // 依赖主组件的状态
    @State var showSetting = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20.0) {
                ForEach(menus) { menu in
                    if menu.title == "设置" {
                        Button(action: { self.showSetting.toggle() }) {
                            MenuRow(image: menu.icon, title: menu.title)
                        }.sheet(isPresented: self.$showSetting, onDismiss: {
                            self.showSetting = false
                        }) {
                            Settings()
                        }
                    } else {
                        MenuRow(image: menu.icon, title: menu.title)
                    }
                }
                
                Spacer()
            }
            .padding(.top, 20.0) // 内边距
            .padding(30)
            .frame(minWidth: 0.0, maxWidth: 360.0)
            .background(Color("button"))
            .cornerRadius(30.0)
            .padding(.trailing, 60.0) // 外边距
            .shadow(radius: 20)
            .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0.0, y: 10.0, z: 0.0))
            .animation(.default)
            .offset(x: show ? 0 : -UIScreen.main.bounds.width)
            .onTapGesture {
                self.show.toggle()
            }
            
            Spacer()
        }
        .padding(.top, statusBarH)
    }
}

struct CircleButton: View {
    var icon = "person.crop.circle"
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.primary)
        }
        .frame(width: 44.0, height: 44.0)
        .background(Color("button"))
        .cornerRadius(30.0)
        .shadow(color: Color("buttonShadow"), radius: 10.0, x: 0.0, y: 10.0)
    }
}

struct MenuButton: View {
    @Binding var show: Bool
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: { self.show.toggle() }) {
                    HStack {
                        Spacer()
                        Image(systemName: show ? "decrease.indent" : "increase.indent")
                            .foregroundColor(.primary) // 黑暗模式 - 白色, 正常模式 - 黑色
                    }
                    .padding(.trailing, 18.0)
                    .frame(width: 90.0, height: 60.0)
                    .background(Color("button"))
                    .cornerRadius(30.0)
                    .shadow(color: Color("buttonShadow"), radius: 10.0, x: 0.0, y: 10.0)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct MenuRightView: View {
    @Binding var show: Bool
    @State var showUpdateList = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "person.crop.circle")
                }
                Button(action: { self.showUpdateList.toggle() }) {
                    CircleButton(icon: "bell")
                }.sheet(isPresented: $showUpdateList, onDismiss: {
                    self.showUpdateList = false
                }, content: {
                    UpdateList()
                })
            }
            Spacer()
        }
    }
}
