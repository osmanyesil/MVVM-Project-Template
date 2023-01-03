//
//  HomeViewModal.swift
//  Mvvm_Project_Template
//
//  Created by Osman Yesil on 26.12.2022.
//

import Foundation

//Fonksiyonlarımızın hepsini protocol aracılığı ile Controller'ımıza veriyoruz.
protocol HomeViewModelProtocol {
    var delegate: HomeViewControllerProtocol? { get set }
    
    func viewDidLoad()
}

final class HomeViewModal {
    weak var delegate: HomeViewControllerProtocol?
}

extension HomeViewModal: HomeViewModelProtocol {
    func viewDidLoad() {
        delegate?.configureVC()
    }
    
}

/**
 
 extension ların içine Stored Procedurs ler eklenemez Computed Propertyler eklenebilir.
 */
