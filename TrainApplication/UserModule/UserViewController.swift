//
//  UserViewController.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 06.05.2021.
//

import UIKit
import RxSwift
import RxCocoa

class UserViewController: UIViewController {
    var viewModel: UserViewModelProtocol!
    
    private let bag = DisposeBag()
    
    private let nameLabel: UILabel = {
        let this = UILabel()
        this.textColor = .black
        this.textAlignment = .center
        return this
    }()
    
    private let editNameButton: UIButton = {
        let this = UIButton()
        this.setImage(UIImage(named: "edit"), for: .normal)
        return this
    }()
    
    private let loginLabel: UILabel = {
        let this = UILabel()
        this.textColor = .black
        this.textAlignment = .center
        return this
    }()
    
    private let editLoginButton: UIButton = {
        let this = UIButton()
        this.setImage(UIImage(named: "edit"), for: .normal)
        return this
    }()
    
    private let ageLabel: UILabel = {
        let this = UILabel()
        this.textColor = .black
        this.textAlignment = .center
        return this
    }()
    
    private let editAgeButton: UIButton = {
        let this = UIButton()
        this.setImage(UIImage(named: "edit"), for: .normal)
        return this
    }()
    
    private let weightLabel: UILabel = {
        let this = UILabel()
        this.textColor = .black
        this.textAlignment = .center
        return this
    }()
    
    private let editWeightButton: UIButton = {
        let this = UIButton()
        this.setImage(UIImage(named: "edit"), for: .normal)
        return this
    }()
    
    private let heightLabel: UILabel = {
        let this = UILabel()
        this.textColor = .black
        this.textAlignment = .center
        return this
    }()
    
    private let editHeightButton: UIButton = {
        let this = UIButton()
        this.setImage(UIImage(named: "edit"), for: .normal)
        return this
    }()
    
    private let changePasswordButotn: UIButton = {
        let this = UIButton()
        this.mainStyle()
        this.setTitle("Change password", for: .normal)
        return this
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupView()
        setupConstaints()
        bind()
        
        viewModel.moduleDidLoad()
    }
    
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(nameLabel)
        self.view.addSubview(loginLabel)
        self.view.addSubview(ageLabel)
        self.view.addSubview(weightLabel)
        self.view.addSubview(heightLabel)
        self.view.addSubview(changePasswordButotn)
        self.view.addSubview(editNameButton)
        self.view.addSubview(editLoginButton)
        self.view.addSubview(editAgeButton)
        self.view.addSubview(editWeightButton)
        self.view.addSubview(editHeightButton)
    }
    
    private func setupConstaints() {
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            $0.centerX.equalToSuperview()
        }
        
        editNameButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(14)
        }
        
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.top).inset(40)
            $0.centerX.equalToSuperview()
        }
        
        editLoginButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
            $0.top.equalTo(nameLabel.snp.top).inset(38)
        }
        
        ageLabel.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.top).inset(40)
            $0.centerX.equalToSuperview()
        }
        
        editAgeButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
            $0.top.equalTo(loginLabel.snp.top).inset(38)
        }
        
        weightLabel.snp.makeConstraints {
            $0.top.equalTo(ageLabel.snp.top).inset(40)
            $0.centerX.equalToSuperview()
        }
        
        editWeightButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
            $0.top.equalTo(ageLabel.snp.top).inset(38)
        }
        
        
        heightLabel.snp.makeConstraints {
            $0.top.equalTo(weightLabel.snp.top).inset(40)
            $0.centerX.equalToSuperview()
        }
        
        editHeightButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
            $0.top.equalTo(weightLabel.snp.top).inset(38)
        }
        
        changePasswordButotn.snp.makeConstraints {
            $0.top.equalTo(weightLabel.snp.top).inset(90)
            $0.width.equalTo(350)
            $0.height.equalTo(62)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func bind() {
        viewModel.userData
            .bind { [weak self] in
                guard let self = self else { return }
                self.nameLabel.text = $0.name
                self.loginLabel.text = $0.login
                self.ageLabel.text = String($0.age ?? 0)
                self.weightLabel.text = String($0.weight ?? 0)
                self.heightLabel.text = String($0.height ?? 0)
            }.disposed(by: bag)
        
        editNameButton.rx.tap
            .bind { [weak self] in
                guard let self = self else { return }
                self.showAlert(.updateName)
            }.disposed(by: bag)
        
        editLoginButton.rx.tap
            .bind { [weak self] in
                guard let self = self else { return }
                self.showAlert(.updateLogin)
            }.disposed(by: bag)
    }
}

extension UserViewController {
    private func showAlert(_ type: UpdateType) {
        let alert = UIAlertController(title: "Change value",
                                              message: "Input new value",
                                              preferredStyle: UIAlertController.Style.alert)
        
        let save = UIAlertAction(title: "Update", style: .default) { (_) in
                if let valueTf = alert.textFields?[0] {
                    if let value = valueTf.text {
                        if !value.isEmpty {
                            self.viewModel.updateValue(with: type, value: value)
                        }
                    }
                }
                
            }
        alert.addTextField { (textField) in
            textField.placeholder = "New value"
            textField.keyboardType = .asciiCapable
        }
        alert.addAction(save)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}


enum UpdateType {
    case updateName
    case updateLogin
}
