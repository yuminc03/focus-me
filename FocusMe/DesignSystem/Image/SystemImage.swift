import Foundation

/// SF Symbols 이미지를 편하게 사용하기 위함
enum SystemImage: String {
  case xmark
  case arrowRight = "arrow.right"
  case house
  case person
  case chevronBackward = "chevron.backward"
  case chevronRight = "chevron.right"
  case textBookClosed = "text.book.closed"
  case exclamationmarkCircleFill = "exclamationmark.circle.fill"
  case checkmarkCircle = "checkmark.circle"
  case personCropCircle = "person.crop.circle"
}

extension String {
  static func systemImage(_ name: SystemImage) -> String {
    return name.rawValue
  }
}
