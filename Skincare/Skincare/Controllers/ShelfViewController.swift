//
//  ShelfViewController.swift
//  Skincare
//
//  Created by Thais da Silva Bras on 01/12/21.
//

import UIKit

class ShelfViewController: UIViewController {
    
    @IBOutlet var productTableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var listaProdutos = ["oi", "tudo", "bem", "com", "vc", "meu", "nome", "é", "carol"]
    var searching = false
    var produtosProcurados = ["oi", "tudo", "bem", "com", "vc", "meu", "nome", "é", "carol"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        
        configureSearchController()
        updateSearchResults(for: searchController)
        scrollViewWillBeginDecelerating(productTableView)
        // Do any additional setup after loading the view.
    }
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y > 0 {
            navigationController?.navigationBar.prefersLargeTitles = true
            
            
        } else {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
    }
    private func configureSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = UIColor(named: "Rosa")
    }
    
}

extension ShelfViewController: UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTableView.dequeueReusableCell(withIdentifier: "produto", for: indexPath) as! ProductTableViewCell
        if searching {
            cell.nomeProduto.text = produtosProcurados[indexPath.row]
        } else {
            cell.nomeProduto.text = listaProdutos[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return produtosProcurados.count
        } else {
            return listaProdutos.count
        }
        

        
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            searching = true
            produtosProcurados.removeAll()
            for produto in listaProdutos {
                if produto.lowercased().contains(searchText.lowercased()) {
                    produtosProcurados.append(produto)
                    
                }
            }
        }
        else {
            searching = false
            produtosProcurados.removeAll()
            produtosProcurados = listaProdutos
            
        }
        productTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        produtosProcurados.removeAll()
        productTableView.reloadData()
        
    }
}
