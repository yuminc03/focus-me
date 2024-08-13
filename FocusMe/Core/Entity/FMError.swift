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
    /// 이메일 및 비밀번호 계정이 활성화되지 않았음
    case operationNotAllowed
    /// 사용자 계정이 비활성화되었음
    case userDisabled
    /// 잘못된 비밀번호로 로그인을 시도했음
    case wrongPassword
    /// 이메일 주소가 잘못되었음
    case invalidEmail
    case unknown(String? = nil)
    
    var message: String {
      switch self {
      case .notFoundCurrentUser:
        return "현재 로그인한 사용자를 찾을 수 없습니다"
      case .operationNotAllowed:
        return "이메일 및 비밀번호 계정이 활성화되지 않았습니다"
      case .userDisabled:
        return "사용자 계정이 비활성화되었습니다"
      case .wrongPassword:
        return "잘못된 비밀번호입니다"
      case .invalidEmail:
        return "잘못된 이메일 주소입니다"
      case let .unknown(message):
        return message ?? "알 수 없는 로그인 오류"
      }
    }
  }
  
  enum SignUpError {
    /// 이메일 주소가 잘못되었음
    case invalidEmail
    /// 회원가입을 하려는 이메일이 이미 존재함
    case emailAlreadyInUse
    /// 이메일 및 비밀번호 계정이 활성화되지 않았음
    case operationNotAllowed
    /// 너무 약한 비밀번호를 설정하려는 시도
    case weakPassword
    case unknown(String? = nil)
    
    var message: String {
      switch self {
      case .invalidEmail:
        return "이메일 주소가 잘못되었습니다"
      case .emailAlreadyInUse:
        return "회원가입을 하려는 이메일이 이미 존재합니다"
      case .operationNotAllowed:
        return "이메일 및 비밀번호 계정이 활성화되지 않았습니다"
      case .weakPassword:
        return "너무 약한 비밀번호입니다"
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
