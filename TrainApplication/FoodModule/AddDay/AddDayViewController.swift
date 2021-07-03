//
//  AddDay.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 09.05.2021.
//

import Foundation
import RxSwift


class AddDayViewController: UIViewController {
    var viewModel: AddDayViewModelProtocol!
    var bag = DisposeBag()
    
    private lazy var nameLabel: UILabel = {
        let this = UILabel()
        this.textColor = .black
        this.textAlignment = .left
        this.text = "Name:"
        return this
    }()
    
    private lazy var nameTextField: UITextField = {
        let this = UITextField()
        this.setPlaceholder(data: "name of the food")
        return this
    }()
    
    private lazy var calloriesLabel: UILabel = {
        let this = UILabel()
        this.textColor = .black
        this.textAlignment = .left
        this.text = "Callories:"
        return this
    }()
    
    private lazy var calloriesTextField: UITextField = {
        let this = UITextField()
        this.setPlaceholder(data: "callories")
        return this
    }()
    
    private lazy var timeLabel: UILabel = {
        let this = UILabel()
        this.textColor = .black
        this.textAlignment = .left
        this.text = "Time:"
        return this
    }()
    
    private lazy var hoursTextField: UITextField = {
        let this = UITextField()
        this.setPlaceholder(data: "hours")
        return this
    }()
    
    private lazy var minutesTextField: UITextField = {
        let this = UITextField()
        this.setPlaceholder(data: "minutes")
        return this
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupContraints()
        bind()
        viewModel.moduleDidLoad()
    }
    
    private func setupView() {
        self.title = "Add day"
        self.view.backgroundColor = .white
        self.view.addSubview(nameLabel)
        self.view.addSubview(nameTextField)
        self.view.addSubview(calloriesLabel)
        self.view.addSubview(calloriesTextField)
        self.view.addSubview(timeLabel)
        self.view.addSubview(hoursTextField)
        self.view.addSubview(minutesTextField)
    }
    
    private func setupContraints() {
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).inset(16)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).inset(-20)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).inset(16)
        }
        
        calloriesLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).inset(-20)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).inset(16)
        }
        
        calloriesTextField.snp.makeConstraints {
            $0.top.equalTo(calloriesLabel.snp.bottom).inset(-20)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).inset(16)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(calloriesTextField.snp.bottom).inset(-20)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).inset(16)
        }
        
        hoursTextField.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).inset(-20)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).inset(16)
        }
        
        minutesTextField.snp.makeConstraints {
            $0.top.equalTo(hoursTextField.snp.bottom).inset(-20)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).inset(16)
        }
    }
    
    private func bind() {
    }
}
