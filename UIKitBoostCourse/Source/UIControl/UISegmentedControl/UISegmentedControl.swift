//
//  UISegmentedControl.swift
//  UIKitBoostCourse
//
//  Created by Yujin Kim on 2023-09-18.
//

import UIKit

class UISegmentedControlViewController: BaseUIViewController {
    
    /// 문자열 객체만 포함해서 `UISegmentedControl` 생성
    private let withStringItems = UISegmentedControl(items: ["하나", "Two", "さん", "4️⃣"])
    /// 이미지 객체만 포함해서 `UISegmentedControl` 생성
    static let circle = UIImage(systemName: "circle") as Any
    static let square = UIImage(systemName: "square") as Any
    static let rectangle = UIImage(systemName: "rectangle") as Any
    static let triangle = UIImage(systemName: "triangle") as Any
    static let octagon = UIImage(systemName: "octagon") as Any
    static let hexagon = UIImage(systemName: "hexagon") as Any
    private let withImageItems = UISegmentedControl(items: [circle, square, rectangle,
                                                            triangle, octagon, hexagon])
    /// 문자열과 이미지 객체를 혼합해서 `UISegmentedControl` 생성하는 것도 가능
    private let withStringImageItems = UISegmentedControl(items: ["🐨", circle, "🐧", square, "🐬"])
    
    private let withFrame = UISegmentedControl(frame: .zero)
    /// 특정 `UIAction`을 포함해서 생성
    private let withFrameActions = UISegmentedControl(frame: .zero, actions: [])
    private let resultView = UIView(frame: .zero)
    private let resultLabel = UILabel(frame: .zero)
    
    override func setUI() {
        view.addSubview(withStringItems)
        view.addSubview(withImageItems)
        view.addSubview(withStringImageItems)
        
        setResultLabel(resultLabel)
        setResultView(resultView)
        view.addSubview(resultView)
    }
    
    override func setLayout() {
        disableTranslatesAutoresizingMaskIntoConstraints([withStringItems,
                                                          withImageItems,
                                                          withStringImageItems,
                                                          withFrame,
                                                          withFrameActions,
                                                          resultView,
                                                          resultLabel])
        
        NSLayoutConstraint.activate([
            withStringItems.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            withStringItems.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            withImageItems.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            withImageItems.topAnchor.constraint(equalTo: withStringItems.bottomAnchor, constant: 20),
            withImageItems.heightAnchor.constraint(equalToConstant: 40),
            withStringImageItems.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            withStringImageItems.topAnchor.constraint(equalTo: withImageItems.bottomAnchor, constant: 20),
            withStringImageItems.widthAnchor.constraint(equalToConstant: 150),
            withStringImageItems.heightAnchor.constraint(equalToConstant: 40),
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultView.topAnchor.constraint(equalTo: withStringImageItems.bottomAnchor, constant: 20),
            resultView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func addTarget() {
        withStringImageItems.addTarget(self, action: #selector(withStringImageItemsTapped(_:)), for: .valueChanged)
    }
    
}
// MARK: - 커스텀 메소드
extension UISegmentedControlViewController {
    
    private func managingSegmentedControl(_ control: UISegmentedControl) {
        /// 처음 선택되어 있는 세그먼트를 설정할 수 있어요.
        control.selectedSegmentIndex = 0
        /// `true`인 경우 사용자의 터치 이벤트가 종료되면 다시 선택이 해제
        /// `false`인 경우 사용자의 터치 이벤트가 종료되어도 선택이 유지
        control.isMomentary = false
        /// 특정 세그먼트를 비활성화할 수 있는 메서드
        control.setEnabled(false, forSegmentAt: 0)
        /// `forSegmentAt`에 위치한 세그먼트의 offset을 조정하는 메서드
        control.setContentOffset(CGSize(width: 0, height: 0), forSegmentAt: 0)
        /// 너비를 설정할 수 있는 메서드
        control.setWidth(0.0, forSegmentAt: 0)
        /// `true`이면 각 세그먼트의 값에 따라 너비를 자동으로 조절
        /// `false`이면 동일한 너비로 설정
        control.apportionsSegmentWidthsByContent = false
    }
    
    private func setResultView(_ view: UIView) {
        view.backgroundColor = .systemGray4
        view.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setResultLabel(_ label: UILabel) {
        label.text = "선택"
        label.font = UIFont.systemFont(ofSize: 28)
    }
    
    private func disableTranslatesAutoresizingMaskIntoConstraints(_ views: [UIView]) {
        views.forEach({ view in
            view.translatesAutoresizingMaskIntoConstraints = false
        })
    }
    
}
// MARK: - 커스텀 액션
extension UISegmentedControlViewController {
    
    @objc
    private func withStringImageItemsTapped(_ control: UISegmentedControl) {
        let selectedSegmentIndex = control.selectedSegmentIndex
        
        switch selectedSegmentIndex {
            case 0:
                resultLabel.text = "코알라다!"
            case 1:
                resultLabel.text = "동그라미다!"
            case 2:
                resultLabel.text = "펭귄이다!"
            case 3:
                resultLabel.text = "네모다!"
            case 4:
                resultLabel.text = "돌고래다!"
            default:
                break
        }
    }
    
}
