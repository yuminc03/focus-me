import Foundation

/// MBTI 테스트 결과를 저장할 때 사용함
struct MBTITestResult: Encodable {
  /// 사용자의 ID
  let id: String
  /// 사용자의 MBTI 결과 (ex: INTJ)
  let mbti: String
  /// 에너지의 방향
  let energyScore: Int
  /// 인식기능
  let informationScore: Int
  /// 판단기능
  let decisionScore: Int
  /// 생활양식
  let lifeStyleScore: Int
}
