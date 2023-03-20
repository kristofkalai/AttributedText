//
//  _AttributedText.swift
//  
//
//  Created by Kristóf Kálai on 2023. 03. 20..
//

import SwiftUI

struct _AttributedText {
    @Binding var size: CGSize
    let attributedString: NSAttributedString
    let proposedWidth: CGFloat
}

extension _AttributedText: View {
    var body: some View {
        AttributedTextRepresentable(attributedString: attributedString, proposedWidth: proposedWidth, size: $size)
            .frame(width: proposedWidth, height: size.height)
    }
}

extension _AttributedText {
    private struct AttributedTextRepresentable: UIViewRepresentable {
        let attributedString: NSAttributedString
        let proposedWidth: CGFloat
        @Binding var size: CGSize

        func makeUIView(context: Context) -> UILabel {
            let label = UILabel()

            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = .zero
            label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

            return label
        }

        func updateUIView(_ uiView: UILabel, context: Context) {
            uiView.attributedText = attributedString

            DispatchQueue.main.async {
                size = uiView.sizeThatFits(.init(width: proposedWidth, height: .infinity))
            }
        }
    }
}
