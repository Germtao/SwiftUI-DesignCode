//
//  UpdateStore.swift
//  SwiftUI-DesignCode
//
//  Created by QDSG on 2019/12/18.
//  Copyright © 2019 unitTao. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    
    // @Published 修饰对象里属性, 表示这个属性是需要被 SwiftUI 监听的
    @Published var updates: [Update]
    
    init(updates: [Update] = []) {
        self.updates = updates
    }
}

