//
//  UISearchTextField.swift
//  UIKitBoostCourse
//
//  Created by FUTURE on 2023/09/30.
//

import UIKit
import SwiftUI

class UISearchTextFieldViewController: BaseUIViewController {
    
    lazy var emailTextField: UISearchTextField = {
        let textField = UISearchTextField(frame: CGRect(x: 50, y: 100, width: 300, height: 40))
        //텍스트필드 placeholder
        textField.placeholder = "이메일을 입력해보십쇼..."
        
        //텍스트필드 배경색
        textField.backgroundColor = .yellow.withAlphaComponent(0.1)
        
        //텍스트필드 글자 색상
        textField.textColor = .brown
        
        //텍스트필드 유형
        textField.borderStyle = .roundedRect
        
        //입력한 토큰을 사용자가 지우게 할 건지
        textField.allowsDeletingTokens = false
        
        //입력한 토큰 복사 가능하도록 할 건지
        textField.allowsCopyingTokens = false
        
        //토큰의 배경색
        textField.tokenBackgroundColor = .systemPink
        
        
        
        
        return textField
    }()
    
    lazy var tagSearchTextField: UISearchTextField = {
        let textField = UISearchTextField(frame: CGRect(x: 50, y: 200, width: 300, height: 40))
        textField.placeholder = "입력하고 엔터누르면 토큰이 되어요 짠..."
        
        textField.borderStyle = .bezel
        
        textField.tokenBackgroundColor = .systemBlue
        
        return textField
    }()
    
    
    lazy var colorSearchTextField: UISearchTextField = {
        let textField = UISearchTextField(frame: CGRect(x: 50, y: 300, width: 300, height: 40))
        textField.placeholder = "색상을 입력해보세요 영어로 red, blue, green..."
        
        textField.borderStyle = .roundedRect
    
        
        return textField
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setupSearchTextField()
    }
    
    
    private func setupSearchTextField() {
        emailTextField.delegate = self
        view.addSubview(emailTextField)
        
        tagSearchTextField.delegate = self
        view.addSubview(tagSearchTextField)
        
        colorSearchTextField.delegate = self
        view.addSubview(colorSearchTextField)
    }
    
    override func setUI() {
        view.backgroundColor = .white
    }
    
    
    // 검색 필드의 텍스트를 검색 토큰으로 변환하는 함수
    func replaceTextualPortion(of range: UITextRange, with token: UISearchToken, at index: Int) {
        // 해당 범위의 텍스트를 토큰으로 변환
        emailTextField.replace(range, withText: "")
        emailTextField.insertToken(token, at: index)
    }
    
    // 색상에 따른 원형 아이콘 생성
    private func createCircleIcon(withColor color: UIColor) -> UIImage? {
        let size = CGSize(width: 20, height: 20)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fillEllipse(in: CGRect(origin: .zero, size: size))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}

extension UISearchTextFieldViewController: UITextFieldDelegate {
    // 텍스트 필드에서 리턴 키를 눌렀을 때 처리 로직
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let searchTextField = textField as? UISearchTextField else { return true }
        
        if searchTextField == emailTextField {
            handleEmailTextFieldReturn(for: searchTextField)
        } else if searchTextField == tagSearchTextField {
            handleTagSearchTextFieldReturn(for: searchTextField)
        } else if searchTextField == colorSearchTextField {
            handleColorSearchTextFieldReturn(for: searchTextField)
        }
        
        return true
    }
    
    // 이메일 텍스트 필드에서 리턴 키를 눌렀을 때의 처리
    private func handleEmailTextFieldReturn(for textField: UISearchTextField) {
        if let emailRange = textField.text?.range(of: ".+@.+\\..+", options: .regularExpression),
           let textRange = textField.textRange(from: textField.position(from: textField.beginningOfDocument, offset: emailRange.lowerBound.utf16Offset(in: textField.text!))!,
                                               to: textField.position(from: textField.beginningOfDocument, offset: emailRange.upperBound.utf16Offset(in: textField.text!))!) {
            let token = UISearchToken(icon: UIImage(systemName: "envelope"), text: String(textField.text![emailRange]))
            insertToken(token, in: textField, replacing: textRange)
        }
    }
    
    // 태그 텍스트 필드에서 리턴 키를 눌렀을 때의 처리
    private func handleTagSearchTextFieldReturn(for textField: UISearchTextField) {
        if let text = textField.text, !text.isEmpty {
            let token = UISearchToken(icon: nil, text: text)
            let range = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)!
            insertToken(token, in: textField, replacing: range)
        }
    }
    
    // 색상 텍스트 필드에서 리턴 키를 눌렀을 때의 처리
    private func handleColorSearchTextFieldReturn(for textField: UISearchTextField) {
        if let colorName = textField.text?.lowercased() {
            let colorMapping: [String: UIColor] = [
                "red": .red,
                "blue": .blue,
                "green": .green
            ]
            
            if let color = colorMapping[colorName] {
                let tokenIcon = createCircleIcon(withColor: color)
                let token = UISearchToken(icon: tokenIcon, text: colorName)
                let range = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)!
                insertToken(token, in: textField, replacing: range)
            }
        }
    }
    
    private func insertToken(_ token: UISearchToken, in textField: UISearchTextField, replacing range: UITextRange) {
        //다시 빈 값으로 초기화하기
        textField.replace(range, withText: "")
        
        //at: 0을 입력하면 토큰이 맨 앞에 생성이 된다.
        textField.insertToken(token, at: textField.tokens.count)
    }
}








//프리뷰
private struct UIViewControllerRepresenter: UIViewControllerRepresentable {
    
    let viewController: UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        return viewController
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    
}

struct UIViewControllerPreview3: PreviewProvider {
    
    static var previews: some View {
        
        let viewController =  UISearchTextFieldViewController()
        
        return UIViewControllerRepresenter(viewController: viewController)
        
    }
}
