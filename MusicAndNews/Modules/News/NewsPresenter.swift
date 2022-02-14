//
//  NewsPresenter.swift
//  MusicAndNews
//
//  Created by Santo Michael Sihombing on 14/02/22.

class NewsPresenter: NewsViewToPresenterProtocol {
    weak var view: NewsPresenterToViewProtocol?
    var router: NewsPresenterToRouterProtocol?
    var interactor: NewsPresenterToInteractorProtocol?
    
    func fethcNews() {
        interactor?.fethcNews()
    }
}

extension NewsPresenter: NewsInteractorToPresenterProtocol {
    func didFetchNews(result: Result<NewsModel, Error>) {
        switch result {
        case .success(let news):
            view?.didFetchNews(news: news.articles)
        case .failure(let err):
            view?.didFailFetchNews(error: err)
        }
    }
}
