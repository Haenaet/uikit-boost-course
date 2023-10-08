//
//  UIPickerView.swift
//  UIKitBoostCourse
//
//  Created by t2023-m0080 on 2023/10/08.
//

import UIKit
import SwiftUI

class UIPickerViewController : BaseUIViewController {
    
    let data1 = ["1번 항목", "2번 항목", "3번 항목"]
    let data2 = ["string형식은", "다 가능✅", "합니다", "짠" ]
    
    lazy var picker: UIPickerView = {
        let p = UIPickerView()
        p.dataSource = self
        p.delegate = self
        p.translatesAutoresizingMaskIntoConstraints = false
        return p
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(picker)
        
        setPickerConstraints()
    }
    
    func setPickerConstraints() {
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
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
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
