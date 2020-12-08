//
//  ListingViewController.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

class ListingViewController: BaseViewController {

    var presenter: ListingPresenterInput?

    @IBOutlet private (set) weak var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
}

extension ListingViewController {
    func configureView() {
        title = presenter?.title ?? ""
        tableView?.registerNib(ArticleCell.self)
    }
}

extension ListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { presenter?.numberOfRows ?? 0 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier) as? ArticleCell else { return UITableViewCell()}
        presenter?.configre(cell: cell, at: indexPath)
        return cell
    }
}

extension ListingViewController: ListingPresentable {}
