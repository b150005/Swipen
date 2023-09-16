//
//  LearnView.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/07.
//

import SwiftUI

struct LearnView: View {
  var body: some View {
    ScrollableCardView(
      """
      aa
      bb
      cc
      dd
      ee
      ff
      gg
      hh
      ii
      """
    )
  }
}

#Preview {
  LearnView()
}

struct ScrollableCardView: View {
  @State var text: String
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 15, style: .circular)
        .fill(.primary)
      ScrollView(.vertical) {
        Text(text)
          .font(.caption)
          .foregroundStyle(.gray)
      }
      
    }
    .padding()
  }
  
  init(_ text: String) {
    self.text = text
  }
}
