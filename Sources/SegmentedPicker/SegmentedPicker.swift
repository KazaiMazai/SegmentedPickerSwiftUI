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
    
    @State private var frames: [Data.Index: CGRect] = [:]
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
                    .frame(width: selectionFrame(at: index).width,
                           height: selectionFrame(at: index).height)
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
                        Color.clear.onAppear {
                            frames[index] = proxy.frame(in: .global)
                        }
                    })
                    .alignmentGuide(.horizontalCenterAlignment,
                                    isActive: selectedIndex == index) { dimensions in
                        dimensions[HorizontalAlignment.center]
                    }
                }
            }
        }
    }
    
    private func selectionFrame(at index: Data.Index) -> CGRect {
        frames[index] ?? .zero
    }
}
