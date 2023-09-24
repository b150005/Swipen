//
//  InfiniteTabPageView.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/22.
//

import SwiftUI

struct InfiniteTabPageView<Content: View>: View {
  @GestureState private var translation: CGFloat = .zero
  @State private var currentPage: UInt8 = .zero
  @State private var offset: CGFloat = .zero
  
  var body: some View {
    
  }
}

#Preview {
  InfiniteTabPageView()
}
