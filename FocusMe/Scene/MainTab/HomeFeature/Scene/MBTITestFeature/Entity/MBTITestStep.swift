import Foundation

import ComposableArchitecture

/// 현재 진행중인 MBTI 테스트 단계
final class MBTITestStep {
  var currentStep: MBTIQuestion = .momentOfEnergy
  
  static let shared = MBTITestStep()
  
  private init() { }
  
  func reset() {
    currentStep = .momentOfEnergy
  }
  
  func nextStep() -> MBTIQuestion? {
    guard let index = MBTIQuestion.allCases.firstIndex(of: currentStep) else {
      print("현재 단계를 찾을 수 없음.")
      return nil
    }
    
    currentStep = MBTIQuestion.allCases[index] == .myWayPartying ? .myWayPartying : MBTIQuestion.allCases[index + 1]
    return currentStep
  }
  
  func backStep() {
    guard let index = MBTIQuestion.allCases.firstIndex(of: currentStep) else {
      print("현재 단계를 찾을 수 없음.")
      return
    }
    
    currentStep = MBTIQuestion.allCases[index] == .momentOfEnergy ? .momentOfEnergy : MBTIQuestion.allCases[index - 1]
  }
}

struct MBTITestStepKey: DependencyKey {
  static let liveValue = MBTITestStep.shared
  static let previewValue = MBTITestStep.shared
}

extension DependencyValues {
  var mbtiTestStep: MBTITestStep {
    get { self[MBTITestStepKey.self] }
    set { self[MBTITestStepKey.self] = newValue }
  }
}
