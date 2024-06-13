//
//  SocialCustomPicker.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/12/24.
//

import SwiftUI


extension CGFloat {
    func socialinterpolate(inputRange: [CGFloat], outputRange: [CGFloat]) -> CGFloat {
        /// If Value less than it's Initial Input Range
        let x = self
        let length = inputRange.count - 1
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

extension View {
    func socialrect(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let rect = $0.frame(in: .scrollView(axis: .horizontal))
                    
                    Color.clear
                        .preference(key: socialRectKey.self, value: rect)
                        .onPreferenceChange(socialRectKey.self, perform: completion)
                }
            }
    }
}

struct socialRectKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

// TabModel for the tabs in CustomTabBar
struct SocialTabModel: Identifiable {
    private(set) var id: Tab
    var size: CGSize = .zero
    var minX: CGFloat = .zero
    
    enum Tab: String, CaseIterable {
        case research = "Outlook"
        case deployment = "Habits"
        case analytics = "Analytics"
        case audience = "Audience"
        case privacy = "Privacy"
    }
}

// CustomTabBar component
struct SocialCustomTabBar: View {
    @Binding var tabs: [SocialTabModel]
    @Binding var activeTabIndex: Int
    @Binding var tabBarScrollState: SocialTabModel.Tab?
    @Binding var mainViewScrollState: SocialTabModel.Tab?
    @Binding var progress: CGFloat
    @Binding var indicatorWidth: CGFloat
    @Binding var indicatorPosition: CGFloat
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                //ForEach($tabs) { $tab in
                ForEach(Array(tabs.enumerated()), id: \.element.id) { index, tab in
                    Button(action: {
                        activeTabIndex = index // Added
                    }) {
                        Text(tab.id.rawValue)
                            .fontWeight(.medium)
                            .padding(.vertical, 12)
                            .foregroundStyle(activeTabIndex == index ? Color.primary : .gray) // Added
                            .contentShape(.rect)
                    }
                    .buttonStyle(.plain)
                    .socialrect { rect in
                        tabs[index].size = rect.size // Added
                        tabs[index].minX = rect.minX // Added
                    }
                }
            }
            // Will be called when user scrolls or taps a new tab
            .onChange(of: activeTabIndex) {
                withAnimation(.snappy) {
                    let tab = tabs[activeTabIndex]
                    tabBarScrollState = tab.id
                    mainViewScrollState = tab.id
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: .init(get: {
            return tabBarScrollState
        }, set: { _ in
            
        }), anchor: .center)
        .overlay(alignment: .bottom) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(height: 1)
                    .padding(.horizontal, -15)
                
                Rectangle()
                    .fill(.primary)
                    .frame(width: indicatorWidth, height: 1.5)
                    .offset(x: indicatorPosition)
                    .animation(.snappy, value: indicatorWidth)
            }
        }
        .safeAreaPadding(.horizontal, 15)
        .scrollIndicators(.hidden)
    }
}

// FettleTab for the tabs in FettleCustomPicker
struct SocialTab: Identifiable, Hashable {
    var id: UUID = UUID()
    var title: String?
    var imageName: String?
    var iconName: String?
    var width: CGFloat = 0
    var minX: CGFloat = 0
    
    static var sampleTabs: [SocialTab] = [
        .init(title: "MyFettle"),
        .init(title: "MyFettle"),
        .init(title: "MyFettle"),
        .init(title: "MyFettle"),
        .init(title: "MyFettle"),
        .init(title: "MyFettle"),
        .init(title: "MyFettle"),
        .init(title: "MyFettle")
    ]
}

// FettleCustomToolbar component
struct SocialCustomToolbar: View {
    @StateObject var viewModel: MainViewModel
    @Binding var isOpened: Bool
    @Binding var showCalendar: Bool
    @Binding var selectedNotificationsTab: Int
    
    var body: some View {
        CustomToolbar(
            leftContent: {
                AnyView(VStack(alignment: .leading, spacing: -4) {
                    HStack {
                        Image(systemName: "newspaper")
                            .font(.title2)
                        Text("Media")
                            .font(.title2)
                    }
                })
            },
            centerContent: {
                AnyView(Text("").font(.title2))
            },
            rightContent: {
                AnyView(HStack(spacing: 20) {
                    Button(action: {
                    }) {
                        Image(systemName: "message")
                            .imageScale(.large)
                            .tint(.primary)
                    }
                    Button(action: {
                    }) {
                        Image(systemName: "bell")
                            .imageScale(.large)
                            .tint(.primary)
                    }
                    Button(action: {}, label: {
                        Image("placeholder/user")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                    })
                })
            }
        )
    }
}

// Enum for swipe direction
enum SocialSwipeDirection {
    case up, down, left, right, none
}

