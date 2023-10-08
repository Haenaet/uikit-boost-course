//
//  UIPickerView.swift
//  UIKitBoostCourse
//
//  Created by t2023-m0080 on 2023/10/08.
//

import UIKit
import SwiftUI

class UIPickerViewController : BaseUIViewController {
    
    // 첫 번째 컴포넌트에 표시될 데이터
    let data1 = ["1번 항목", "2번 항목", "3번 항목"]
    
    // 두 번째 컴포넌트에 표시될 데이터
    let data2 = ["string형식은", "다 가능✅", "합니다", "짠" ]
    
    
    // UIPickerView 인스턴스 생성 및 설정
    lazy var picker: UIPickerView = {
        let p = UIPickerView()
        p.dataSource = self // 데이터 소스 지정
        p.delegate = self // 델리게이트 지정
        p.translatesAutoresizingMaskIntoConstraints = false
        return p
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    
    override func setUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(picker)
        
        NSLayoutConstraint.activate([
            picker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            picker.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            picker.widthAnchor.constraint(equalToConstant: 300),
            picker.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}


// UIPickerViewDataSource extension
extension UIPickerViewController: UIPickerViewDataSource {
    // 컴포넌트(열)의 수 반환
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // 각 컴포넌트에서 표시될 행의 수 반환
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return data1.count
        case 1:
            return data2.count
        default:
            return 0
        }
    }
}


// UIPickerViewDelegate extension
extension UIPickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        // 각 행에 표시될 문자열 반환
        case 0:
            return data1[row]
        case 1:
            return data2[row]
        default:
            return nil
        }
    }
}


// 프리뷰
private struct UIViewControllerRepresenter: UIViewControllerRepresentable {
    
    let viewController: UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct UIViewControllerPreview4: PreviewProvider {
    
    static var previews: some View {
        let viewController = UIPickerViewController()
        return UIViewControllerRepresenter(viewController: viewController)
    }
}
