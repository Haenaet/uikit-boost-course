//
//  UIPageControl.swift
//  UIKitBoostCourse
//
//  Created by se-ryeong on 2023/09/18.
//

import UIKit

/*
 UIpageControl을 사용할 때 UIScrollView와 함께 사용하는 것이 일반적이다.
 
 */

class UIPageControlViewController: BaseUIViewController, UIScrollViewDelegate {
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        
        //pageControl 점의 개수
        pageControl.numberOfPages = 3
        
        //현재 pageControl의 위치
        pageControl.currentPage = 1
        
        //페이지가 하나일 때 pageControl을 숨길지 설정하는 설정(페이지가 하나이면 굳이 보여줄 필요가 없어서 true로 함)
        pageControl.hidesForSinglePage = true
                
        //pageControl 점의 색상
        pageControl.pageIndicatorTintColor = .lightGray
        
        //현재 페이지를 알려주는 점 색상
        pageControl.currentPageIndicatorTintColor = .red
                
        pageControl.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        
        pageControl.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        return pageControl
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 3, height: UIScreen.main.bounds.height)
        
        //스크롤이 한 페이지씩 되게 설정
        scrollView.isPagingEnabled = true
        
        scrollView.delegate = self
        
      //  scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        return scrollView
    }()
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setLayout()
    }
    
    override func setLayout() {
        NSLayoutConstraint.activate([
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageControl.topAnchor.constraint(equalTo: view.topAnchor),
            pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 50),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
//            scrollView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        
        ])
    }
    
    override func setUI() {
        view.addSubview(pageControl)
        view.addSubview(scrollView)
    }
}

