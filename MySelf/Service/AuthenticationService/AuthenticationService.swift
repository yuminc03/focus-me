import FirebaseAuth

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
      print("Firebase Authentication 오류: \(error.localizedDescription)")
      return nil
    }
  }
}
