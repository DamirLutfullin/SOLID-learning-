//
//  ViewController.swift
//  SOLID(learning)
//
//  Created by Дамир Лутфуллин on 11.02.2020.
//  Copyright © 2020 Damir Lutfullin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let networkDataFetcher = NetworkDataFetcher()
    
    //внешние зависимости
    let dataFetcherService = DataFetcherService()
    let dataStore = DataStorage()
    
    // элементы интрефейса
    @IBOutlet weak var myTF: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    // MARK: view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.layer.cornerRadius = myButton.frame.width / 2
        
        dataFetcherService.fetchFreeGames { (games) in
            print(games?.feed.results.first?.artistName)
        }
        dataFetcherService.fetchNewGames { (games) in
            print(games?.feed.results.first?.artistName)
        }
        dataFetcherService.fetchModels { (models) in
            print(models?.first)
        }
        
        
    }
    
    //MARK: Busieness logic
    
    // обработка имени
    func newName() {
        guard let name = myTF.text, name != "" else {
            showAlert()
            return
        }
        myLabel.text = name
        dataStore.saveNameInCache(name: name)
    }
    
    
    //MARK: User interface
    
    // предупреждение
    func showAlert() {
        let alert = UIAlertController(title: "Warning!", message: "Enter coorect name", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // действия пользователя
    @IBAction func changeName(_ sender:  Any) {
        myLabel.text = myTF.text
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        newName()
    }
}

