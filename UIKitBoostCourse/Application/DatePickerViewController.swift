//
//  DatePickerViewController.swift
//  UIKitBoostCourse
//
//  Created by t2023-m0062 on 2023/09/11.
//

import UIKit

class DatePickerViewController: BaseUIViewController {
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime //Mode종류: time, date, dateAndTime, countDownTimer
        datePicker.preferredDatePickerStyle = .compact //Style종류: wheels, inline, compact, automatic
        datePicker.locale = Locale(identifier: "ko-KR") //국가 설정(설정안하면 아이폰 기본설정 사용)
        datePicker.minuteInterval = 1  //시간 설정 분 단위 간격 조절(기본값은 1분) - 60이내의 값 입력해야함
        datePicker.date = Date(timeIntervalSinceNow: -3600 * 24 * 3) //현재 날짜 기준 3일전 날짜로 선택되어 시작함
        datePicker.timeZone = .autoupdatingCurrent  //현재 시간에 맞게 자동으로 업데이트
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        return datePicker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setLayout()
        minimumDate()
    }
    
    private func minimumDate() {
        //wheel모드에서는 지정해놓은 날짜 이상, 이하로 스크롤할 경우 기본값으로 돌아옴
        //compact, inline모드에서는 선택할 수 없는 날짜가 연한 회색으로 비활성화 됨
        var components = DateComponents()
        components.day = 7
        let maxDate = Calendar.autoupdatingCurrent.date(byAdding: components, to: Date())
        components.day = -7
        let minDate = Calendar.autoupdatingCurrent.date(byAdding: components, to: Date())
        
        datePicker.maximumDate = maxDate
        datePicker.minimumDate = minDate
    }
    
    override func setLayout() {
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func setUI() {
        view.addSubview(datePicker)
    }
}







