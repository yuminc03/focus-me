import SwiftUI

enum FMAlertButtonType {
  case confirm
  case cancel
}

struct FMAlertButton {
  let title: String
  let foregroundColor: Color
  let backgroundColor: Color
  let pressedBgColor: Color
  let disabledBgColor: Color
}

extension FMAlertButton {
  static func primary(title: String) -> FMAlertButton {
    return .init(
      title: title,
      foregroundColor: .white,
      backgroundColor: .blueLemonAde,
      pressedBgColor: .skyblue,
      disabledBgColor: .lightBlue
    )
  }
  
  static func cancel(title: String) -> FMAlertButton {
    return .init(
      title: title,
      foregroundColor: .white,
      backgroundColor: .textPrimary4,
      pressedBgColor: .darkGray,
      disabledBgColor: .lightGray
    )
  }
}
