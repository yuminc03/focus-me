import SwiftUI

extension String {
  /// attributedText 사용을 위한 함수
  func attributedString(
    color: Color = .accentColor,
    fontName: NotoSans = .notoSansKRRegular,
    fontSize: CGFloat = 16
  ) -> AttributedString {
    var attributed = AttributedString(stringLiteral: self)
    if let range = attributed.range(of: self) {
      attributed[range].font = .custom(fontName.resource, size: fontSize)
      attributed[range].foregroundColor = color
    }
    
    return attributed
  }
}
