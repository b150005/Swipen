//
//  TagAddView.swift
//  Swipen
//
//  Created by 伊藤直輝 on 2023/10/12.
//

import SwiftUI
import SwiftData

struct TagAddView: View {
  @State private var inputTags: [String] = [""]
  @State private var haveTextFieldsError: [Bool] = [false]
  @FocusState private var textFieldFocus: Int?
  
  @Query private var tags: [Tag]
  
  var body: some View {
    NavigationStack {
      Form {
        Section {
          ForEach($inputTags.indices, id: \.self) { (index: Int) in
            TextField("タグ\(index + 1)", text: $inputTags[index])
//              .textFieldStyle(haveTextFieldsError[index] ? .error : .plain)
              .autocorrectionDisabled()
              .focused($textFieldFocus, equals: index)
              .onTapGesture {
                textFieldFocus = index
              }
              .onChange(of: textFieldFocus) {
                validateTagName(at: index)
              }
              .onChange(of: inputTags[index]) {
                addOrRemoveTextFieldIfNeeded(at: index)
              }
          }
        } header: {
          Text("タグ")
        }
      }
      // TODO: ソフトウェアキーボードが一旦閉じてしまう問題
      .onTapGesture {
        textFieldFocus = nil
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
      .scrollDismissesKeyboard(.immediately)
    }
  }
  
  private func addOrRemoveTextFieldIfNeeded(at index: Int) {
    if index == inputTags.endIndex - 1, !inputTags[index].isEmpty {
      inputTags.append("")
      haveTextFieldsError.append(false)
    }
    else if index != inputTags.startIndex - 1, inputTags[index].isEmpty {
      inputTags.remove(at: index)
      haveTextFieldsError.remove(at: index)
    }
  }
  
  private func isDuplicated(_ index: Int, in inputs: [String]) -> Bool {
    var otherInputTags: [String] = inputTags
    otherInputTags.remove(at: index)
    return tags.map { $0.name }.contains(inputs[index]) || otherInputTags.contains(inputs[index])
  }
  
  private func validateTagName(at index: Int) {
    if let _ = textFieldFocus, !inputTags[index].isEmpty, isDuplicated(index, in: inputTags) {
      haveTextFieldsError[index].toggle()
    }
    else if haveTextFieldsError[index], !isDuplicated(index, in: inputTags) {
      haveTextFieldsError[index].toggle()
    }
  }
}

#Preview {
  TagAddView()
//    .modelContainer(for: Tag.self)
}
