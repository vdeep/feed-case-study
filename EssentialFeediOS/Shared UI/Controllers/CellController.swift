//
//  CellController.swift
//  EssentialFeediOS
//
//  Created by Vishal on 25/08/23.
//

import UIKit

public struct CellController {
    let id: AnyHashable
    let dataSource: UITableViewDataSource
    let delegate: UITableViewDelegate?
    let dataSourcePrefetching: UITableViewDataSourcePrefetching?

    public init(
        id: AnyHashable,
        _ dataSource: UITableViewDataSource,
        _ delegate: UITableViewDelegate? = nil,
        _ dataSourcePrefetching: UITableViewDataSourcePrefetching? = nil
    ) {
        self.id = id
        self.dataSource = dataSource
        self.delegate = delegate
        self.dataSourcePrefetching = dataSourcePrefetching
    }

    public init(id: AnyHashable, _ responder: UITableViewDataSource & UITableViewDelegate & UITableViewDataSourcePrefetching) {
        self.id = id
        self.dataSource = responder
        self.delegate = responder
        self.dataSourcePrefetching = responder
    }
}

extension CellController: Equatable {
    public static func == (lhs: CellController, rhs: CellController) -> Bool {
        lhs.id == rhs.id
    }
}

extension CellController: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
