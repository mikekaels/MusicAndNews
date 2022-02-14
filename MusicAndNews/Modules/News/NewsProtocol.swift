//
//  NewsProtocol.swift
//  MusicAndNews
//
//  Created by Santo Michael Sihombing on 14/02/22.

public protocol NewsDelegate {
    func music(status: Bool)
}

protocol NewsViewToPresenterProtocol: AnyObject {
    var view: NewsPresenterToViewProtocol? { get set }
    var interactor: NewsPresenterToInteractorProtocol? { get set }
    var router: NewsPresenterToRouterProtocol? { get set }
    
    func fethcNews()
}

protocol NewsPresenterToRouterProtocol: AnyObject {
    func createModule() -> NewsVC
}

protocol NewsPresenterToViewProtocol: AnyObject {
    func didFetchNews(news: [Article])
    func didFailFetchNews(error: Error)
}

protocol NewsInteractorToPresenterProtocol: AnyObject {
    func didFetchNews(result: Result<NewsModel, Error>)
}

protocol NewsPresenterToInteractorProtocol: AnyObject {
    var presenter: NewsInteractorToPresenterProtocol? { get set }
    func fethcNews()
}
