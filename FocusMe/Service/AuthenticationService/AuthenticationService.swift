import FirebaseAuth
import ComposableArchitecture

/// Firebase Authentication Service
final class AuthenticationService {
  static let shared = AuthenticationService()
  
  private init() { }
  
  /// 회원가입
  func signup(entity: SignUpEntity) async throws -> String? {
    do {
      let result = try await Auth.auth().createUser(withEmail: entity.email, password: entity.password)
      result.user.displayName = entity.name
      return result.user.uid
    } catch {
      let authError = error as NSError
      guard let errorCode = AuthErrorCode(rawValue: authError.code) else {
        print("signup() Error: \(error.localizedDescription)")
        throw error.toFMError
      }
      
      print("signup() Error: \(errorCode): \(error.localizedDescription)")
      switch errorCode {
      case .invalidEmail:
        throw FMError.signup(.invalidEmail)
      case .emailAlreadyInUse:
        throw FMError.signup(.emailAlreadyInUse)
      case .operationNotAllowed:
        throw FMError.signup(.operationNotAllowed)
      case .weakPassword:
        throw FMError.signup(.weakPassword)
      default:
        throw error.toFMError
      }
    }
  }
  
  /// 로그인
  func login(entity: LoginEntity) async throws {
    do {
      let result = try await Auth.auth().signIn(withEmail: entity.email, password: entity.password)
      print("로그인 성공: \(result)")
      UserInfo.shared.uid = result.user.uid
    } catch {
      let authError = error as NSError
      guard let errorCode = AuthErrorCode(rawValue: authError.code) else {
        print("login() Error: \(error.localizedDescription)")
        throw error.toFMError
      }
      
      print("login() Error: \(errorCode): \(error.localizedDescription)")
      switch errorCode {
      case .operationNotAllowed:
        throw FMError.login(.operationNotAllowed)
      case .userDisabled:
        throw FMError.login(.userDisabled)
      case .wrongPassword:
        throw FMError.login(.wrongPassword)
      case .invalidEmail:
        throw FMError.login(.invalidEmail)
      default:
        throw error.toFMError
      }
    }
  }
  
  /// 로그아웃
  func logout() throws {
    do {
      try Auth.auth().signOut()
      print("로그아웃 됨")
    } catch {
      let authError = error as NSError
      guard let errorCode = AuthErrorCode(rawValue: authError.code) else {
        print("logout() Error: \(error.localizedDescription)")
        throw error.toFMError
      }
      
      print("logout() Error: \(errorCode): \(error.localizedDescription)")
      switch errorCode {
      case .operationNotAllowed:
        throw FMError.login(.operationNotAllowed)
      case .userDisabled:
        throw FMError.login(.userDisabled)
      case .wrongPassword:
        throw FMError.login(.wrongPassword)
      case .invalidEmail:
        throw FMError.login(.invalidEmail)
      default:
        throw error.toFMError
      }
    }
  }
  
  /// 현재 로그인한 사용자 가져오기
  func getCurrentUser() async throws {
    return try await withCheckedThrowingContinuation { continuation in
      _ = Auth.auth().addStateDidChangeListener { auth, user in
        if let user {
          print("현재 로그인한 사용자 발견!")
          UserInfo.shared.uid = user.uid
          UserInfo.shared.email = user.email
          UserInfo.shared.name = user.displayName
          continuation.resume(with: .success(()))
        } else {
          print("로그아웃 됨!")
          UserInfo.shared.clear()
          continuation.resume(with: .failure(FMError.login(.notFoundCurrentUser)))
        }
      }
    }
  }
}

struct AuthenticationServiceKey: DependencyKey {
  static let liveValue = AuthenticationService.shared
  static let previewValue = AuthenticationService.shared
}

extension DependencyValues {
  var authenticationService: AuthenticationService {
    get { self[AuthenticationServiceKey.self] }
    set { self[AuthenticationServiceKey.self] = newValue }
  }
}
