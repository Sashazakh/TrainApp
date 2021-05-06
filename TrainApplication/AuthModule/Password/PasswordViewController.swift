//
//  PasswordViewController.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import UIKit
import RxSwift

class PasswordViewController: UIViewController {
    var viewModel: PasswordViewModelProtocol!
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
        this.text = "Password"
        this.textColor = .black
        this.textAlignment = .center
        return this
    }()
    
    
    private lazy var passwordTextField: UITextField = {
        let this = UITextField()
        this.placeholder = "password"
        return this
    }()
    
    private lazy var nextButton: UIButton = {
        let this = UIButton()
        this.setTitle("Login", for: .normal)
        return this
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        setupView()
        setupConstaints()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        if !editing {
            passwordTextField.resignFirstResponder()
        }
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(logoImageView)
        self.view.addSubview(loginLabel)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(nextButton)
        nextButton.mainStyle()
    }
    
    
    private func bind() {
        nextButton.rx.tap
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.viewModel.checkPassword(with: self.passwordTextField.text)
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
        
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.width.equalTo(350)
            $0.height.equalTo(62)
            $0.centerX.equalToSuperview()
        }
    }
}
