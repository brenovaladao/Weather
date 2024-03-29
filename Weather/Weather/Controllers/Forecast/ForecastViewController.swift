//
//  ForecastViewController.swift
//  Weather
//
//  Created by Breno Vinícios on 19/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    
    private var presenter: ForecastPresenter!
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var refreshControl = UIRefreshControl()
    private var viewObjects = [ForecastListViewObject]()
    
    private lazy var emptyState: ForecastEmptyStateView = {
        let emptyState = ForecastEmptyStateView(frame: .zero)
        emptyState.setupAction {
            self.presenter.getForecastData()
        }
        return emptyState
    }()
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ForecastPresenter(forecastView: self)
        setupTableView()
        presenter.getForecastData()
    }
    
    // MARK: Setup
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.addSubview(refreshControl)
        tableView.tableFooterView = UIView()
    }
    
}

// MARK: - Actions
extension ForecastViewController {

    @objc private func refreshData() {
        presenter.getForecastData(true)
    }
    
}

// MARK: - ForecastProtocol
extension ForecastViewController: ForecastProtocol {
    
    func bind(viewObjects: [ForecastListViewObject]) {
        self.viewObjects = viewObjects
        tableView.reloadData()
    }
    
    func bind(cityName: String) {
        navigationItem.title = cityName
    }
    
    func handleError(_ error: Error) {
        genericErrorHandler(error)
    }
    
    func setLoading(_ loading: Bool) {
        guard loading else {
            refreshControl.endRefreshing()
            stopLoader()
            return
        }
        startLoader()
    }
    
    func setupEmptyState(_ empty: Bool) {
        tableView.backgroundView = empty ? emptyState : nil
    }
    
    func requestLocationPermissionInSettings() {
        openAppSettings()
    }
    
}

// MARK: - UITableViewDelegate
extension ForecastViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let forecastHeaderView = ForecastTableHeaderView()
        let headerTitle = viewObjects[section].headerTitle
        forecastHeaderView.setup(with: headerTitle)
        return forecastHeaderView
    }
    
}

// MARK: - UITableViewDataSource
extension ForecastViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewObjects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewObjects[section].forecastItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.cellIdentifier, for: indexPath) as? ForecastTableViewCell else {
            return UITableViewCell()
        }
        let forecastItemViewObject = viewObjects[indexPath.section].forecastItems[indexPath.row]
        cell.setup(with: forecastItemViewObject)
        return cell
    }
    
}
