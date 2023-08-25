//
//  CellController.swift
//  EssentialFeediOS
//
//  Created by Vishal on 25/08/23.
//

import UIKit

public struct CellController {
    let dataSource: UITableViewDataSource
    let delegate: UITableViewDelegate?
    let dataSourcePrefetching: UITableViewDataSourcePrefetching?

    public init(
        _ dataSource: UITableViewDataSource,
        _ delegate: UITableViewDelegate? = nil,
        _ dataSourcePrefetching: UITableViewDataSourcePrefetching? = nil
    ) {
        self.dataSource = dataSource
        self.delegate = delegate
        self.dataSourcePrefetching = dataSourcePrefetching
    }

    public init(_ responder: UITableViewDataSource & UITableViewDelegate & UITableViewDataSourcePrefetching) {
        self.dataSource = responder
        self.delegate = responder
        self.dataSourcePrefetching = responder
    }
}
