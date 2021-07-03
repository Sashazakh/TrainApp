//
//  FoodCell.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 09.05.2021.
//

import Foundation
import SnapKit

class FoodCell: UITableViewCell {
    static let cellId = "foodCell"
    
    private lazy var mainView: UIView = {
        let this = UIView()
        this.backgroundColor = #colorLiteral(red: 0.1183021143, green: 0.5606164932, blue: 0.7423351407, alpha: 1)
        return this
    }()
    
    private lazy var nameLabel: UILabel = {
        let this = UILabel()
        this.textColor = .white
        this.textAlignment = .left
        this.text = "Name:"
        return this
    }()
    
    private lazy var nameLabelValue: UILabel = {
        let this = UILabel()
        this.textColor = .white
        this.textAlignment = .left
        return this
    }()
    
    private lazy var calloriesLabel: UILabel = {
        let this = UILabel()
        this.textColor = .white
        this.textAlignment = .left
        this.text = "Callories:"
        return this
    }()
    
    private lazy var calloriesLabelValue: UILabel = {
        let this = UILabel()
        this.textColor = .white
        this.textAlignment = .left
        return this
    }()
    
    private lazy var timeLabel: UILabel = {
        let this = UILabel()
        this.textColor = .white
        this.textAlignment = .left
        this.text = "Time:"
        return this
    }()
    
    private lazy var timeLabelValue: UILabel = {
        let this = UILabel()
        this.textColor = .white
        this.textAlignment = .left
        return this
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        self.backgroundColor = .white
        self.addSubview(mainView)
        mainView.addSubview(nameLabel)
        mainView.addSubview(nameLabelValue)
        mainView.addSubview(calloriesLabel)
        mainView.addSubview(calloriesLabelValue)
        mainView.addSubview(timeLabel)
        mainView.addSubview(timeLabelValue)
        mainView.layer.cornerRadius = 12
    }
    
    private func setupContraints() {
        mainView.snp.makeConstraints {
            $0.left.right.bottom.top.equalToSuperview().inset(10)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(mainView.snp.top).inset(10)
            $0.left.equalTo(mainView.snp.left).inset(20)
        }
        
        nameLabelValue.snp.makeConstraints {
            $0.top.equalTo(mainView.snp.top).inset(10)
            $0.left.equalTo(nameLabel.snp.right).inset(-5)
        }
        
        calloriesLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).inset(-10)
            $0.left.equalTo(mainView.snp.left).inset(20)
        }
        
        calloriesLabelValue.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).inset(-10)
            $0.left.equalTo(calloriesLabel.snp.right).inset(-5)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(calloriesLabel.snp.bottom).inset(-10)
            $0.left.equalTo(mainView.snp.left).inset(20)
        }
        
        timeLabelValue.snp.makeConstraints {
            $0.top.equalTo(calloriesLabel.snp.bottom).inset(-10)
            $0.left.equalTo(timeLabel.snp.right).inset(-5)
        }
    }
    
    func configureCell(with food: Food) {
        nameLabelValue.text = food.name
        calloriesLabelValue.text = String(food.callories)
        timeLabelValue.text = String(food.time)
    }
}
