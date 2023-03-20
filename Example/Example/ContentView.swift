//
//  ContentView.swift
//  Example
//
//  Created by Kristóf Kálai on 2023. 03. 20..
//

import AttributedText
import SwiftUI

struct ContentView: View {
    private let attributedString: NSAttributedString = {
        let string = "This is an example text, which should contain a linebreak, since it's very long"
        let attributedString = NSMutableAttributedString(string: string)

        let firstRange = (string as NSString).range(of: "example text")
        attributedString.addAttribute(.font, value: UIFont(name: "Papyrus", size: 36.0) as Any, range: firstRange)

        let secondRange = (string as NSString).range(of: "linebreak")
        attributedString.addAttributes([.foregroundColor: UIColor.blue, .kern: 5], range: secondRange)

        return attributedString
    }()

    var body: some View {
        VStack {
            AttributedText(attributedString: attributedString)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