// FettleTabView component
struct SocialTabView: View {
    @Binding var tabs: [SocialTabModel]
    @Binding var currentTabIndex: Int // Added
    @Binding var indicatorWidth: CGFloat
    @Binding var indicatorPosition: CGFloat
    let onSwipe: (SocialSwipeDirection) -> Void
    
    @State private var contentOffset: CGFloat = 0
    @State private var geometryFrame: CGRect = .zero
    
    func updateTabFrame(_ tabViewWidth: CGFloat) {
        let inputRange = tabs.indices.compactMap { index -> CGFloat? in
            return CGFloat(index) * tabViewWidth
        }
        
        let outputRangeForWidth = tabs.compactMap { tab -> CGFloat? in
            return tab.size.width
        }
        
        let outputRangeForPosition = tabs.compactMap { tab -> CGFloat? in
            return tab.minX
        }
        
        let widthInterpolation = SocialLinearInterpolation(inputRange: inputRange, outputRange: outputRangeForWidth)
        let positionInterpolation = SocialLinearInterpolation(inputRange: inputRange, outputRange: outputRangeForPosition)
        
        indicatorWidth = widthInterpolation.calculate(for: -contentOffset)
        indicatorPosition = positionInterpolation.calculate(for: -contentOffset)
    }
    
    func index(of tab: SocialTabModel) -> Int {
        return tabs.firstIndex(where: { $0.id == tab.id }) ?? 0
    }
    
    var body: some View {
        TabView(selection: $currentTabIndex) { // Added
            ForEach(Array(tabs.enumerated()), id: \.element.id) { index, tab in
                GeometryReader { geometry in
                    switch tab.id {
                    case .research:
                        SocialListView(
                            onSwipe: { direction in
                                onSwipe(direction)
                            }
                        )
                        .frame(width: geometry.size.width, height: geometry.size.height)
//                    case .deployment:
//                        FettleActivityView()
//                            .environmentObject(HealthManager())
                    case .deployment:
                        HabitsFeedView()
                    default:
                        Text("Tab \(index + 1)")
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                }
                .clipped()
                .ignoresSafeArea()
                .socialrect { rect in
                    if currentTabIndex == index { // Added
                        contentOffset = rect.minX - (rect.width * CGFloat(self.index(of: tab)))
                    }
                    updateTabFrame(rect.width)
                }
                .tag(index) // Added
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.easeInOut, value: currentTabIndex) // Added
        .overlay(
            GeometryReader { geometry in
                Color.clear
                    .preference(key: socialRectKey.self, value: geometry.frame(in: .global))
                    .onPreferenceChange(socialRectKey.self) { value in
                        geometryFrame = value
                        let width = geometry.size.width
                        contentOffset = -geometryFrame.minX / width
                        updateTabFrame(width)
                    }
            })
        .ignoresSafeArea(edges: .bottom)
        .SocialdetectSwipe(
            onSwipe: { direction in
                onSwipe(direction)
            }
        )
    }
}

// Linear Interpolation class
class SocialLinearInterpolation {
    private var length: Int
    private var inputRange: [CGFloat]
    private var outputRange: [CGFloat]
    
    init(inputRange: [CGFloat], outputRange: [CGFloat]) {
        assert(inputRange.count == outputRange.count)
        self.length = inputRange.count - 1
        self.inputRange = inputRange
        self.outputRange = outputRange
    }
    
    func calculate(for x: CGFloat) -> CGFloat {
        if x <= inputRange[0] { return outputRange[0] }
        
        for index in 1...length {
            let x1 = inputRange[index - 1]
            let x2 = inputRange[index]
            
            let y1 = outputRange[index - 1]
            let y2 = outputRange[index]
            
            if x <= inputRange[index] {
                let y = y1 + ((y2-y1) / (x2-x1)) * (x-x1)
                return y
            }
        }
        
        return outputRange[length]
    }
}

// FettleCustomPicker component
struct SocialCustomPicker: View {
    @StateObject var viewModel: MainViewModel // Change this to ObservedObject
    @Binding var isOpened: Bool
    @State private var tabs: [SocialTabModel] = [
        .init(id: .research), // 0
        .init(id: .deployment), // 1
        .init(id: .analytics), // 2
        .init(id: .audience), // 3
        .init(id: .privacy) // 4
    ]
    @State private var activeTab: SocialTabModel.Tab = .research    // Below line must match
    @State private var activeTabIndex = 0                           // Above line must match
    @State private var tabBarScrollState: SocialTabModel.Tab?
    @State private var mainViewScrollState: SocialTabModel.Tab?
    @State private var progress: CGFloat = .zero
    @State private var indicatorWidth: CGFloat =  0.0
    @State private var indicatorPosition: CGFloat = 0.0
    @State private var showCalendar: Bool = false
    @State private var currentCategory: SocialCategory = .foryou
    @State private var isToolbarVisible = true
    
    func action1() {
        print("Action 1 selected")
    }
    
    func action2() {
        print("Action 2 selected")
    }
    
    func action3() {
        print("Action 3 selected")
    }
    
    func action4() {
        print("Action 4 selected")
    }
    
    func action5() {
        print("Action 5 selected")
    }
    
    func action6() {
        print("Action 6 selected")
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if isToolbarVisible {
                SocialCustomToolbar(viewModel: viewModel,
                                    isOpened: $isOpened,
                                    showCalendar: $showCalendar,
                                    selectedNotificationsTab: $viewModel.selectedNotificationsTab)
            }
            SocialCustomTabBar(tabs: $tabs,
                               activeTabIndex: $activeTabIndex,
                               tabBarScrollState: $tabBarScrollState,
                               mainViewScrollState: $mainViewScrollState,
                               progress: $progress,
                               indicatorWidth: $indicatorWidth,
                               indicatorPosition: $indicatorPosition) // Added
            
            SocialTabView(
                tabs: $tabs,
                //currentTab: $activeTab,
                currentTabIndex: $activeTabIndex, // Added
                indicatorWidth: $indicatorWidth,
                indicatorPosition: $indicatorPosition,
                onSwipe: { direction in
                    print("NewView direction: \(direction)")
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isToolbarVisible = (direction == .up) ? false : true
                    }
                }
            )
        }
    }
}

