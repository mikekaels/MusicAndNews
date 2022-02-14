//
//  NewsRouter.swift
//  MusicAndNews
//
//  Created by Santo Michael Sihombing on 14/02/22.

import UIKit

public class NewsRouter: NewsPresenterToRouterProtocol{
    public static let shared = NewsRouter()
    
    func initialize() -> NewsVC {
        return createModule()
    }
    
    func createModule() -> NewsVC {
        let view = NewsVC()
        
        let presenter: NewsViewToPresenterProtocol & NewsInteractorToPresenterProtocol = NewsPresenter()
        
        let interactor: NewsPresenterToInteractorProtocol = NewsInteractor()
        
        let router: NewsPresenterToRouterProtocol = NewsRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
