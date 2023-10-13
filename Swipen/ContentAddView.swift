//
//  ContentAddView.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/07.
//

import SwiftUI

struct ContentAddView: View {
  @State private var sentence_ja: String = ""
  @State private var sentence_en: String = ""
  @State private var phrases_ja: [String] = [""]
  @State private var phrases_en: [String] = [""]
  
  var body: some View {
    NavigationStack {
      Form {
        Section {
          TextField("和文", text: $sentence_ja, axis: .vertical)
          TextField("英文", text: $sentence_en, axis: .vertical)
            .keyboardType(.alphabet)
        } header: {
          Text("文章")
        }
        
        ForEach(phrases_ja.indices, id: \.self) { (index: Int) in
          Section {
            TextField("フレーズ - 和文", text: $phrases_ja[index], axis: .vertical)
              .onChange(of: phrases_ja[index]) {
                updateTextFieldsIfNeeded(at: index, of: phrases_ja)
              }
            TextField("フレーズ - 英文", text: $phrases_en[index], axis: .vertical)
              .keyboardType(.alphabet)
              .onChange(of: phrases_en[index]) {
                updateTextFieldsIfNeeded(at: index, of: phrases_en)
              }
          } header: {
            Text("フレーズ\(index + 1)")
          }
        }
      }
      .navigationTitle("コンテンツを追加")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          NavigationLink {
            // TODO: JSON形式によるコンテンツ登録
            Text("a")
          } label: {
            VStack {
              Image(systemName: "plus")
              Text("JSON形式による登録")
                .font(.footnote)
            }
          }
        }
      }
    }
  }
  
  private func updateTextFieldsIfNeeded(at index: Int, of state: [String]) {
    if index != state.startIndex - 1, phrases_ja[index].isEmpty, phrases_en[index].isEmpty {
      phrases_ja.remove(at: index)
      phrases_en.remove(at: index)
    }
    else if (!phrases_ja[index].isEmpty || !phrases_en[index].isEmpty),
            index == phrases_ja.endIndex - 1 {
      phrases_ja.append("")
      phrases_en.append("")
    }
  }
}

#Preview {
  ContentAddView()
    .modelContainer(for: [LearningContent.self, Sentence.self, Phrase.self, Tag.self])
}
