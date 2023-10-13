//
//  TagAddView.swift
//  Swipen
//
//  Created by 伊藤直輝 on 2023/10/12.
//

import SwiftUI
import SwiftData

struct TagAddView: View {
  @State private var tags: [String] = [""]
  @FocusState private var textFieldFocus: Bool
  
  var body: some View {
    NavigationStack {
      Form {
        Section {
          ForEach($tags.indices, id: \.self) { (index: Int) in
            TextField("タグ\(index + 1)", text: $tags[index])
              .autocorrectionDisabled()
              // TODO: ソフトウェアキーボードを閉じる
              .scrollDismissesKeyboard(.immediately)
              .focused($textFieldFocus)
              .onChange(of: tags[index]) {
                updateTextFieldsIfNeeded(at: index, of: tags)
              }
              .onChange(of: textFieldFocus) {
                if !textFieldFocus, !tags[index].isEmpty, isDuplicated(tags[index]) {
                  // TODO: バリデーションエラーの場合はフォーカス+エラーメッセージの表示
                }
              }
          }
        } header: {
          Text("タグ")
        }
      }
      .navigationTitle("タグの登録")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          NavigationLink {
            
          } label: {
            VStack {
              Image(systemName: "plus")
              Text("JSONによる登録")
                .font(.footnote)
            }
          }
        }
      }
    }
  }
  
  private func updateTextFieldsIfNeeded(at index: Int, of state: [String]) {
    if index != state.startIndex - 1, tags[index].isEmpty {
      tags.remove(at: index)
    }
    else if index == tags.endIndex - 1, !tags[index].isEmpty {
      tags.append("")
    }
  }
  
  private func isDuplicated(_ input: String) -> Bool {
    // TODO: タグの重複チェック
    return false
  }
}

#Preview {
  TagAddView()
}
