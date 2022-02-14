//
//  MusicRouter.swift
//  MusicAndNews
//
//  Created by Santo Michael Sihombing on 14/02/22.

import UIKit

public class MusicRouter: MusicPresenterToRouterProtocol{
    public static let shared = MusicRouter()
    
    func initialize() -> MusicVC {
        return createModule()
    }
    
    func createModule() -> MusicVC {
        let view = MusicVC()
        
        let presenter: MusicViewToPresenterProtocol & MusicInteractorToPresenterProtocol = MusicPresenter()
        
        let interactor: MusicPresenterToInteractorProtocol = MusicInteractor()
        
        let router: MusicPresenterToRouterProtocol = MusicRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
