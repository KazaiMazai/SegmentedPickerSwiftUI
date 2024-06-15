//
//  File.swift
//  
//
//  Created by Sergey Kazakov on 15/06/2024.
//

import SwiftUI
import XCTest
import SnapshotTesting
@testable import SegmentedPicker
 
final class CapsuleSelectionViewTests: XCTestCase {
    func test_WhenSelectionIsNotProvided_SelectionIsNotVisible_Snapshot() {
        let view = CapsuleSelectionView(titles: ["One", "Two", "Three"])
        assertSnapshots(of: view, as: [.image(layout: .device(config: .iPhone13Pro))])
    }
    
    func test_WhenSelectionIsProvided_SelectionIsVisible_Snapshot() {
        let view = CapsuleSelectionView(titles: ["One", "Two", "Three"], selectedIndex: 1)
        assertSnapshots(of: view, as: [.image(layout: .device(config: .iPhone13Pro))])
    }
}
