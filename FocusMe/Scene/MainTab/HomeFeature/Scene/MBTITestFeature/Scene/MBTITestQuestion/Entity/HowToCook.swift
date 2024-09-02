import Foundation

/// 요리를 하는 방법
enum HowToCook: Answer {
  case checkRecipe
  case intuition
  
  var title: String {
    switch self {
    case .checkRecipe:
      return "레시피를 확인한다."
    case .intuition:
      return "내 직감을 믿는다."
    }
  }
}
