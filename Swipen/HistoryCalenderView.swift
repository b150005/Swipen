//
//  HistoryCalenderView.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/19.
//

import SwiftUI

struct HistoryCalenderView: View {
  @State private var itemIndexes: [Int] = Array(0 ..< 21)
  @GestureState private var isDragging: Bool = false
  
  var body: some View {
    GeometryReader { (geometry: GeometryProxy) in
      ScrollViewReader { (scrollView: ScrollViewProxy) in
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHStack {
            ForEach(itemIndexes, id: \.self) { (index: Int) in
              VStack {
                Button {
                  print("Button \(index) tapped")
                } label: {
                  Text("M")
                    .font(.headline)
                    .bold()
                    .padding()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(style: StrokeStyle()).foregroundStyle(.gray))
                }
                Text("\(index)")
              }
              .rotationEffect(.degrees(180))
              .id(index)
            }
          }
          .rotationEffect(.degrees(180))
          .padding(.horizontal)
        }
        .frame(height: 100)
      }
    }
  }
}

#Preview {
  HistoryCalenderView()
}
