//
//  MusicPresenter.swift
//  MusicAndNews
//
//  Created by Santo Michael Sihombing on 14/02/22.

class MusicPresenter: MusicViewToPresenterProtocol {
    weak var view: MusicPresenterToViewProtocol?
    var router: MusicPresenterToRouterProtocol?
    var interactor: MusicPresenterToInteractorProtocol?
    
    
}

extension MusicPresenter: MusicInteractorToPresenterProtocol {

}
