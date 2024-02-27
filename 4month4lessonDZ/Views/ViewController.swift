//
//  ViewController.swift
//  4month4lessonDZ
//
//  Created by Apple on 22.2.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    private var products: [MyShop] = []
    
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
        
        let productDetails1 = MyShopDetails(productImage: UIImage(named: "firstScreen")!,
                                            productName: "AbocoFur Modern Velvet Fabric Lazy Chair",
                                            roomTypeDetail: "Office, Living Room",
                                            colorDetail: "Yellow",
                                            materialDetail: "Textile, Velvet, Cotton",
                                            dimensionsDettails: "25.6 x 31.5 x 37.4 inches",
                                            weightDetails: "20.3 Pounds")
        
        
        let productDetails2 = MyShopDetails(productImage: UIImage(named: "KitchenwareScreen")!,
                                            productName: "A quirky and personalized kitchen in a modern studio for work and play",
                                            roomTypeDetail: "Kitchen Room, Eating",
                                            colorDetail: "Brown",
                                            materialDetail: "Metal, Komfortobel",
                                            dimensionsDettails: "20.6 x 35.5 x 39.4 inches",
                                            weightDetails: "28.4 Pounds")
        
        let productDetails3 = MyShopDetails(productImage: UIImage(named: "readinfRoom")!,
                                            productName: "INSPIRATIONAL STUDY TABLE DESIGNS FOR STUDENTS",
                                            roomTypeDetail: "Reading room",
                                            colorDetail: "Brown, White",
                                            materialDetail: "Metal",
                                            dimensionsDettails: "29.6 x 35.",
                                            weightDetails: "20.4 Pounds")
        
        let product1 = MyShop(
            productImage:UIImage(named: "firstImage")!,
            productName: "Furniture",
            item: "785 Items",
            detail: productDetails1)
        let product2 = MyShop(
            productImage: UIImage(named: "secondImage")!,
            productName: "kitchenware",
            item: "645 Items",
            detail: productDetails2)
        let product3 = MyShop(
            productImage: UIImage(named: "thirdImage")!,
            productName: "Reading table",
            item: "Inventory",
            detail: productDetails3)
        
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
            let detailVC = DetailViewController()
            
            // Создаем продукт, который хотим передать в DetailViewController
            let product = products[indexPath.row]
            
            // Присваиваем его свойству product в DetailViewController
            detailVC.product = product
            
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    
    

