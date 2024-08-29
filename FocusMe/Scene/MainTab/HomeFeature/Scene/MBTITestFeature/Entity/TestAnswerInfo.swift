import Foundation

import ComposableArchitecture

enum MomentOfEnergy {
  case together
  case alone
}

/// MBTI 테스트 점수
final class TestAnswerInfo {
  /// 에너지를 얻는 순간
  var momentOfEnergy: MomentOfEnergy?
  
  static let shared = TestAnswerInfo()
  
  private init() { }
}

struct TestAnswerInfoKey: DependencyKey {
  static let liveValue = TestAnswerInfo.shared
  static let previewValue = TestAnswerInfo.shared
}

extension DependencyValues {
  var testAnswerInfo: TestAnswerInfo {
    get { self[TestAnswerInfoKey.self] }
    set { self[TestAnswerInfoKey.self] = newValue }
  }
}
