import Foundation

/// SF Symbols 이미지를 편하게 사용하기 위함
enum SystemImage: String {
  case xmark
  case arrowRight = "arrow.right"
}

extension String {
  static func systemImage(_ name: SystemImage) -> String {
    return name.rawValue
  }
}