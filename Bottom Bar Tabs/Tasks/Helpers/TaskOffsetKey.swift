//
//  TaskOffsetKey.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/7/24.
//

import SwiftUI

struct TaskOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
