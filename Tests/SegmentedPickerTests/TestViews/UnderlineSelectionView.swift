//
//  File.swift
//  
//
//  Created by Sergey Kazakov on 15/06/2024.
//

import SwiftUI
@testable import SegmentedPicker

struct UnderlineSelectionView: View {
    let titles: [String]
    @State var selectedIndex: Int?
    
    var body: some View {
        VStack {
            SegmentedPicker(
                titles,
                selectedIndex: Binding(
                    get: { selectedIndex },
                    set: { selectedIndex = $0 }),
                selectionAlignment: .bottom,
                content: { item, isSelected in
                    Text(item)
                    
                        .foregroundColor(isSelected ? Color.black : Color.gray )
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                },
                selection: {
                    VStack(spacing: 0) {
                        Spacer()
                        Color.black.frame(height: 1)
                    }
                })
            Spacer()
        }
    }
}
