import Foundation

/// MBTI 테스트 점수
struct MBTITestScore: Equatable {
  /// 외향
  let extraversion: Int
  /// 내향
  let introversion: Int
  /// 감각
  let sensing: Int
  /// 직관
  let intuition: Int
  /// 사고
  let thinking: Int
  /// 감정
  let feeling: Int
  /// 판단
  let judging: Int
  /// 인식
  let perceiving: Int
}
