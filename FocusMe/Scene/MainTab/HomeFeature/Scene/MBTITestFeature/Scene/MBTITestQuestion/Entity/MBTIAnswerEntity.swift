import Foundation

/// 답변
protocol Answer: CaseIterable {
  var title: String { get }
}

struct MBTIAnswerEntity: Equatable, Identifiable {
  let id = UUID()
  let type: any Answer
  var isSelected = false
}

extension MBTIAnswerEntity {
  static func == (lhs: MBTIAnswerEntity, rhs: MBTIAnswerEntity) -> Bool {
    return lhs.id == rhs.id &&
    lhs.type.title == rhs.type.title &&
    lhs.isSelected == rhs.isSelected
  }
}
