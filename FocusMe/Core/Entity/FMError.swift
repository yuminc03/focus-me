import Foundation

/// 앱에서 발생할 수 있는 오류
enum FMError: LocalizedError {
  case login(LoginError)
  case signup(SignUpError)
  case unknown(String)
  
  var errorDescription: String? {
    switch self {
    case let .login(error):
      return error.message
    case let .signup(error):
      return error.message
    case let .unknown(message):
      return message
    }
  }
  
  enum LoginError {
    /// 자동 로그인 시 현재 로그인한 사용자가 없음
    case notFoundCurrentUser
    case unknown(String? = nil)
    
    var message: String {
      switch self {
      case .notFoundCurrentUser:
        return "현재 로그인한 사용자를 찾을 수 없음"
      case let .unknown(message):
        return message ?? "알 수 없는 로그인 오류"
      }
    }
  }
  
  enum SignUpError {
    case unknown(String? = nil)
    
    var message: String {
      switch self {
      case let .unknown(message):
        return message ?? "알 수 없는 회원가입 오류"
      }
    }
  }
}

extension Error {
  var toFMError: FMError {
    return self as? FMError ?? .unknown(localizedDescription)
  }
}
