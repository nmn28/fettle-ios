//
//  NewCustomPicker.swift
//  market
//
//  Created by Nicholas Nelson on 3/1/24.
//

import SwiftUI

struct ListView: View {
    var onScroll: (CGFloat) -> Void
    @State private var lastOffset: CGFloat = 0
    @State private var isScrollingDown = false

    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<30) { item in
                    Text("List Item \(item)")
                        .padding()
                }
            }
            .background(GeometryReader { proxy -> Color in
                let offset = proxy.frame(in: .global).minY
                DispatchQueue.main.async {
                    // Determine if scrolling down
                    if lastOffset - offset > 10 { // Arbitrary threshold for significant movement
                        if !isScrollingDown {
                            isScrollingDown = true
                            onScroll(-1) // Scroll up indication
                        }
                    } else if offset - lastOffset > 10 { // Arbitrary threshold for significant movement
                        if isScrollingDown {
                            isScrollingDown = false
                            onScroll(1) // Scroll down indication
                        }
                    }
                    self.lastOffset = offset
                }
                return Color.clear
            })
        }
    }
}

struct ListView2: View {
    var onScroll: (CGFloat) -> Void
    @State private var lastOffset: CGFloat = 0
    @State private var isScrollingDown = false

    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<30) { item in
                    Text("List Item \(item)")
                        .padding()
                }
            }
            .background(GeometryReader { proxy -> Color in
                let offset = proxy.frame(in: .global).minY
                DispatchQueue.main.async {
                    // Determine if scrolling down
                    if lastOffset - offset > 10 { // Arbitrary threshold for significant movement
                        if !isScrollingDown {
                            isScrollingDown = true
                            onScroll(-1) // Scroll up indication
                        }
                    } else if offset - lastOffset > 10 { // Arbitrary threshold for significant movement
                        if isScrollingDown {
                            isScrollingDown = false
                            onScroll(1) // Scroll down indication
                        }
                    }
                    self.lastOffset = offset
                }
                return Color.clear
            })
        }
    }
}

struct ListView3: View {
    var onScroll: (CGFloat) -> Void
    @State private var lastOffset: CGFloat = 0
    @State private var isScrollingDown = false

    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<30) { item in
                    Text("List Item \(item)")
                        .padding()
                }
            }
            .background(GeometryReader { proxy -> Color in
                let offset = proxy.frame(in: .global).minY
                DispatchQueue.main.async {
                    // Determine if scrolling down
                    if lastOffset - offset > 10 { // Arbitrary threshold for significant movement
                        if !isScrollingDown {
                            isScrollingDown = true
                            onScroll(-1) // Scroll up indication
                        }
                    } else if offset - lastOffset > 10 { // Arbitrary threshold for significant movement
                        if isScrollingDown {
                            isScrollingDown = false
                            onScroll(1) // Scroll down indication
                        }
                    }
                    self.lastOffset = offset
                }
                return Color.clear
            })
        }
    }
}

struct ListView4: View {
    var onScroll: (CGFloat) -> Void
    @State private var lastOffset: CGFloat = 0
    @State private var isScrollingDown = false

    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<30) { item in
                    Text("List Item \(item)")
                        .padding()
                }
            }
            .background(GeometryReader { proxy -> Color in
                let offset = proxy.frame(in: .global).minY
                DispatchQueue.main.async {
                    // Determine if scrolling down
                    if lastOffset - offset > 10 { // Arbitrary threshold for significant movement
                        if !isScrollingDown {
                            isScrollingDown = true
                            onScroll(-1) // Scroll up indication
                        }
                    } else if offset - lastOffset > 10 { // Arbitrary threshold for significant movement
                        if isScrollingDown {
                            isScrollingDown = false
                            onScroll(1) // Scroll down indication
                        }
                    }
                    self.lastOffset = offset
                }
                return Color.clear
            })
        }
    }
}

extension View {
    @ViewBuilder
    func pickeroffsetX(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader { proxy in
                    let rect = proxy.frame(in: .global)
                    
                    Color.clear
                        .preference(key: pickerOffsetKey.self, value: rect)
                        .onPreferenceChange(pickerOffsetKey.self, perform: completion)
                }
            }
    }
}

/// Preference Key
struct pickerOffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}


/// A simple class that will be useful to do linear interpolation calculations for our Dynmaic Tab Animation
class pickerLinearInterpolation {
    private var length: Int
    private var inputRange: [CGFloat]
    private var outputRange: [CGFloat]
    
    init(inputRange: [CGFloat], outputRange: [CGFloat]) {
        /// Safe Check
        assert(inputRange.count == outputRange.count)
        self.length = inputRange.count - 1
        self.inputRange = inputRange
        self.outputRange = outputRange
    }
    
