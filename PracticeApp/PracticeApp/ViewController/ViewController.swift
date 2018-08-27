//
//  ViewController.swift
//  PracticeApp
//
//  Created by Hoàng Hải on 8/19/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let viewModal = CitiesViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        configTable()
        configSearchBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func configSearchBar() {
        searchBar
            .rx.text
            .orEmpty
            .subscribe(onNext: { [unowned self] query in
                self.viewModal.showCities.value = self.viewModal.cities.filter { $0.hasPrefix(query) }
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)}
    
    private func configTable() {
        viewModal.showCities.asObservable().bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self))
        {
            row, value, cell in
            cell.textLabel?.text = value
        }.disposed(by: disposeBag)
    }
    
//    searchBar
//    .rx.text // Observable property thanks to RxCocoa
//    .orEmpty // Make it non-optional
//    .debounce(0.5, scheduler: MainScheduler.instance) // Wait 0.5 for changes.
//    .distinctUntilChanged() // If they didn't occur, check if the new value is the same as old.
//    .filter { !$0.isEmpty } // If the new value is really new, filter for non-empty query.
//    .subscribe(onNext: { [unowned self] query in // Here we subscribe to every new value, that is not empty (thanks to filter above).
//    self.shownCities = self.allCities.filter { $0.hasPrefix(query) } // We now do our "API Request" to find cities.
//    self.tableView.reloadData() // And reload table view data.
//    })
//    .addDisposableTo(disposeBag)


}

