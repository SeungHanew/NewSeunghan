//
//  ViewController.swift
//  유승한 계산기
//
//  Created by 유승한 on 4/2/25.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // 수식 표시용 UILabel
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 60)
        view.addSubview(label)
        // 버튼 배열 정의 (계산기 형태)
        let buttonTitles = [
            ["7", "8", "9", "+"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "*"],
            ["AC", "0", "=", "/"]
        ]
        // 세로 스택뷰 생성
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        view.addSubview(verticalStackView)
        // 각 행별로 가로 스택뷰 추가
        for row in buttonTitles {
            let horizontalStackView = makeHorizontalStackView(makeButtons(row))
            verticalStackView.addArrangedSubview(horizontalStackView)
        }
        // AutoLayout 설정
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalToSuperview().offset(200)
            make.height.equalTo(100)
        }
        verticalStackView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.top.equalTo(label.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
    }
    /// 버튼을 하나 생성하는 함수 (타이틀, 액션, 배경색 설정 가능)
    func makeButton(titleValue: String, action: Selector? = nil, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(titleValue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 40
        button.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
        if let action = action {
            button.addTarget(self, action: action, for: .touchUpInside)
        }
        return button
    }
    /// 버튼들을 생성하는 함수 (타이틀에 따라 색상 분기 처리)
    func makeButtons(_ titles: [String]) -> [UIButton] {
        return titles.map { title in
            let isOperator = ["+", "-", "*", "/", "AC", "="].contains(title)
            let color = isOperator ? .orange : UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            return makeButton(titleValue: title, backgroundColor: color)
        }
    }
    /// 가로 스택뷰를 생성하는 함수
    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }
}
