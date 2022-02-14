//
//  NewsInteractor.swift
//  MusicAndNews
//
//  Created by Santo Michael Sihombing on 14/02/22.

class NewsInteractor: NewsPresenterToInteractorProtocol {
    weak var presenter: NewsInteractorToPresenterProtocol?
}

extension NewsInteractor {
    func fethcNews() {
        APIManager.shared.fetchNews { result in
            self.presenter?.didFetchNews(result: result)
        }
    }
}
