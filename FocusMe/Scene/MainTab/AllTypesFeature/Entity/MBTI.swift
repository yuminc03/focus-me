import Foundation

/// MBTI 유형
enum MBTI: String, CaseIterable {
  case istj
  case isfj
  case infj
  case intj
  case istp
  case isfp
  case infp
  case intp
  case estp
  case esfp
  case enfp
  case entp
  case estj
  case esfj
  case enfj
  case entj
  
  var title: String {
    return rawValue.uppercased()
  }
  
  var description: String {
    switch self {
    case .istj:
      return "세상의 소금형"
    case .isfj:
      return "임금뒤편의 권력형"
    case .infj:
      return "예언자형"
    case .intj:
      return "과학자형"
    case .istp:
      return "백과사전형"
    case .isfp:
      return "성인군자형"
    case .infp:
      return "잔다르크형"
    case .intp:
      return "아이디어 뱅크형"
    case .estp:
      return "수완 좋은 활동가형"
    case .esfp:
      return "사교적인 유형"
    case .enfp:
      return "스파크형"
    case .entp:
      return "발명가형"
    case .estj:
      return "사업가형"
    case .esfj:
      return "친선도모형"
    case .enfj:
      return "언변능숙형"
    case .entj:
      return "지도자형"
    }
  }
  
  var image: ImageResource {
    return .charAquarius
  }
}
