//
//  GenericMultiSegmentSelectorView.swift
//  CommerceHQ-iOS
//
//  Created by Sergey Kazakov on 17.03.2021.
//

import SwiftUI


public struct SegmentedPicker<Element, Content, Selection>: View
    where
    Content: View,
    Selection: View {
    
    public typealias Data = [Element]
    
    @State private var segmentSizes: [Data.Index: CGSize] = [:]
    @Binding private var selectedIndex: Data.Index?

    private let data: Data
    private let selection: () -> Selection
    private let content: (Data.Element, Bool) -> Content
    private let selectionAlignment: VerticalAlignment

    public init(_ data: Data,
                selectedIndex: Binding<Data.Index?>,
                selectionAlignment: VerticalAlignment = .center,
                @ViewBuilder content: @escaping (Data.Element, Bool) -> Content,
                @ViewBuilder selection: @escaping () -> Selection) {

        self.data = data
        self.content = content
        self.selection = selection
        self._selectedIndex = selectedIndex
        self.selectionAlignment = selectionAlignment
    }
    

    public var body: some View {
        ZStack(alignment: Alignment(horizontal: .horizontalCenterAlignment,
                                    vertical: selectionAlignment)) {

            if let index = selectedIndex {
                selection()
                    .frame(width: selectionSize(at: index).width,
                           height: selectionSize(at: index).height)
                    .alignmentGuide(.horizontalCenterAlignment) { dimensions in
                        dimensions[HorizontalAlignment.center]
                    }
            }

            HStack(spacing: 0) {
                ForEach(data.indices, id: \.self) { index in
                    Button(action: { selectedIndex = index },
                           label: { content(data[index], selectedIndex == index) }
                    )
                    .buttonStyle(PlainButtonStyle())
                    .background(GeometryReader { proxy in
                        Color.clear.preference(
                            key: SegmentSizePreferenceKey.self,
                            value: SegmentSize(index: index, size: proxy.size)
                        )
                    })
                    .onPreferenceChange(SegmentSizePreferenceKey.self) { segment in
                        segmentSizes[segment.index] = segment.size
                    }
                    .alignmentGuide(.horizontalCenterAlignment,
                                    isActive: selectedIndex == index) { dimensions in
                        dimensions[HorizontalAlignment.center]
                    }
                }
            }
        }
    }
    
    private func selectionSize(at index: Data.Index) -> CGSize {
        segmentSizes[index] ?? .zero
    }
}

private extension SegmentedPicker {
    struct SegmentSize: Equatable {
        let index: Int
        let size: CGSize
    }
    
    struct SegmentSizePreferenceKey: PreferenceKey {
        static var defaultValue: SegmentSize { SegmentSize(index: .zero, size: .zero) }
        
        static func reduce(value: inout SegmentSize, 
                           nextValue: () -> SegmentSize) {
            
            value = nextValue()
        }
    }
}
