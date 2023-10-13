//
//  PlaceholderView.swift
//  Swipen
//
//  Created by 伊藤直輝 on 2023/10/08.
//

import SwiftUI

struct PlaceholderView<Content: View, PlaceholderView: View>: View {
  var `if`: Bool
  
  @ViewBuilder var content: () -> Content
  @ViewBuilder var placeholder: () -> PlaceholderView
  
  var body: some View {
    if `if` {
      content()
    }
    else {
      placeholder()
    }
  }
}

#Preview {
  PlaceholderView(if: false) {
    Text("Hello, world!")
  } placeholder: {
    Text("Not, hello world!")
  }
}
