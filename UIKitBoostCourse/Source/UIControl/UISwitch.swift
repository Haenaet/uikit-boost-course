//
//  UISwitch.swift
//  UIKitBoostCourse
//
//  Created by se-ryeong on 2023/10/01.
//

import UIKit

class UISwitchViewController: BaseUIViewController {
    
    private lazy var controlSwitch: UISwitch = {
        let testswitch = UISwitch()
        
        //true면 켜져있는 상태, false면 꺼져있는 상태
        testswitch.isOn = true
                
        //switch on상태일 때 BarView(배경 뷰) 컬러
        testswitch.onTintColor = .yellow
        
        //switch background 컬러 설정
        testswitch.backgroundColor = .systemPink
        
        //switch BarView(배경 뷰) 컬러 설정
        testswitch.subviews.first?.backgroundColor = .brown
        
        //switch 동그라미(circleView) 컬러
        testswitch.thumbTintColor = .blue
        
        //이미지 커스텀 : off-image, on-image 속성은 iOS 7이상부터 사용 안됨 정책상 막아둠
        //이미지를 넣고싶으면 직접 커스텀해서 switch를 만들어줘야한다.
        testswitch.offImage = UIImage(systemName: "heart.fill")
        
        //macOS에서는 checkbox, 그렇지 않으면 sliding스타일 자동 적용 - 굳이 설정하지 않아도 됨
        testswitch.preferredStyle = .automatic
    
        testswitch.translatesAutoresizingMaskIntoConstraints = false
        
        return testswitch
    }()
    
    override func setLayout() {
        view.backgroundColor = .white
        view.addSubview(controlSwitch)
        
        NSLayoutConstraint.activate([
            controlSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            controlSwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
