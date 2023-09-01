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

    public init(id: AnyHashable, _ responder: UITableViewDataSource) {
        self.id = id
        self.dataSource = responder
        self.delegate = responder as? UITableViewDelegate
        self.dataSourcePrefetching = responder as? UITableViewDataSourcePrefetching
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
