//
//  ViewController.swift
//  4month4lessonDZ
//
//  Created by Apple on 22.2.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    private var products: [myShop] = []
    
    
    private var tableView: UITableView = {
        let view = UITableView()
        view.separatorStyle = .singleLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupUI()
        setupProduct()
        
    }
    
    private func setupUI(){
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.heightAnchor.constraint(equalToConstant: 220),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.register(MyShoptableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
    }
    
    private func setupProduct(){
        let product1 = myShop(
            productImage:UIImage(named: "firstImage")!,
            productName: "Furniture",
            item: "785 Items")
        let product2 = myShop(
            productImage: UIImage(named: "secondImage")!,
            productName: "kitchenware",
            item: "645 Items")
        let product3 = myShop(
            productImage: UIImage(named: "thirdImage")!,
            productName: "Reading table",
            item: "Inventory")
        
        products = [product1, product2, product3]
    }
    
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyShoptableViewCell
        
        let product = products[indexPath.row]
        
        cell.myShopProducts(image: product.productImage, producName: product.productName, itemm: product.item)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("temirlan")
    }
}
