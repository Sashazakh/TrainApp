//
//  DayCell.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 07.05.2021.
//

import UIKit
import SnapKit

class DayCell: UITableViewCell {
    static let cellId = "dayCell"
    
    private lazy var cellTitle: UILabel = {
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
        self.backgroundColor = #colorLiteral(red: 0.1183021143, green: 0.5606164932, blue: 0.7423351407, alpha: 1)
        self.addSubview(cellTitle)
    }
    
    private func setupContraints() {
        cellTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(self.safeAreaLayoutGuide.snp.left).inset(20)
        }
    }
    
    func configureCell(with title: String) {
        cellTitle.text = title
    }
}
