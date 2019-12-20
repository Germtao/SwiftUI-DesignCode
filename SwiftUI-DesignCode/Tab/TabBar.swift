//
//  TabBar.swift
//  SwiftUI-DesignCode
//
//  Created by QDSG on 2019/12/18.
//  Copyright © 2019 unitTao. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image("IconHome")
                Text("Home")
            }
            .tag(1)
            
            ContentView().tabItem {
                Image("IconCards")
                Text("Certificates")
            }
            .tag(2)
            
            UpdateList().tabItem {
                Image("IconSettings")
                Text("Updates")
            }
            .tag(3)
        }
        .accentColor(.primary) // 设置选中颜色
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
            TabBar()
                .environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .extraLarge)
        }
    }
}
