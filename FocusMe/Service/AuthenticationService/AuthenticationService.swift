import FirebaseAuth

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
      print("Firebase Authentication signup() 오류: \(error.localizedDescription)")
      throw error.toFMError
    }
  }
  
  /// 로그인
  func login(entity: LoginEntity) async throws {
    do {
      let result = try await Auth.auth().signIn(withEmail: entity.email, password: entity.password)
      print("로그인 성공 reuslt: \(result)")
    } catch {
      print("Firebase Authentication login() 오류: \(error.localizedDescription)")
      throw error.toFMError
    }
  }
  
  /// 현재 로그인한 사용자 가져오기
  func getCurrentUser() async throws {
    return try await withCheckedThrowingContinuation { continuation in
      _ = Auth.auth().addStateDidChangeListener { auth, user in
        if let user {
          print("현재 로그인한 사용자 발견!")
          UserInfo.shared.email = user.email
          UserInfo.shared.name = user.displayName
          continuation.resume(with: .success(()))
        } else {
          print("로그아웃 됨!")
          UserInfo.shared.logout()
          continuation.resume(with: .failure(FMError.login(.notFoundCurrentUser)))
        }
      }
    }
  }
}
