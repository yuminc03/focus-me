//
//  Card.swift
//  MySelf
//
//  Created by Yumin Chu on 3/17/24.
//

import Foundation

struct Card: Equatable, Identifiable {
  let id = UUID()
  let title: String
  let subTitle: String
  
  static let dummy: [Card] = [
    .init(
      title: "Introvert",
      subTitle: "혼자 있고 싶은 나"
    ),
    .init(
      title: "Intuition",
      subTitle: "이상적이고 예측하는 능력이 있는 나"
    ),
    .init(
      title: "Feeling",
      subTitle: "상대방의 기분을 잘 알아차리고 위로를 잘 할 수 있는 나"
    ),
    .init(
      title: "Judging",
      subTitle: "일을 시작하기 전 미리 계획하고 순서를 정하는 나"
    )
  ]
}
