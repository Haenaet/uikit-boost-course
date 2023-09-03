//
//  BaseUIViewController.swift
//  UIKitBoostCourse
//
//  Created by Yujin Kim on 2023-09-03.
//

import UIKit

class BaseUIViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        addTarget()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    /// UI 컴포넌트 설정을 위한 사용자 정의 함수
    func setUI() {}
    
    /// 레이아웃 설정을 위한 사용자 정의 함수
    func setLayout() {}
    
    /// 대리자(delegate) 설정을 위한 사용자 정의 함수
    func setDelegate() {}
    
    /// 타겟-액션 패턴 설정을 위한 사용자 정의 함수
    func addTarget() {}
    
}
