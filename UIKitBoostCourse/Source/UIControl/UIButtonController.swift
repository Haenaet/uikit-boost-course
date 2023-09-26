//
//  UIButton.swift
//  UIKitBoostCourse
//
//  Created by FUTURE on 2023/09/11.
//

import UIKit
import SwiftUI


/*
 ⚪️ UIButton : 사용자 상호 작용에 응답하여 사용자 정의 코드를 실행하는 컨트롤
 
 
 - 기본적으로 제공되는 버튼 타입 : system, detail disclosure, info(light, dark), contactadd, close가 있다.

 - Detail Disclosure 버튼, infoLight 버튼, infoDark 버튼이 똑같이 생겼지만, 맥락에 맞게 사용하는 것이 좋다. 그 이유는 어떤 버튼을 썼는 지에 따라 코드의 맥락이 달라지고, 접근성 측면(ex. voice over)에서도 구분이 되는 것이 좋기 때문이다. 자료를 찾아보니 예전 버전에서는 생김새가 각각 다 달랐다고 한다.
 
 - 기본적으로 제공되는 타입이 아니라 내 마음대로 만들고 싶다면, 직접 커스텀 해서 만들면 된다.
 
 - 공식문서 번역본을 보고 싶다면 : https://www.notion.so/real-future/UIButton-e655b3f0b2cb4b7eb97cf10f5cce088e?pvs=4
 
 */

class UIButtonController: RootViewController {
    
    
    // System 버튼
    let systemButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("System Button", for: .normal)
        button.frame = CGRect(x: 20, y: 20, width: 120, height: 50)
        return button
    }()
    
    
    // Detail Disclosure 버튼
    let detailButton: UIButton = {
        let button = UIButton(type: .detailDisclosure)
        button.frame = CGRect(x: 20, y: 140, width: 30, height: 30)
        return button
    }()
    
    
    // infoLight 버튼
    let infoLightButton: UIButton = {
        let button = UIButton(type: .infoLight)
        button.frame = CGRect(x: 60, y: 140, width: 30, height: 30)
        return button
    }()
    
    
    // infoDark 버튼
    let infoDarkButton: UIButton = {
        let button = UIButton(type: .infoDark)
        button.frame = CGRect(x: 100, y: 140, width: 30, height: 30)
        return button
    }()
    
    
    // contactAdd 버튼
    let contactAddButton: UIButton = {
        let button = UIButton(type: .contactAdd)
        button.frame = CGRect(x: 140, y: 140, width: 30, height: 30)
        return button
    }()
    
    
    // close 버튼
    let closetButton: UIButton = {
        let button = UIButton(type: .close)
        button.frame = CGRect(x: 20, y: 200, width: 50, height: 50)
        return button
    }()
    
    
    // System 버튼, 누르면 동작하는 버튼
    let myButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: 75, width: 100, height: 50)
        button.setTitle("Tap Me", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    
    // 버튼, (with, target, action) 메서드
    let systemButtonWithUIImage: UIButton = {
        
        let image = UIImage(systemName: "star.fill")
        guard let image = image else { return UIButton() }
        let button = UIButton.systemButton(with: image, target: self, action: #selector(buttonTapped(_:)))
        
        button.frame = CGRect(x: 20, y: 270, width: 50, height: 50)
        
        return button
    }()
    
    
    // filled 버튼, (configuration, primaryAction)메서드
    let filledButton: UIButton = {
        let action = UIAction(title: "Filled Button") { _ in
            print("Filled Button 눌렸습니다~!")
        }
        
        var config = UIButton.Configuration.filled()
        config.title = "Filled Button"
        config.subtitle = "subtitle"
        config.image = UIImage(systemName: "star.fill")
        
        //버튼의 코너스타일 속성
        config.cornerStyle = .capsule
        
        //이미지 바깥 패딩 값
        config.imagePadding = 10
        
        let button = UIButton(configuration: config, primaryAction: action)
        button.frame = CGRect(x: 20, y: 380, width: 160, height: 50)
        
        return button
    }()
    
    
    // grey 버튼, (configuration, primaryAction: action)메서드
    let greyButton: UIButton = {
        let action = UIAction(title: "greyButton") { _ in
            print("grey Button 눌렸습니다~!")
        }
        
        var config = UIButton.Configuration.gray()
        config.title = "grey Button"
        config.image = UIImage(systemName: "star.fill")
        config.imagePadding = 10
        
        
        let button = UIButton(configuration: config, primaryAction: action)
        button.frame = CGRect(x: 200, y: 380, width: 160, height: 50)
        
        
        return button
    }()
    
    
    // custom 버튼1
    let customButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 20, y: 510, width: 200, height: 50)
        
        //버튼 배경색 설정
        button.backgroundColor = UIColor.blue
        
        // 버튼 제목 설정
        button.setTitle("custom button1", for: .normal)
        button.setTitleColor(UIColor.green, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        
        // 버튼 둥글기
        button.layer.cornerRadius = 25
        
        // 버튼 이벤트
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // 그림자 만들기
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4.0
        
        // 눌렀을 때 글자 색상 변경
        button.setTitleColor(UIColor.red, for: .highlighted)
        
        // 버튼 테두리
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.green.cgColor
        
        return button
    }()
    
    
    // custom 버튼2
    let customButton2: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 20, y: 580, width: 200, height: 50)
        
        //버튼 배경색 설정
        button.backgroundColor = UIColor.blue
        
        //버튼 텍스트 설정
        button.setTitle("Custom Button 2", for: .normal)
        button.setTitleColor(UIColor.yellow, for: .normal)

        //버튼 이미지(시스템 이미지) 설정
        let personImage = UIImage(systemName: "person.fill")
        button.setImage(personImage, for: .normal)
        button.tintColor = .orange
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        
        //버튼 액션 설정
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)


        //버튼 폰트 설정
        button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 19)
        
        //버튼의 모서리 둥글게 만들기
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    
    
    
    @objc func buttonTapped(_ sender: UIButton) {
        print("Button 눌렸습니다~!")
    }
    
    
    
    override func setUI() {
        self.view.addSubview(myButton)
        self.view.addSubview(systemButton)
        self.view.addSubview(detailButton)
        self.view.addSubview(infoLightButton)
        self.view.addSubview(infoDarkButton)
        self.view.addSubview(contactAddButton)
        self.view.addSubview(closetButton)
        self.view.addSubview(systemButtonWithUIImage)
        self.view.addSubview(filledButton)
        self.view.addSubview(greyButton)
        self.view.addSubview(customButton)
        self.view.addSubview(customButton2)
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

struct UIViewControllerPreview: PreviewProvider {
    
    static var previews: some View {
        
        let viewController =  UIButtonController()
        
        return UIViewControllerRepresenter(viewController: viewController)
        
    }
}
