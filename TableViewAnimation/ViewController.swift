//
//  ViewController.swift
//  TableViewAnimation
//
//  Created by Renan Benatti Dias on 19/12/19.
//  Copyright © 2019 Blue Stack. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    private let header = TableViewHeader.loadView()
    private let tableView = UITableView()
    
    private var firstRun = true
    
    private var viewModels = [
        Princess(name: "Anna", subtitle: "Arandele's second princess"),
        Princess(name: "Mulan", subtitle: "Brave Chinese warrior"),
        Princess(name: "Anna", subtitle: "Arandele's second princess"),
        Princess(name: "Anna", subtitle: "Arandele's second princess"),
        Princess(name: "Anna", subtitle: "Arandele's second princess"),
        Princess(name: "Mulan", subtitle: "Brave Chinese warrior"),
        Princess(name: "Anna", subtitle: "Arandele's second princess"),
        Princess(name: "Anna", subtitle: "Arandele's second princess"),
        Princess(name: "Mulan", subtitle: "Brave Chinese warrior"),
        Princess(name: "Anna", subtitle: "Arandele's second princess"),
        Princess(name: "Anna", subtitle: "Arandele's second princess"),
        Princess(name: "Mulan", subtitle: "Brave Chinese warrior"),
        Princess(name: "Anna", subtitle: "Arandele's second princess"),
        Princess(name: "Anna", subtitle: "Arandele's second princess"),
        Princess(name: "Mulan", subtitle: "Brave Chinese warrior"),
        Princess(name: "Anna", subtitle: "Arandele's second princess")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHeader()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        firstRun = false
    }
    
    private func setupHeader() {
        view.addSubview(header)
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: header.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        tableView.backgroundColor = .clear
        
        tableView.register(UINib(nibName: "PrincessTableViewCell", bundle: nil), forCellReuseIdentifier: "PrincessTableViewCell")
        
        tableView.separatorColor = .clear
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PrincessTableViewCell", for: indexPath) as? PrincessTableViewCell else { return UITableViewCell() }
        cell.populateWith(viewModel: viewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard firstRun else { return }
        
        cell.alpha = 0.0
        cell.transform = CGAffineTransform(translationX: 0, y: 100)
        
        UIView.animate(withDuration: 0.4, delay: Double(indexPath.row) * 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .curveEaseIn, animations: {
            cell.alpha = 1.0
            cell.transform = .identity
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
