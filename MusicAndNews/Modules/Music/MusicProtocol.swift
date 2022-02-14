//
//  MusicProtocol.swift
//  MusicAndNews
//
//  Created by Santo Michael Sihombing on 14/02/22.

public protocol MusicDelegate {
    
}

protocol MusicViewToPresenterProtocol: AnyObject {
    var view: MusicPresenterToViewProtocol? { get set }
    var interactor: MusicPresenterToInteractorProtocol? { get set }
    var router: MusicPresenterToRouterProtocol? { get set }
}

protocol MusicPresenterToRouterProtocol: AnyObject {
    func createModule() -> MusicVC
}

protocol MusicPresenterToViewProtocol: AnyObject {

}

protocol MusicInteractorToPresenterProtocol: AnyObject {

}

protocol MusicPresenterToInteractorProtocol: AnyObject {
    var presenter: MusicInteractorToPresenterProtocol? { get set }

}