    func calculate(for x: CGFloat) -> CGFloat {
        /// If Value less than it's Initial Input Range
        if x <= inputRange[0] { return outputRange[0] }
        
        for index in 1...length {
            let x1 = inputRange[index - 1]
            let x2 = inputRange[index]
            
            let y1 = outputRange[index - 1]
            let y2 = outputRange[index]
            
            /// Linear Interpolation Formula: y1 + ((y2-y1) / (x2-x1)) * (x-x1)
            if x <= inputRange[index] {
                let y = y1 + ((y2-y1) / (x2-x1)) * (x-x1)
                return y
            }
        }
        
        /// If Value Exceeds it's Maximum Input Range
        return outputRange[length]
    }
}


struct pickerTab: Identifiable, Hashable {
    var id: UUID = UUID()
    var title: String?
    var imageName: String?
    var iconName: String?
    var width: CGFloat = 0
    var minX: CGFloat = 0
}
/// Title is same as the Asset Image Name
var pickertabs_: [pickerTab] = [
    .init(iconName: "square"),
    .init(iconName: "triangle"),
    .init(iconName: "circle"),
    .init(iconName: "diamond"),
]

struct NewCustomHeader: View {
    /// View Properties
    /// @State private var currentTab: pickerTab = pickertabs_.first! // Assuming `pickertabs_` is not empty
    
    @State private var tabs: [pickerTab] = pickertabs_
    @State private var currentTab: pickerTab = pickertabs_[0]
    @State private var contentOffset: CGFloat = 0
    @State private var indicatorWidth: CGFloat = 0
    @State private var indicatorPosition: CGFloat = 0
    @Environment(\.colorScheme) var colorScheme
//    @State private var showToolbar: Bool = true
    @State private var toolbarVisible = true
    @State private var animationScheduled = false
    @State private var hideToolbarWorkItem: DispatchWorkItem?
    
