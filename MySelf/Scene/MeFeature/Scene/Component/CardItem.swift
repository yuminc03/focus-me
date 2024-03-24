//
//  CardItem.swift
//  MySelf
//
//  Created by Yumin Chu on 3/24/24.
//

import SwiftUI

struct CardItem: View {
  private let cardInfo: Card
  
  init(cardInfo: Card) {
    self.cardInfo = cardInfo
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 25) {
      titleText
      contentView
    }
    .padding(.horizontal, 20)
  }
}

#Preview {
  CardItem(cardInfo: .init(
    title: "It's Title",
    subTitle: "Save me"
  ))
}

extension CardItem {
  private var titleText: some View {
    Text(cardInfo.title.capitalized)
      .font(.system(size: 48, weight: .semibold, design: .rounded))
  }
  
  private var contentView: some View {
    VStack(alignment: .leading, spacing: 25) {
      Text(cardInfo.subTitle)
        .fontWeight(.semibold)
        .lineLimit(3)
        .padding(20)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(20)
    .background(Color.blue56A7FF)
    .cornerRadius(25)
  }
}
