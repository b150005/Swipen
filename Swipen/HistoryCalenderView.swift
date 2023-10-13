//
//  HistoryCalenderView.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/19.
//

import Foundation
import SwiftUI

struct HistoryCalenderView: View {
  @State private var currentDate: Date
  
  init(_ date: Date = .now) {
    self._currentDate = State(initialValue: date)
  }
  
  var body: some View {
    InfiniteTabPageView(height: 85) { (page: UInt8) in
      VStack {
        HStack {
          Spacer()
          ForEach(0 ..< 7, id: \.self) { (dayIndex: Int) in
            VStack {
              Button {
                // TODO: Some Actions
              } label: {
                Text(weekdaySymbol(from: date(page, dayIndex: dayIndex)))
                  .fixedSize()
                  .bold()
                  .padding()
                  .background() {
                    Circle()
                      .stroke()
                      // TODO: 進捗によって色を変化
                      .foregroundStyle(.gray)
                      .frame(width: 45, height: 45)
                  }
                  .padding(.top)
              }
              
              Text(dateSymbol(from: date(page, dayIndex: dayIndex)))
                .foregroundStyle(Color("ForegroundColor"))
            }
            Spacer()
          }
        }
        Divider()
      }
      .background(Color("BackgroundMonoColor"))
    }
  }
}

extension HistoryCalenderView {
  /// 今日を0週目0日目として、`weekCountFromToday`週と`dayIndex`日前のDateオブジェクトを取得する
  /// - Parameters:
  ///   - weekCountFromToday: 今日を0週目として過去に対して何週目か
  ///   - dayIndex: 今日の曜日を0として過去7日間で何日前の曜日か(`dayIndex`は原則`0 ..< 7`の範囲内のInt値)
  /// - Returns: 今日を0週目0日目とした`weekCountFromToday`週と`dayIndex`日前のDateオブジェクト
  private func date(_ weekCountFromToday: UInt8, dayIndex: Int) -> Date {
    return Calendar.current.date(byAdding: .day,
      value: -(7 * Int(weekCountFromToday) + (6 - dayIndex)), to: currentDate)!
  }
  
  /// 指定日付の曜日の文字列を取得する
  /// - Parameter date: 日付を表すDate型オブジェクト
  /// - Returns: `date`の曜日
  private func weekdaySymbol(from date: Date) -> String {
    let calendar: Calendar = Calendar.current
    let weekday: Int = calendar.component(.weekday, from: date)
    return String(calendar.weekdaySymbols[weekday - 1].first!)
  }
  
  /// 指定日付を`M/dd`形式に変換した文字列を取得する
  /// - Parameter date: 日付を表すDate型オブジェクト
  /// - Returns: `M/dd`形式に変換された文字列(1~9月は1桁で表現される)
  private func dateSymbol(from date: Date) -> String {
    let dateFormatter: DateFormatter = .init()
    dateFormatter.dateFormat = "M/d"
    return dateFormatter.string(from: date)
  }
}

#Preview {
  HistoryCalenderView()
    .environment(ScreenSizeStore())
}
