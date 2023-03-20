//
//  AttributedText.swift
//
//
//  Created by Kristóf Kálai on 2023. 03. 20..
//

import SwiftUI

public struct AttributedText {
    private let attributedString: NSAttributedString
    @State private var size: CGSize = .zero

    public init(attributedString: NSAttributedString) {
        self.attributedString = attributedString
    }
}

extension AttributedText: View {
    public var body: some View {
        GeometryReader {
            _AttributedText(size: $size, attributedString: attributedString, proposedWidth: $0.size.width)
        }
        .frame(height: size.height)
    }
}
