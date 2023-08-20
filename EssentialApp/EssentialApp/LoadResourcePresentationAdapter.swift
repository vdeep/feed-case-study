//
//  LoadResourcePresentationAdapter.swift
//  EssentialFeediOS
//
//  Created by Vishal on 24/07/23.
//

import Combine
import EssentialFeed
import EssentialFeediOS

final class LoadResourcePresentationAdapter<Resource, View: ResourceView> {
    private let loader: () -> AnyPublisher<Resource, Error>
    private var cancellable: Cancellable?
    var presenter: LoadResourcePresenter<Resource, View>?

    init(loader: @escaping () -> AnyPublisher<Resource, Error>) {
        self.loader = loader
    }
    
    func loadResource() {
        presenter?.didStartLoading()

        cancellable = loader()
            .dispatchOnMainQueue()
            .sink { [weak self] completion in
                switch completion {
                case .finished: break

                case let .failure(error):
                    self?.presenter?.didFinishLoading(with: error)
                }
            } receiveValue: { [weak self] resource in
                self?.presenter?.didFinishLoading(with: resource)
            }
    }
}

// MARK: - FeedViewControllerDelegate
extension LoadResourcePresentationAdapter: FeedViewControllerDelegate {

    func didRequestFeedRefresh() {
        loadResource()
    }

}

// MARK: - FeedImageCellControllerDelegate
extension LoadResourcePresentationAdapter: FeedImageCellControllerDelegate {

    func didRequestImage() {
        loadResource()
    }

    func didCancelImageRequest() {
        cancellable?.cancel()
        cancellable = nil
    }

}
