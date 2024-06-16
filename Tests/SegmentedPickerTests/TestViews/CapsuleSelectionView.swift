//
//  File.swift
//  
//
//  Created by Sergey Kazakov on 15/06/2024.
//

import SwiftUI
@testable import SegmentedPicker

struct CapsuleSelectionView: View {
   let titles: [String]
       @State var selectedIndex: Int?

   var body: some View {
       VStack {
           SegmentedPicker(
               titles,
               selectedIndex: Binding(
                   get: { selectedIndex },
                   set: { selectedIndex = $0 }),
               content: { item, isSelected in
                   Text(item)
                       .foregroundColor(isSelected ? Color.white : Color.gray )
                       .padding(.horizontal, 16)
                       .padding(.vertical, 8)
               },
               selection: {
                   Capsule()
                       .fill(Color.gray)
               })
       }

       Spacer()
   }
}
