//
//  HomeViewController.swift
//  Mvvm_Project_Template
//
//  Created by Osman Yesil on 22.12.2022.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject { // Bu protokol'ün sadece class'lara impelement'e edilmesini sağlıyoruz.
    func configureVC()
}

final class HomeViewController: UIViewController {
    
    private let viewModal = HomeViewModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModal.delegate = self
        viewModal.viewDidLoad()
    }
    
}

extension HomeViewController: HomeViewControllerProtocol {
    func configureVC() {
        view.backgroundColor = .systemPink
    }
    
    
}

/**
 ------------------
 Protocol'e neden AnyObject verdik ?
 Protocol delegate'ini class'lar haricinde struct lara'da uygulayabiliriz. Fakat class'lara uygulandığında classlarımız deInıt olmaması nedeniyle Retain cycle'a takılıyor.
 bu sebeple protocol'ümüzün delegate'ini weak yani gevşek referans'da tutmamız gerkeiyor weak parametreside sadece class'lara uygulanmaktadır.
 Protocolümüe ": AnyObject" property sini veriyoruz ve delegate'imizi weak' olarak tanmlıyoruz. ARC'a takılmıyoruz
 
 struct SomeStruct: HomeViewControllerProtocol { //AnyObject olduğu için bu protocol struct lara uygulanamaz
 }
 
 protocol HomeViewControllerProtocol: AnyObject { // Bu protokol'ün sadece class'lara impelement'e edilmesini sağlıyoruz.
 }
 
 weak var delegate: HomeViewControllerProtocol?
--------------
 
 */
