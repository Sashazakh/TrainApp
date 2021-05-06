//
//  RegisterViewController.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {
    var viewModel: RegisterViewModelProtocol!
    private let bag = DisposeBag()
    
    private lazy var logoImageView: UIImageView = {
        let this = UIImageView()
        this.contentMode = .scaleAspectFill
        this.clipsToBounds = true
        this.image = UIImage(named: "logo")
        return this
    }()
    
    private lazy var registerLabel: UILabel = {
        let this = UILabel()
        this.text = "Next"
        this.textColor = .black
        this.textAlignment = .center
        return this
    }()
    
    
    private lazy var loginTextField: UITextField = {
        let this = UITextField()
        this.setPlaceholder(data: "login")
        return this
    }()
    
    private lazy var passwordTextField: UITextField = {
        let this = UITextField()
        this.setPlaceholder(data: "password")
        this.isSecureTextEntry = true
        return this
    }()
    
    private lazy var nameTextField: UITextField = {
        let this = UITextField()
        this.setPlaceholder(data: "name")
        return this
    }()
    
    private lazy var registerButton: UIButton = {
        let this = UIButton()
        this.setTitle("Register", for: .normal)
        return this
    }()
    
    private lazy var loginButton: UIButton = {
        let this = UIButton()
        this.setTitle("login", for: .normal)
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
            loginTextField.resignFirstResponder()
        }
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(logoImageView)
        self.view.addSubview(registerLabel)
        self.view.addSubview(loginTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(registerButton)
        self.view.addSubview(loginButton)
        self.view.addSubview(nameTextField)
        registerButton.mainStyle()
    }
    
    
    private func bind() {
        registerButton.rx.tap
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.viewModel.register(with: self.loginTextField.text,
                                        password: self.passwordTextField.text,
                                        name: self.nameTextField.text)
            }.disposed(by: bag)
        
        loginButton.rx.tap
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
        
        registerLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(96)
        }
        
        
        loginTextField.snp.makeConstraints {
            $0.top.equalTo(registerLabel.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(30)
            $0.width.equalTo(350)
            $0.height.equalTo(62)
            $0.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(96)
        }
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
    }
}
