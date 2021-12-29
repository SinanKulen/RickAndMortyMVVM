//
//  CharacterDetailViewController.swift
//  RickAndMortyMVVM
//
//  Created by Sinan Kulen on 27.12.2021.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet  weak var nameLabel: UILabel!
    @IBOutlet  weak var originLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
   
    var viewModel: CharacterDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        viewModel.load()
    }
}

extension CharacterDetailViewController: CharacterDetailViewModelDelegate {
    func showDetail(_ presentation: CharacterDetailPresentation) {
        nameLabel.text = presentation.name
        statusLabel.text = presentation.status
        originLabel.text = presentation.origin
        speciesLabel.text = presentation.species
        genderLabel.text = presentation.gender
        let url = URL(string: presentation.image)!
        let data = try? Data(contentsOf: url)
        imageView.image = UIImage(data: data!)
    }
    
    
}
