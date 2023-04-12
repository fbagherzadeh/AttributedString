//
//  ContentView.swift
//  AttributedString
//
//  Created by Farhad Bagherzadeh on 28/3/2023.
//  Ref: https://sarunw.com/posts/attributed-string/
//

import SwiftUI

// MARK: AttributedString in iOS 15 - Introduction
// Over the years, Apple has made many improvements over old data types e.g., String (NSString), Date (NSDate), Calendar (NSCalendar).
// NSAttributedString allow us to associate attributes such as visual style and hyperlinks to a part of its string.
// In iOS 15, we got the new AttributedString, an improved version of NSAttributedString.

struct ContentView: View {
  var body: some View {
    VStack {
      // MARK: NSAttributedString
       Text(AttributedString(basicNSAttributedString))


      // MARK: AttributedString
      // Basic
      Text(basicAttributedString)

      // Concatenate Two AttributedString
      Text(helloString + attributedString)

      // Create AttributedString using AttributedContainer - merging or as a parameter when creating
      Text(importantString.mergingAttributes(highlightedAttributes))
      Text(AttributedString("Also important", attributes: highlightedAttributes))

      // Range - partially styling
      Text(partiallyAttributedString)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


private extension ContentView {
  var basicNSAttributedString: NSAttributedString {
    let string = "Attributed String"
    let attributes: [NSAttributedString.Key : Any] = [
      .foregroundColor: UIColor.systemPink,
      .font: UIFont.boldSystemFont(ofSize: 40),
      .underlineStyle: NSUnderlineStyle.single.rawValue
    ]
    let attributedString = NSAttributedString(string: string, attributes: attributes)
    return attributedString
  }
  var basicAttributedString: AttributedString {
    let string = "Attributed String"
    var attributedString = AttributedString(string)

    attributedString.foregroundColor = .pink
    attributedString.font = .boldSystemFont(ofSize: 40)
    attributedString.underlineStyle = .single

    return attributedString
  }


  var helloString: AttributedString {
    let string = "Hello, "
    var attributedString = AttributedString(string)

    attributedString.foregroundColor = .yellow
    attributedString.backgroundColor = .pink
    attributedString.font = .systemFont(ofSize: 40)

    return attributedString
  }
  var attributedString: AttributedString {
    let string = "Attributed String"
    var attributedString = AttributedString(string)

    attributedString.foregroundColor = .pink
    attributedString.backgroundColor = .yellow
    attributedString.font = .boldSystemFont(ofSize: 40)
    attributedString.underlineStyle = .single

    return attributedString
  }

  var highlightedAttributes: AttributeContainer {
    var container = AttributeContainer()
    container.backgroundColor = .yellow
    container.font = .boldSystemFont(ofSize: 12)

    return container
  }
  var importantString: AttributedString {
    let string = "Important String"
    var attributedString = AttributedString(string)

    attributedString.foregroundColor = .pink
    attributedString.font = .systemFont(ofSize: 40)

    return attributedString
  }

  var partiallyAttributedString: AttributedString {
    let string = "Attributed String"
    var attributedString = AttributedString(string)

    if let range = attributedString.range(of: "Attributed") {
      attributedString[range].foregroundColor = .orange
      attributedString[range].underlineStyle = .single
    }

    return attributedString
  }
}

