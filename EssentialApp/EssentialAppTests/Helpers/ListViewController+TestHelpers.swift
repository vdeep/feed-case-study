//
//  ListViewController+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Vishal on 24/07/23.
//

import UIKit
import EssentialFeediOS

extension ListViewController {
    override public func loadViewIfNeeded() {
        super.loadViewIfNeeded()

        tableView.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
    }

    func simulateUserInitiatedReload() {
        refreshControl?.simulatePullToRefresh()
    }
    
    @discardableResult
    func simulateFeedImageViewVisible(at index: Int) -> FeedImageCell? {
        return feedImageView(at: index) as? FeedImageCell
    }

    @discardableResult
    func simulateFeedImageBecomingVisibleAgain(at row: Int) -> FeedImageCell? {
        let view = simulateFeedImageViewNotVisible(at: row)

        let delegate = tableView.delegate
        let index = IndexPath(row: row, section: feedImagesSection)
        delegate?.tableView?(tableView, willDisplay: view!, forRowAt: index)

        return view
    }
    
    @discardableResult
    func simulateFeedImageViewNotVisible(at row: Int) -> FeedImageCell? {
        let view = simulateFeedImageViewVisible(at: row)
        
        let delegate = tableView.delegate
        let index = IndexPath(row: row, section: feedImagesSection)
        delegate?.tableView?(tableView, didEndDisplaying: view!, forRowAt: index)
        
        return view
    }

    func simulateTapOnFeedImage(at row: Int) {
        let delegate = tableView.delegate
        let index = IndexPath(row: row, section: feedImagesSection)
        delegate?.tableView?(tableView, didSelectRowAt: index)
    }
    
    func simulateFeedImageViewNearVisible(at row: Int) {
        let ds = tableView.prefetchDataSource
        let index = IndexPath(row: row, section: feedImagesSection)
        ds?.tableView(tableView, prefetchRowsAt: [index])
    }
    
    func simulateFeedImageViewNotNearVisible(at row: Int) {
        simulateFeedImageViewNearVisible(at: row)
        
        let ds = tableView.prefetchDataSource
        let index = IndexPath(row: row, section: feedImagesSection)
        ds?.tableView?(tableView, cancelPrefetchingForRowsAt: [index])
    }

    func simulateLoadMoreFeedAction() {
        guard let view = loadMoreFeedCell() else { return }
        let delegate = tableView.delegate
        let index = IndexPath(row: 0, section: feedLoadMoreSection)
        delegate?.tableView?(tableView, willDisplay: view, forRowAt: index)
    }

    func simulateTapOnLoadMoreFeedError() {
        let delegate = tableView.delegate
        let index = IndexPath(row: 0, section: feedLoadMoreSection)
        delegate?.tableView?(tableView, didSelectRowAt: index)
    }

    var loadMoreFeedErrorMessage: String? {
        loadMoreFeedCell()?.message
    }

    var isShowingLoadMoreFeedIndicator: Bool {
        loadMoreFeedCell()?.isLoading == true
    }

    var canLoadMoreFeed: Bool {
        loadMoreFeedCell() != nil
    }

    private func loadMoreFeedCell() -> LoadMoreCell? {
        cell(row: 0, section: feedLoadMoreSection) as? LoadMoreCell
    }
    
    func renderedFeedImageData(at index: Int) -> Data? {
        simulateFeedImageViewVisible(at: index)?.renderedImage
    }

    func simulateErrorViewTap() {
        errorView.simulateTap()
    }

    var errorMessage: String? {
        errorView.message
    }
    
    var isShowingLoadingIndicator: Bool {
        return refreshControl?.isRefreshing == true
    }

    func cell(row: Int, section: Int) -> UITableViewCell? {
        guard tableView.numberOfSections > section,
              tableView.numberOfRows(inSection: section) > row else {
            return nil
        }

        let ds = tableView.dataSource
        let indexPath = IndexPath(row: row, section: section)
        return ds?.tableView(tableView, cellForRowAt: indexPath)
    }
}

extension ListViewController {
    func numberOfRenderedComments() -> Int {
        tableView.numberOfSections == 0 ? 0 : tableView.numberOfRows(inSection: commentsSection)
    }

    func commentMessage(at row: Int) -> String? {
        commentView(at: row)?.messageLabel.text
    }

    func commentDate(at row: Int) -> String? {
        commentView(at: row)?.dateLabel.text
    }

    func commentUsername(at row: Int) -> String? {
        commentView(at: row)?.usernameLabel.text
    }

    private func commentView(at row: Int) -> ImageCommentCell? {
        guard numberOfRenderedComments() > row else {
            return nil
        }
        let ds = tableView.dataSource
        let index = IndexPath(row: row, section: commentsSection)
        return ds?.tableView(tableView, cellForRowAt: index) as? ImageCommentCell
    }

    private var commentsSection: Int {
        return 0
    }
}

// MARK: - Feed specific
extension ListViewController {
    func numberOfRenderedFeedImageViews() -> Int {
        tableView.numberOfSections == 0 ? 0 : tableView.numberOfRows(inSection: feedImagesSection)
    }
    
    func feedImageView(at row: Int) -> UITableViewCell? {
        guard numberOfRenderedFeedImageViews() > row else {
            return nil
        }
        let ds = tableView.dataSource
        let index = IndexPath(row: row, section: feedImagesSection)
        return ds?.tableView(tableView, cellForRowAt: index)
    }
    
    private var feedImagesSection: Int { 0 }
    private var feedLoadMoreSection: Int { 1 }
}
