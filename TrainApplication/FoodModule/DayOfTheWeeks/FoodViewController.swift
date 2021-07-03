//
//  FoodViewController.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 06.05.2021.
//

import UIKit
import RxSwift


class FoodViewController: UIViewController {
    var viewModel: FoodViewModelProtocol!
    var bag = DisposeBag()
    
    private let tableView: UITableView = {
        let this = UITableView()
        return this
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Food"
        setupView()
        setupContraints()
        bind()
        viewModel.moduleDidLoad()
    }
    
    private func setupView() {
        self.view.addSubview(tableView)
        tableView.rx.setDelegate(self).disposed(by: bag)
    }
    
    private func setupContraints() {
        tableView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
    }
    
    private func bind() {
        tableView.register(DayCell.self, forCellReuseIdentifier: DayCell.cellId)
        let dayOfTheWeeks = Observable.of(DayOfTheWeeks.allCases)
        
        dayOfTheWeeks.bind(to: tableView.rx.items(cellIdentifier: DayCell.cellId, cellType: DayCell.self)) { row, item, cell in
            print("info: \(item.info)")
            cell.configureCell(with: item.info)
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(DayOfTheWeeks.self).subscribe(onNext: { [weak self] item in
            guard let self = self else { return }
            self.viewModel.selectedDay(day: item)
        }).disposed(by: bag)
    }
}

extension FoodViewController: UITableViewDelegate {
}
