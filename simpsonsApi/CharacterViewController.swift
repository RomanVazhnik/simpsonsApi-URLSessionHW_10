//
//  CharacterViewController.swift
//  simpsonsApi
//
//  Created by Роман Важник on 22/08/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet var quote: UILabel!
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterName: UILabel!
    
    @IBOutlet var imageActivity: UIActivityIndicatorView!
    
    @IBOutlet var showButton: UIButton!
    
    let url = "https://thesimpsonsquoteapi.glitch.me/quotes"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        quote.text = ""
        characterName.text = ""
        
//        quote.isHidden = true
//        characterName.isHidden = true
        
        showButtonSetup()
        fetchData()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        imageActivity.startAnimating()
        imageActivity.hidesWhenStopped = true
        
    }
    
    @IBAction func nextCharacterButton() {
        imageActivity.isHidden = false
        imageActivity.startAnimating()
        fetchData()
    }
    
    private func fetchData() {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            
            guard let data = data else { return }
            print("data: \(data)")
            
            do {
                let result = try JSONDecoder().decode([Character].self, from: data)
                
                guard let image = result.first?.image,
                let urlImage = URL(string: image),
                let characterImageData = try? Data(contentsOf: urlImage) else { return }
                
                DispatchQueue.main.async {
                    self.quote.text = result.first?.quote
                    self.characterName.text = result.first?.character 
                    self.characterImage.image = UIImage(data: characterImageData)
                    self.imageActivity.stopAnimating()
                }
            } catch let error {
                print("Error: \(error)")
            }
        }.resume()
    }
    
    private func showButtonSetup() {
        showButton.layer.cornerRadius = 15
        showButton.layer.borderWidth = 6
        showButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
    }
    
    
}
