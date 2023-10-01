//
//  UITextField.swift
//  UIKitBoostCourse
//
//  Created by Yujin Kim on 2023-10-01.
//

import UIKit

class UITextFieldViewController: BaseUIViewController {
    
    private let textField = UITextField()
    
    override func setUI() {
        super.setUI()
        
        view.addSubviews([textField])
        
        managingTextField(textField)
    }
    
    override func setLayout() {
        super.setLayout()
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

extension UITextFieldViewController {
    
    private func managingTextField(_ control: UITextField) {
        /// 할당한 문자열이 텍스트 필드에 나타나요.
        /// 새로운 값을 할당하면 특정 스타일이 지정되지 않은 `UITextField.attributedText` 값도 자동으로 대체해요.
        /// 기본 값은 `nil`이에요.
        control.text = nil
        /// 텍스트 필드에 표시할 텍스트가 없을 때 나타나는 문자열이에요.
        /// 시스템에 설정되어 있는 색상을 통해 문자열을 표시해요.
        /// 기본 값은 `nil`이에요.
        control.placeholder = nil
        /// 새로운 값을 할당하면 특정 스타일이 지정되지 않은 `UITextField.attributedText`, `UITextField.attributedPlaceholder` 속성의 문자열에도 적용되요.
        control.font = UIFont.systemFont(ofSize: 16)
        /// 기본 값은 검정색이에요. 그리고 해당 속성은 `nil`일 수 없어요.
        /// 이미 서식이 지정된 텍스트를 사용하는 경우에도 이 속성에 새로운 값을 할당하면 전체 문자열에 적용해요.
        /// `NSAttributedString` 객체도 전부 대체해요.
        control.textColor = UIColor.green
        /// NSAttributedString 객체를 사용해서 추출한 특정 텍스트를 지정된 서식으로 적용할 수 있도록 해줘요.
        /// 일반적으로는 자주 활용하지 않지만 복잡하고 다양한 서식을 문자열에 적용해야할 때 필요해요.
        control.defaultTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.clear]
        control.typingAttributes = [NSAttributedString.Key.backgroundColor : UIColor.clear]
        /// `attributedText` 속성은 nil일 수 없어요.
        control.attributedText = NSAttributedString(string: "")
        /// `attributedPlaceholder` 속성은 nil일 수 없어요.
        control.attributedPlaceholder = NSAttributedString(string: "")
        /// 기본 값은 `left`에요.
        control.textAlignment = NSTextAlignment.center
        /// 텍스트 필드 주위 테두리 형태를 설정할 수 있는 속성이에요.
        /// `UITextField.BorderStyle.none`: 텍스트 필드 주위에 아무 테두리도 표시되지 않아요.
        /// `UITextField.BorderStyle.line`: 텍스트 필드 주위에 선 형태의 테두리를 표시해요.
        /// `UITextField.BorderStyle.bezel`: 텍스트 필드 주위에 베젤 스타일의 형태로 테두리를 표시해요.
        /// `UITextField.BorderStyle.roundedRect`: 텍스트 필드 주위에 둥근 직사각형 형태의 테두리를 표시해요.
        control.borderStyle = .none
        /// 텍스트필드의 크기보다 텍스트의 크기가 길거나 클 때 이를 자동으로 맞춰줄지 설정할 수 있어요.
        /// `true`라면 해당 속성이 활성화되고, `false`라면 해당 속성이 비활성화되는 구조에요.
        control.adjustsFontSizeToFitWidth = true
    }
    
}

#if DEBUG && canImport(SwiftUI)
import SwiftUI
private struct UIViewControllerRepresenter: UIViewControllerRepresentable {
    let viewController: UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct UITextFieldViewControllerPreviewView: PreviewProvider {
    static var previews: some View {
        let viewController = UITextFieldViewController()
        return UIViewControllerRepresenter(viewController: viewController)
    }
}
#endif
