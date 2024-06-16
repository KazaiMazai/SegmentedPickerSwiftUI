//
//  File.swift
//
//
//  Created by Sergey Kazakov on 15/06/2024.
//
import SwiftUI
import UIKit
import XCTest
import SnapshotTesting
@testable import SegmentedPicker

extension CGSize {
    static let testView: CGSize = CGSize(width: 390, height: 844)
}

#if os(iOS) || os(tvOS)
final class UnderlineSelectionViewTest: XCTestCase {
    
    func test_WhenSelectionIsNotProvided_SelectionIsNotVisible_Snapshot() {
        let view = UnderlineSelectionView(titles: ["One", "Two", "Three"])
        assertSnapshots(of: view, as: [.image(layout: .device(config: .iPhone13))])
    }

    func test_WhenSelectionIsProvided_SelectionIsVisible_Snapshot() {
        let view = UnderlineSelectionView(titles: ["One", "Two", "Three"], selectedIndex: 1)
        assertSnapshots(of: view, as: [.image(layout: .device(config: .iPhone13))])
    }
}
#endif
