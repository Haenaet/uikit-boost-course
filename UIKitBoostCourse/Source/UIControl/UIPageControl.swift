//
//  UIPageControl.swift
//  UIKitBoostCourse
//
//  Created by se-ryeong on 2023/09/18.
//

import UIKit

class UIPageControlViewController: BaseUIViewController, UIScrollViewDelegate {
    var pageControl: UIPageControl = {
        
        let pageControl = UIPageControl()
        
        //pageControl 점의 개수
        pageControl.numberOfPages = 5
        
        //현재 pageControl의 위치
        pageControl.currentPage = 1
        
        //페이지가 하나일 때 pageControl을 숨길지 여부 선택(페이지가 하나이면 굳이 보여줄 필요가 없어서 true로 설정)
        pageControl.hidesForSinglePage = true
        
        //pageControl 점의 색상
        pageControl.pageIndicatorTintColor = .lightGray
        
        //현재 페이지를 알려주는 점 색상
        pageControl.currentPageIndicatorTintColor = .red
        
        //x축, y축 배수 설정 -> 크기 변환
        pageControl.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        
        //위치, 크기 설정
        pageControl.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        
        //아래 세가지는 available iOS 14.0
        //배경스타일: prominent - 반투명, minimal - 투명, automatic
        pageControl.backgroundStyle = .prominent
        
        //꾹 눌러서 페이지 이동 연속적으로 가능하게 할 때 사용
        pageControl.allowsContinuousInteraction = true
        
        //점 이미지 변경 가능
        pageControl.preferredIndicatorImage = UIImage.init(systemName: "heart")
        
        //indicator Image 커스텀 - 특정 페이지만 이미지 설정 가능 but 여러개 이미지 사용은 지양하는 것이 좋음
        let myImage = UIImage(systemName: "star")
        pageControl.setIndicatorImage(myImage, forPage: 1)
        
        //layout direction 좌우, 위아래 설정 가능
        pageControl.direction = .leftToRight
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        return pageControl
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        //scrollIndicator 보여지는 여부 설정
        scrollView.showsHorizontalScrollIndicator = true

        //width에는 pageControl개수만큼 *해줌
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 5, height: UIScreen.main.bounds.height)
        
        //스크롤이 한 페이지씩 되게 설정
        scrollView.isPagingEnabled = true
        
        //scroll범위에 따라 pageControl 값을 바꿔주기 위한 delegate
        scrollView.delegate = self
        
        scrollView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        return scrollView
    }()
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setLayout()
    }
    
    override func setLayout() {
        NSLayoutConstraint.activate([
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageControl.topAnchor.constraint(equalTo: view.topAnchor),
            pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 50)
        ])
    }
    
    override func setUI() {
        view.addSubview(pageControl)
        view.addSubview(scrollView)
    }
}
