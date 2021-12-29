//
//  CharacterListViewController.swift
//  RickAndMortyMVVM
//
//  Created by Sinan Kulen on 27.12.2021.
//

import UIKit
import RickAndMortyMVVMAPI

final class CharacterListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel : CharacterListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    private var characterList : [CharacterPresentation] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
}

extension CharacterListViewController : CharacterListViewModelDelegate {
    
    func handleViewModelOutput(_ output: CharacterListViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .showCharacterList(let characterList):
            self.characterList = characterList
            tableView.reloadData()
        }
    }
    func navigate(to route: CharacterListViewRoute) {
        switch route {
        case .detail(let viewModel):
            let viewController = CharacterDetailBuilder.make(with: viewModel)
            show(viewController, sender: nil)
        }
    }
}

extension CharacterListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterListTableViewCell", for: indexPath) as! CharacterListTableViewCell
        let character = characterList[indexPath.row]
        cell.nameLabel.text = character.name
        cell.statusLabel.text = character.status
        cell.speciesLabel.text = character.species
        let url = URL(string: character.image)!
        let data = try? Data(contentsOf: url)
        cell.tableImageView.image = UIImage(data: data!)
        return cell
    }
    
        
    }
    
extension CharacterListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.selectCharacter(at: indexPath.row)
    }
}
