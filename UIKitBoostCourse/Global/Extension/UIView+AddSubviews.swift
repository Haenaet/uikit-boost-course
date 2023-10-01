//
//  UIView+AddSubviews.swift
//  UIKitBoostCourse
//
//  Created by Yujin Kim on 2023-10-01.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach({ view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        })
    }
    
}
