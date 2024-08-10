//
//  CustomPageTabView.swift
//  Payco
//
//  Created by Yumin Chu on 2023/08/28.
//

import SwiftUI

struct CustomPageIndicator: View {
  
  private var selectedIndex: Int
  private let maxCount: Int
  
  init(selectedIndex: Int, maxCount: Int) {
    self.selectedIndex = selectedIndex
    self.maxCount = maxCount
  }
  
  var body: some View {
    HStack(spacing: 5) {
      ForEach(0 ..< maxCount, id: \.self) { index in
        CustomPageTabItem(isSelected: index == selectedIndex)
      }
    }
  }
}

struct CustomPageTabItem: View {
  
  private let isSelected: Bool
  
  init(isSelected: Bool) {
    self.isSelected = isSelected
  }
  
  var body: some View {
    RoundedRectangle(cornerRadius: 2.5)
      .fill(isSelected ? .white : .gray)
      .frame(width: isSelected ? 25 : 5, height: 5)
      .animation(.spring(), value: isSelected)
  }
}

struct CustomPageTabView_Previews: PreviewProvider {
  static var previews: some View {
    CustomPageIndicator(selectedIndex: 1, maxCount: 4)
      .previewLayout(.sizeThatFits)
  }
}
