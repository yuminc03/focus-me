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
  
  /// 로그인
  func login(entity: LoginEntity) async throws {
    do {
      let result = try await Auth.auth().signIn(withEmail: entity.email, password: entity.password)
    } catch {
      print("Firebase Authentication 오류: \(error.localizedDescription)")
    }
  }
}
