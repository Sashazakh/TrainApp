//
//  DayViewController.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 08.05.2021.
//

import Foundation
import RxSwift


class DayViewController: UIViewController {
    var viewModel: DayViewModelProtocol!
    var bag = DisposeBag()
    
    private let tableView: UITableView = {
        let this = UITableView()
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
        self.view.addSubview(tableView)
        tableView.rx.setDelegate(self).disposed(by: bag)
        tableView.separatorStyle = .none
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    private func setupContraints() {
        tableView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
    }
    
    private func bind() {
        tableView.register(FoodCell.self, forCellReuseIdentifier: FoodCell.cellId)
        
        viewModel.foods.bind(to: tableView.rx.items(cellIdentifier: FoodCell.cellId, cellType: FoodCell.self)) { row, item, cell in
            cell.configureCell(with: item)
        }.disposed(by: bag)
    }
    
    @objc
    func addTapped() {
        viewModel.addDayTap()
    }
}

extension DayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