// Other supporting components and extensions
struct SocialListView: View {
    let onSwipe: (SocialSwipeDirection) -> Void
    @State private var previousOffset: CGFloat = 0
    @State private var currentOffset: CGFloat = 0
    @State private var swipeDirection: SocialSwipeDirection = .none
    @State private var prevDirection: SocialSwipeDirection = .none
    @State private var prevPrevDirection: SocialSwipeDirection = .none
    
    func determineScrollDirection() {
        guard abs(currentOffset - previousOffset) > 30 else {
            return
        }
        if currentOffset > previousOffset {
            swipeDirection = .down
        } else if currentOffset < previousOffset {
            swipeDirection = .up
        } else {
            swipeDirection = .none
        }
        if prevPrevDirection == swipeDirection {
            if swipeDirection != .none {
                onSwipe(swipeDirection)
            }
        }
        previousOffset = currentOffset
        prevPrevDirection = prevDirection
        prevDirection = swipeDirection
    }
    
    var body: some View {
//        ScrollView {
            VStack(spacing: 20) {
                ListedBinaryView(
                                        binary: Binary(
                                            name: "Jane Doe",
                                            username: "@jane",
                                            title: "AI Will Be President",
                                            body: "We are approaching GPT 5, and it is supposed to be exponentially better than the last model.",
                                            media: .photo(Image("placeholderImage")),  // Assuming you have a placeholder image in your assets
                                            priceChange: "+$2.00",
                                            priceChangePercentage: "+1.25%"
                                        ),
                                        selectedBinary: .constant(nil), showActionBar: .constant(false)
                                    )
            }
            .padding()
            .background(
                GeometryReader { geo in
                    Color.clear
                        .onChange(of: geo.frame(in: .global).minY) { newValue in
                            currentOffset = newValue
                            determineScrollDirection()
                        }
                }
            )
//        }
    }
}




enum SocialCategory: String, CaseIterable {
    case foryou = "For You"
    case following = "Following"
    case recent = "Most Recent"

    var systemImageName: String {
        switch self {
        case .foryou: return "heart.rectangle"
        case .following: return "person.crop.circle.badge.checkmark"
        case .recent: return "arrow.circlepath"
        }
    }
}

extension View {
    func SocailoffsetX(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader { proxy in
                    let rect = proxy.frame(in: .global)
                    
                    Color.clear
                        .preference(key: SocialpickerOffsetKey.self, value: rect)
                        .onPreferenceChange(SocialpickerOffsetKey.self, perform: completion)
                }
            }
    }
    
    func SocialdetectSwipe(onSwipe: @escaping (SocialSwipeDirection) -> ()) -> some View {
        self
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let verticalDistance = value.location.y - value.startLocation.y
                        let swipeThreshold = 5.0
                        if verticalDistance > swipeThreshold {
                            onSwipe(.down)
                        } else if verticalDistance < -swipeThreshold {
                            onSwipe(.up)
                        }
                    }
            )
    }
}

struct SocialpickerOffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

struct SocialCustomPicker_Previews: PreviewProvider {
    static var previews: some View {
        SocialCustomPicker(viewModel: MainViewModel(), isOpened: .constant(false))
    }
}

