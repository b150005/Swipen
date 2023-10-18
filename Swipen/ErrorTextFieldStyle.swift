//
//  ErrorTextFieldStyle.swift
//  Swipen
//
//  Created by 伊藤直輝 on 2023/10/15.
//

import SwiftUI

struct ErrorTextFieldStyle: TextFieldStyle {
  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .padding()
      .background(.orange.opacity(0.2), in: RoundedRectangle(cornerRadius: 5.0))
  }
}

extension TextFieldStyle where Self == ErrorTextFieldStyle {
  static var error: ErrorTextFieldStyle {
    return .init()
  }
}

#Preview {
  @State var inputText = ""
  
  return TextField("aa", text: $inputText)
    .textFieldStyle(.error)
    .padding()
}
