//
//  TableViewCell.swift
//  4month4lessonDZ
//
//  Created by Apple on 22.2.2024.
//

import UIKit

class MyShoptableViewCell: UITableViewCell {

    private let uiView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    
    
    
    private var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "firstImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
   
    private var productName = MakerView().makerLabel(
        text: "Furniture",
        size: 20,
        weight: .bold,
        textColor: .black)
    
    private var item = MakerView().makerLabel(
    text: "785 Items",
    size: 14,
    weight: .regular,
    textColor: .systemGray)
 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    private func setupUI(){
       
        
        contentView.addSubview(uiView)
        NSLayoutConstraint.activate([
            uiView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            uiView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            uiView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            uiView.heightAnchor.constraint(equalToConstant: 220),
            uiView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

        ])
        
        uiView.addSubview(productImage)
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: uiView.topAnchor),
            productImage.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 0),
            productImage.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: -1),
            productImage.heightAnchor.constraint(equalToConstant: 166)
        ])
        
        uiView.addSubview(productName)
        
        NSLayoutConstraint.activate([
            productName.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 8),
            productName.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 17),
        ])
        
        uiView.addSubview(item)
        NSLayoutConstraint.activate([
            item.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 8),
            item.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 17)
        ])
    }
    
    func myShopProducts(image: UIImage, producName: String, itemm: String ){
        productImage.image = image
        productName.text = producName
        item.text = itemm
    }
}
