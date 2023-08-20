//
//  SharedLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by Vishal on 20/08/23.
//

import XCTest
import EssentialFeed

final class SharedLocalizationTests: XCTestCase {

    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Shared"
        let bundle = Bundle(for: LoadResourcePresenter<Any, DummyView>.self)
        assertLocalizedKeyAndValuesExist(in: bundle, table: table)
    }

    private class DummyView: ResourceView {
        func display(_ viewModel: Any  ) {}
    }

}
