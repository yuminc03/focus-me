//
//  RepresentedPageControl.swift
//  MySelf
//
//  Created by Yumin Chu on 3/16/24.
//

import SwiftUI
import UIKit
import Combine

import CombineCocoa

struct RepresentedPageControl: UIViewRepresentable {
  private let pageControl: UIPageControl = {
    let v = UIPageControl()
    return v
  }()
  
  private let numberOfPage: Int
  @Binding private var currentPage: Int
  
  init(numberOfPage: Int, currentPage: Binding<Int>) {
    self.numberOfPage = numberOfPage
    self._currentPage = currentPage
  }
  
  func makeUIView(context: Context) -> UIPageControl {
    pageControl.numberOfPages = numberOfPage
    return pageControl
  }
  
  func updateUIView(_ uiView: UIPageControl, context: Context) {
    
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  final class Coordinator: NSObject {
    private var parent: RepresentedPageControl
    private var cancelBag = Set<AnyCancellable>()
    
    init(_ parent: RepresentedPageControl) {
      self.parent = parent
      super.init()
      bind()
    }
    
    private func bind() {
      parent.pageControl.currentPagePublisher
        .sink { [weak self] in
          self?.parent.pageControl.currentPage = $0
        }
        .store(in: &cancelBag)
    }
  }
}

