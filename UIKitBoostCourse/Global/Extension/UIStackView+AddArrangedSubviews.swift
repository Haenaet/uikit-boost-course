//
//  UIStackView+AddArrangedSubviews.swift
//  UIKitBoostCourse
//
//  Created by Yujin Kim on 2023-10-01.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach({ view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addArrangedSubview(view)
        })
    }
    
}
