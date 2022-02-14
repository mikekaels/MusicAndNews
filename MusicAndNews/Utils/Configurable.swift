//
//  Configurable.swift
//  MusicAndNews
//
//  Created by Santo Michael Sihombing on 14/02/22.
//

import Foundation

protocol Configurable {}
extension Configurable {
    @discardableResult
    func configure(completion: (Self) -> Void) -> Self {
        completion(self)
        return self
    }
}

extension NSObject: Configurable {}
