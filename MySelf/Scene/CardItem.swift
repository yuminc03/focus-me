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
  }
}

struct CardItem_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()
      CardItem(cardInfo: .init(
        title: "It's Title",
        subTitle: "Save me"
      ))
    }
    .previewLayout(.sizeThatFits)
  }
}

extension CardItem {
  private var titleText: some View {
    Text(cardInfo.title.capitalized)
      .foregroundColor(.white)
      .font(.custom(R.font.notoSansKRSemiBold, size: 48))
  }
  
  private var contentView: some View {
    VStack(alignment: .leading, spacing: 25) {
      Text(cardInfo.subTitle)
        .font(.custom(R.font.notoSansKRMedium, size: 20))
        .lineLimit(3)
        .padding(20)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .frame(height: 300)
    .padding(20)
    .background(Color.blue56A7FF)
    .cornerRadius(25)
  }
}
