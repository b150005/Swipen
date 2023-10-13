//
//  TagCardView.swift
//  Swipen
//
//  Created by 伊藤直輝 on 2023/10/08.
//

import SwiftUI
import SwiftData

struct TagCardView: View {
  @Environment(\.modelContext) private var context
  @Query private var tags: [Tag]
  
  var body: some View {
    VStack {
      CardView {
        Button {
          // TODO: ContentListViewに遷移
        } label: {
          Image(systemName: "star.fill")
        }
      }
      HStack {
        Text("text")
        Button {
          // TODO: お気に入りに登録
        } label: {
          Image(systemName: "bookmark")
        }
      }
    }
  }
}

#Preview {
  TagCardView()
}
