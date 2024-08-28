import Foundation

import ComposableArchitecture

/// MBTI 테스트 점수
final class TestAnswerEntity {
  /// 외향 점수
  var extraversion = 0
  /// 내향 점수
  var introversion = 0
  /// 감각 점수
  var sensing = 0
  /// 직관 점수
  var intuition = 0
  /// 사고 점수
  var thinking = 0
  /// 감정 점수
  var feeling = 0
  /// 판단 점수
  var judging = 0
  /// 인식 점수
  var perceiving = 0
  
  static let shared = TestAnswerEntity()
  
  private init() { }
}

struct TestAnswerEntityKey: DependencyKey {
  static let liveValue = TestAnswerEntity.shared
  static let previewValue = TestAnswerEntity.shared
}

extension DependencyValues {
  var testAnswerEntity: TestAnswerEntity {
    get { self[TestAnswerEntityKey.self] }
    set { self[TestAnswerEntityKey.self] = newValue }
  }
}