    var body: some View {
            VStack(spacing: 0) {
                if toolbarVisible {
                    StickyPickerCustomToolbar()
                        .transition(.move(edge: .top))
                        .animation(.easeInOut, value: toolbarVisible)
                }
                
                customPicker()
                
                TabView(selection: $currentTab) {
                    ForEach(Array(tabs.enumerated()), id: \.element.id) { (index, tab) in
                        // Use a GeometryReader to adjust the view based on the tab index
                        GeometryReader { geometry in
                            // Determine the view to display based on the index
                            switch index {
                            case 0:
                                ListView(onScroll: { direction in
                                    // Assuming direction -1 is up, 1 is down
                                    if direction == -1 {
                                        // Delay hiding the toolbar to debounce
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { // Adjust delay as needed
                                            self.toolbarVisible = false
                                        }
                                    } else if direction == 1 {
                                        self.toolbarVisible = true
                                    }
                                })
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                            case 1:
                                ListView2(onScroll: { direction in
                                    // Assuming direction -1 is up, 1 is down
                                    if direction == -1 {
                                        // Delay hiding the toolbar to debounce
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { // Adjust delay as needed
                                            self.toolbarVisible = false
                                        }
                                    } else if direction == 1 {
                                        self.toolbarVisible = true
                                    }
                                })
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                            case 2:
                                ListView3(onScroll: { direction in
                                    // Assuming direction -1 is up, 1 is down
                                    if direction == -1 {
                                        // Delay hiding the toolbar to debounce
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { // Adjust delay as needed
                                            self.toolbarVisible = false
                                        }
                                    } else if direction == 1 {
                                        self.toolbarVisible = true
                                    }
                                })
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                
                            case 3:
                                ListView4(onScroll: { direction in
                                    // Assuming direction -1 is up, 1 is down
                                    if direction == -1 {
                                        // Delay hiding the toolbar to debounce
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { // Adjust delay as needed
                                            self.toolbarVisible = false
                                        }
                                    } else if direction == 1 {
                                        self.toolbarVisible = true
                                    }
                                })
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                            default:
                                Text("Tab \(index + 1)")
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                            }
                        }
                        
                        .clipped()
                        .ignoresSafeArea()
                        .pickeroffsetX { rect in
                            if currentTab.id == tab.id {
                                contentOffset = rect.minX - (rect.width * CGFloat(self.index(of: tab)))
                            }
                            
                            updateTabFrame(rect.width)
                        }
                        .tag(tab)
                    }
                    
                }
                .onAppear {
                            // Initialize or reset the toolbar visibility when the view appears
                            toolbarVisible = true
                        }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut, value: currentTab)
                .ignoresSafeArea(edges: .bottom)
                
            }
        }
    
    func handleScroll(_ direction: CGFloat) {
            // Cancel any existing work item if the user scrolls in the opposite direction
            hideToolbarWorkItem?.cancel()

            if direction == 1 { // Scrolling down, show the toolbar immediately
                withAnimation(.easeInOut) {
                    toolbarVisible = true
                }
            } else if direction == -1 { // Scrolling up, hide the toolbar after a delay
                let workItem = DispatchWorkItem {
                    withAnimation(.easeInOut) {
                        self.toolbarVisible = false
                    }
                }
                // Assign the work item so it can be cancelled if needed
                self.hideToolbarWorkItem = workItem
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: workItem)
            }
        }
    
    
    /// Calculating Tab Width & Position
    func updateTabFrame(_ tabViewWidth: CGFloat) {
        let inputRange = tabs.indices.compactMap { index -> CGFloat? in
            return CGFloat(index) * tabViewWidth
        }
        
        let outputRangeForWidth = tabs.compactMap { tab -> CGFloat? in
            return tab.width
        }
        
        let outputRangeForPosition = tabs.compactMap { tab -> CGFloat? in
            return tab.minX
        }
        
        let widthInterpolation = pickerLinearInterpolation(inputRange: inputRange, outputRange: outputRangeForWidth)
        let positionInterpolation = pickerLinearInterpolation(inputRange: inputRange, outputRange: outputRangeForPosition)
        
        indicatorWidth = widthInterpolation.calculate(for: -contentOffset)
        indicatorPosition = positionInterpolation.calculate(for: -contentOffset)
    }
    
    func index(of tab: pickerTab) -> Int {
            return tabs.firstIndex(where: { $0.id == tab.id }) ?? 0
        }
    
    /// Tabs View
    @ViewBuilder
    func customPicker() -> some View {
        HStack(spacing: 0) {
            ForEach(tabs.indices, id: \.self) { index in // Loop over indices
                let tab = tabs[index] // Get the current tab by index
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        currentTab = tab
                        contentOffset = CGFloat(index) * UIScreen.main.bounds.width * -1 // Use index here
                        updateTabFrame(UIScreen.main.bounds.width)
                    }
                }) {
                    HStack {
                        // If it's the first tab (index == 0), you can add specific logic or views here
                        if index == 0 {
                            // Specific view or styling for the first tab
                            Image(systemName: tab.iconName ?? "circle")
                                .foregroundColor(currentTab.id == tab.id ? (colorScheme == .dark ? .white : .black) : .gray)
                        } else {
                            // General view for other tabs
                            if let iconName = tab.iconName {
                                Image(systemName: iconName)
                                    .foregroundColor(currentTab.id == tab.id ? (colorScheme == .dark ? .white : .black) : .gray)
                            } else if let imageName = tab.imageName {
                                Image(imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20) // Adjust the frame as necessary
                            }
                        }
                        
                        if let title = tab.title {
                            Text(title)
                                .foregroundColor(currentTab.id == tab.id ? (colorScheme == .dark ? .white : .black) : .gray)
                                .padding(.leading, tab.iconName != nil || tab.imageName != nil ? 8 : 0) // Add padding if there is an icon/image
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .overlay(
                        GeometryReader { proxy in
                            Color.clear
                                .onAppear {
                                let rect = proxy.frame(in: .global)
                                if index == 0 {
                                    indicatorWidth = rect.width
                                    indicatorPosition = rect.minX
                                }
                                updateTabWithRect(tabId: tab.id, rect: rect)
                            }
                        }
                    )
                }
            }
        }
        .overlay(alignment: .bottomLeading, content: {
            Rectangle()
                .frame(width: indicatorWidth, height: 3)
                .offset(x: indicatorPosition, y: 10)
                .animation(.easeInOut(duration: 0.3), value: indicatorPosition + indicatorWidth)
        })
        Divider()
            .frame(height: 10)
            .offset(y: 6)
    }
    func updateTabWithRect(tabId: UUID, rect: CGRect) {
        if let index = tabs.firstIndex(where: { $0.id == tabId }) {
            tabs[index].minX = rect.minX
            tabs[index].width = rect.width
        }
    }

}

//struct StickyHeaderCustomToolbar: View {
////    @Binding var isOpened: Bool
////    @EnvironmentObject var viewModel: MainViewModel
//    
//    var body: some View {
//        CustomToolbar(
//            leftContent: {
//                AnyView(HStack(spacing: 28) {
//                    Button(action: {
////                        viewModel.toggleSearchBarVisibility()
//                    }) {
//                        Image(systemName: "magnifyingglass")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                    Button(action: {
////                        isOpened.toggle()
//                    }) {
//                        Image(systemName: "menucard")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                })
//            },
//            centerContent: {
//                AnyView(Text("Toolbar").font(.headline))
//            },
//            rightContent: {
//                AnyView(HStack(spacing: 28) {
//                    Button(action: {
////                        viewModel.toggleSearchBarVisibility()
//                    }) {
//                        Image(systemName: "magnifyingglass")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                    Button(action: {
////                        isOpened.toggle()
//                    }) {
//                        Image(systemName: "menucard")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                })
//            }
//        )
//    }
//}


#Preview {
    NewCustomHeader()
}