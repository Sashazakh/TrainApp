//
//  OptionalViewController.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 06.05.2021.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class OptionalViewController: UIViewController {
    var viewModel: OptionalViewModel!
    private let bag = DisposeBag()
    
    private lazy var logoImageView: UIImageView = {
        let this = UIImageView()
        this.contentMode = .scaleAspectFill
        this.clipsToBounds = true
        this.image = UIImage(named: "logo")
        return this
    }()
    
    private lazy var additionalLabel: UILabel = {
        let this = UILabel()
        this.text = "Additional info"
        this.textColor = .black
        this.textAlignment = .center
        return this
    }()
    
    
    private lazy var ageTextField: UITextField = {
        let this = UITextField()
        this.setPlaceholder(data: "age")
        return this
    }()
    
    private lazy var weightTextField: UITextField = {
        let this = UITextField()
        this.setPlaceholder(data: "weight")
        return this
    }()
    
    private lazy var heightTextField: UITextField = {
        let this = UITextField()
        this.setPlaceholder(data: "height")
        return this
    }()
    
    private lazy var registerButton: UIButton = {
        let this = UIButton()
        this.setTitle("Register", for: .normal)
        return this
    }()
    
    private lazy var backButton: UIButton = {
        let this = UIButton()
        this.setTitle("back", for: .normal)
        this.setTitleColor(.blue, for: .normal)
        return this
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        setupView()
        setupConstaints()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        if !editing {
            ageTextField.resignFirstResponder()
        }
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(logoImageView)
        self.view.addSubview(additionalLabel)
        self.view.addSubview(ageTextField)
        self.view.addSubview(weightTextField)
        self.view.addSubview(heightTextField)
        self.view.addSubview(registerButton)
        self.view.addSubview(backButton)
        registerButton.mainStyle()
    }
    
    
    private func bind() {
        registerButton.rx.tap
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.viewModel.register(with: self.ageTextField.text,
                                        weight: self.weightTextField.text,
                                        height: self.heightTextField.text)
            }.disposed(by: bag)
        
        backButton.rx.tap
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.viewModel.backToLogin()
            }.disposed(by: bag)
    }
    
    // MARK: Containts
    
    private func setupConstaints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            $0.centerX.equalToSuperview()
        }
        
        additionalLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(96)
        }
        
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(additionalLabel.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        weightTextField.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        heightTextField.snp.makeConstraints {
            $0.top.equalTo(weightTextField.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(heightTextField.snp.bottom).offset(30)
            $0.width.equalTo(350)
            $0.height.equalTo(62)
            $0.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(96)
        }
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        ageTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}
