//
//  UIStepper.swift
//  UIKitBoostCourse
//
//  Created by Yujin Kim on 2023-09-24.
//

import UIKit

class UIStepperViewController: BaseUIViewController {
    
    private let resultView = UIView()
    private let resultLabel = UILabel(frame: .zero)
    private let warningLabel = UILabel(frame: .zero)
    
    /// `UIStepper(frame: CGRect)`형태로 초기화 및 생성
    private let stepper = UIStepper(frame: .zero)
    
    override func setUI() {
        managingSetpper(stepper)
        
        managingResultLabel(resultLabel, stepper)
        
        managingResultView(resultView)
        
        view.addSubview(stepper)
        view.addSubview(resultView)
    }
    
    override func setLayout() {
        disableTranslatesAutoresizingMaskIntoConstraints([stepper, resultView, resultLabel, warningLabel])
        
        NSLayoutConstraint.activate([
            stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            resultView.centerXAnchor.constraint(equalTo: stepper.centerXAnchor),
            resultView.topAnchor.constraint(equalTo: stepper.bottomAnchor),
            resultView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func addTarget() {
        stepper.addTarget(self, action: #selector(stepperDidTapped(_:)), for: .valueChanged)
    }
    
}
// MARK: - 커스텀 메서드
extension UIStepperViewController {
    
    private func managingSetpper(_ control: UIStepper) {
        /// 기본 값
        control.value = 1.0
        /// 최소값
        control.minimumValue = 0.0
        /// 최대값
        control.maximumValue = 20.0
        /// 값을 증가하거나 감소시킬 때 반영되는 증분 값
        control.stepValue = 1.0
        /// `false`이면 사용자 상호작용 이후에 값 변경 이벤트를 처리
        /// `true`이면 사용자 상호작용 중에 값 변경 이벤트를 처리
        control.isContinuous = true
        /// `true`이면 사용자의 터치 이벤트 동안 값을 연속적으로 변경
        control.autorepeat = true
        /// 값을 증가하거나 감소시킬 때 최소값이나 최대값으로 값을 감쌀 수 있는지 여부를 결정
        control.wraps = false
    }
    
    private func managingResultView(_ view: UIView) {
        view.backgroundColor = .systemGray4
        
        view.addSubview(resultLabel)
        view.addSubview(warningLabel)
        
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            warningLabel.centerXAnchor.constraint(equalTo: resultLabel.centerXAnchor),
            warningLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20)
        ])
    }
    
    private func managingResultLabel(_ label: UILabel, _ control: UIStepper) {
        label.text = String(control.value)
        label.font = UIFont.systemFont(ofSize: 32)
        label.textAlignment = .center
        label.textColor = UIColor.black
    }
    
    private func managingWarningLabel(_ label: UILabel, _ control: UIStepper) {
        label.isHidden = true
        let value = control.value
        
        if value == control.maximumValue {
            label.isHidden = false
            label.text = "최대값입니다!"
            label.textColor = .red
            label.font = UIFont.boldSystemFont(ofSize: 28)
        }
        
        if value == control.minimumValue {
            label.isHidden = false
            label.text = "최소값입니다!"
            label.textColor = .systemBlue
            label.font = UIFont.boldSystemFont(ofSize: 28)
        }
    }
    
    private func disableTranslatesAutoresizingMaskIntoConstraints(_ views: [UIView]) {
        views.forEach({ view in
            view.translatesAutoresizingMaskIntoConstraints = false
        })
    }
    
}
// MARK: - 커스텀 액션 메서드
extension UIStepperViewController {
    
    @objc
    private func stepperDidTapped(_ control: UIStepper) {
        let value = control.value
        resultLabel.text = String(value)
        
        managingWarningLabel(warningLabel, stepper)
    }
    
}
