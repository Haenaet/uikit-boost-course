//
//  UIColorWell.swift
//  UIKitBoostCourse
//
//  Created by Yujin Kim on 2023-09-08.
//

import UIKit

class UIColorWellViewController: BaseUIViewController {
    
    /// UIColorWell Component
    ///
    /// Properties
    /// - `title`: 사용 목적에 따라 설명하는 제목 속성
    /// - `supportsAlpha`: 색상 알파 값을 허용할 것인지 설정할 수 있는 Boolean 속성
    /// - `selectedColor`: UIColor 값을 지정하면 해당 색상으로 미리보기 색상을 초기화하는 속성
    private lazy var colorWell: UIColorWell = {
        
        let control = UIColorWell()
        
        // 사용 목적에 따라 설정하는 것을 권장하는 것으로 설명되어 있다.
        control.title = "배경 색상"
        
        // 값을 지정하지 않으면 기본 값은 false
        // false이면 Opaque, true이면 Opacity 활성화
        control.supportsAlpha = true
        
        // `UIControlEventValueChanged` 이벤트로 지정되는 색상, UIControl.Event { get }
        // 설정을 하지 않으면 기본값이 적용된다.
        control.selectedColor = UIColor.black
        
        return control
        
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func setUI() {
        
        view.addSubview(colorWell)
        
    }
    
    override func setLayout() {
        
        colorWell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            colorWell.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            colorWell.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            colorWell.topAnchor.constraint(equalTo: view.topAnchor),
            
            colorWell.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
    }
    
    override func addTarget() {
        
        colorWell.addTarget(self, action: #selector(colorWellTapped(_:)), for: .valueChanged)
        
    }
    
}

// MARK: - 커스텀 액션
extension UIColorWellViewController {
    
    @objc
    private func colorWellTapped(_ control: UIColorWell) {
        
        NSLayoutConstraint.deactivate(colorWell.constraints)
        
        view.backgroundColor = control.selectedColor
        
    }
    
}

// MARK: - 미리보기
#if DEBUG && canImport(SwiftUI)
import SwiftUI
private struct UIViewControllerRepresenter: UIViewControllerRepresentable {
    
    let viewController: UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        return viewController
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    
}

struct UIViewControllerPreviewView: PreviewProvider {
    
    static var previews: some View {
        
        let viewController = UIColorWellViewController()
        
        return UIViewControllerRepresenter(viewController: viewController)
        
    }
    
}
#endif
