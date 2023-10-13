//
//  ContentListView.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/07.
//

import SwiftUI
import SwiftData

struct ContentListView: View {
  @State private var selection: DisplayMode = .tag
  
  @Query(sort: \Tag.id) private var tags: [Tag]
  @Query(sort: \LearningContent.id) private var contents: [LearningContent]
  
  private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
  
  private enum DisplayMode: String, CaseIterable {
    case tag = "タグ"
    case detail = "詳細"
  }
  
  private var content: some View {
    ScrollView(.vertical) {
      LazyVStack {
        ForEach(0...50, id: \.self) { index in
          Text("Hello, world!")
        }
      }
    }
    .clipped()
    .frame(maxHeight: .infinity)
    .ignoresSafeArea()
    .zIndex(-1.0)
  }
  
  var body: some View {
    NavigationStack {
      VStack {
        ZStack {
          Picker(selection: $selection) {
            ForEach(DisplayMode.allCases, id: \.self) { (mode: DisplayMode) in
              Text(mode.rawValue).tag(mode)
            }
          } label: {
            Text("表示項目")
          }
          .pickerStyle(.segmented)
          .padding(.horizontal)
        }
        
        switch selection {
          case .tag:
            PlaceholderView(if: tags.count > 0) {
              content
            } placeholder: {
              // TODO: 文言とデザインの修正
              Text("タグがまだ登録されていません。\n右上の+ボタンをタップしてタグを\n追加してみましょう！")
            }
            .frame(maxHeight: .infinity)
          case .detail:
            PlaceholderView(if: contents.count > 0) {
              content
            } placeholder: {
              // TODO: 文言とデザインの修正
              Text("コンテンツがまだ登録されていません。\n右上の+ボタンをタップしてコンテンツを\n追加してみましょう！")
            }
            .frame(maxHeight: .infinity)
        }
      }
      .navigationTitle("追加したコンテンツ")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          NavigationLink {
            switch selection {
              case .tag:
                TagAddView()
              case .detail:
                ContentAddView()
            }
          } label: {
            Image(systemName: "plus")
          }
        }
      }
    }
  }
}

#Preview {
  ContentListView()
    .environment(ScreenSizeStore())
    .modelContainer(for: [Tag.self, LearningContent.self])
}
