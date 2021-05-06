//
//  LoginViewController.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    var viewModel: LoginViewModelProtocol!
    private let bag = DisposeBag()
    
    private lazy var logoImageView: UIImageView = {
        let this = UIImageView()
        this.contentMode = .scaleAspectFill
        this.clipsToBounds = true
        this.image = UIImage(named: "logo")
        return this
    }()
    
    private lazy var loginLabel: UILabel = {
        let this = UILabel()
        this.text = "Log in or"
        this.textColor = .black
        this.textAlignment = .center
        return this
    }()
    
    private lazy var registerButton: UIButton = {
        let this = UIButton()
        this.setTitle("register", for: .normal)
        this.setTitleColor(.blue, for: .normal)
        return this
    }()
    
    private lazy var loginTextField: UITextField = {
        let this = UITextField()
        this.setPlaceholder(data: "login")
        return this
    }()
    
    private lazy var nextButton: UIButton = {
        let this = UIButton()
        this.setTitle("Next", for: .normal)
        return this
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        bind()
        setupView()
        setupConstaints()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        if !editing {
            loginTextField.resignFirstResponder()
        }
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(logoImageView)
        self.view.addSubview(loginLabel)
        self.view.addSubview(registerButton)
        self.view.addSubview(loginTextField)
        self.view.addSubview(nextButton)
        nextButton.mainStyle()
    }
    
    
    private func bind() {
        nextButton.rx.tap
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.viewModel.login(with: self.loginTextField.text)
            }.disposed(by: bag)
        
        registerButton.rx.tap
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.viewModel.userNotRegistered()
            }.disposed(by: bag)
    }
    
    // MARK: Containts
    
    private func setupConstaints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            $0.centerX.equalToSuperview()
        }
        
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(96)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(96)
        }
        
        loginTextField.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).offset(30)
            $0.width.equalTo(350)
            $0.height.equalTo(62)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        loginTextField.resignFirstResponder()
    }
}

extension LoginViewController: UITextFieldDelegate {
}
