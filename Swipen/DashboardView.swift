//
//  DashboardView.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/10.
//

import SwiftUI

struct DashboardView: View {
  let current: Int = 64
  let total: Int = 10000000
  
  var body: some View {
    ScrollView {
      CardView {
        ProgressView(value: Double(current), total: Double(total))
          .progressViewStyle(GaugeProgressStyle(current: current, total: total))
          .padding()
      }
    }
  }
}

#Preview {
  DashboardView()
}
