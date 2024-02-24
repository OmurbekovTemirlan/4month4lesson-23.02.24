//
//  DetailViewController.swift
//  4month4lessonDZ
//
//  Created by Apple on 23.2.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailProduct: myShopDetails?
    var valuePrice: Float = 0.0
    var numberlblValue: Int = 0
    var isLiked = false
    
    
//    private let backBtn: UIButton = {
//        let btn = UIButton()
//        btn.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
//        btn.backgroundColor = .white
//        btn.layer.cornerRadius = 17
//        btn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpOutside)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//        
//    }()
    
    private let shareBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 17
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
        
    }()
    
    private lazy var likeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: isLiked ? "heart.fill" : "heart"), for: .normal)
        btn.tintColor = isLiked ? .red : .black
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 17
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(likeBtnTapped(_:)), for: .touchUpInside)
        return btn
    }()

    
    var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "firstScreen")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var productName = MakerView().makerLabel(
        text: "AbocoFur Modern Velvet Fabric Lazy Chair",
        size: 22,
        weight: .semibold,
        textColor: .black,
        numberOfLines: 2)
    
    


    
    
    var price = MakerView().makerLabel(
        text: "$000",size: 20,
        weight: .bold,
        textColor: .systemBlue)
    
    
    
    private let horizontalStac: UIStackView = {
        let staq = UIStackView()
        staq.backgroundColor = .white
        staq.distribution = .fillProportionally
        staq.axis = .horizontal
        staq.alignment = .center
        staq.spacing = 5
        staq.translatesAutoresizingMaskIntoConstraints = false
        return staq
    }()
    
    
    
    
    lazy var plusBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "plus"), for: .normal)
        btn.addTarget(self, action: #selector(plusBtnTapedd), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
        
    }()
    
    
    lazy var numberlbl = MakerView().makerLabel(text: "0", size: 23, weight: .regular, textAlignment: .center)
    
    
    lazy var minusBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "minus"), for: .normal)
        btn.addTarget(self, action: #selector(minusBtnTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
        
    }()
    
    
    
    var productDetail = MakerView().makerLabel(
        text: "Product Details",
        size: 20,
        weight: .semibold,
        numberOfLines: 1)
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var roomType = MakerView().makerLabel(text: "RoomType", size: 15, weight: .regular, textColor: .systemGray2)
    var color = MakerView().makerLabel(text: "Color", size: 15, weight: .regular, textColor: .systemGray2)
    var material = MakerView().makerLabel(text: "Material", size: 15, weight: .regular, textColor: .systemGray2)
    var dimensions = MakerView().makerLabel(text: "Dimensions", size: 15, weight: .regular, textColor: .systemGray2)
    var weight = MakerView().makerLabel(text: "Weight", size: 15, weight: .regular, textColor: .systemGray2)
    
    private let verticalDetailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var roomTypeDetail = MakerView().makerLabel(text: "Office, Living Room", size: 15, weight: .regular, textColor: .black)
    var colorDetail = MakerView().makerLabel(text: "Yellow", size: 15, weight: .regular, textColor: .black)
    var materialDetail = MakerView().makerLabel(text: "Textile, Velvet, Cotton", size: 15, weight: .regular, textColor: .black)
    var dimensionsDettails = MakerView().makerLabel(text: "25.6 x 31.5 x 37.4 inches", size: 15, weight: .regular, textColor: .black)
    var weightDetails = MakerView().makerLabel(text: "20.3 Pounds", size: 15, weight: .regular, textColor: .black)
    
    
    private let buyBtn = MakerView().makeButton(title: "Buy",
                                                fontBtn: .boldSystemFont(ofSize: 17),
                                                colorBt: .white,
                                                backgroundColorBT: UIColor.systemBlue,
                                                cornerRadiusBt: 12 )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        

        
        setupUI()
        staqPlusAndMinus()
        productDetailsSetupUI()
        buyBtnSetupUI()
        updatePriceLabel()
        updateUI()

        navigationItem.hidesBackButton

    }
    
    private func setupUI(){
        
        
        view.addSubview(productImage)

        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            productImage.heightAnchor.constraint(equalToConstant: 375)
        ])
        
        
        view.addSubview(likeBtn)
        view.bringSubviewToFront(likeBtn)
        NSLayoutConstraint.activate([
            likeBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            likeBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            likeBtn.heightAnchor.constraint(equalToConstant: 36),
            likeBtn.widthAnchor.constraint(equalToConstant: 36)
        ])
        
//        view.addSubview(backBtn)
//        view.bringSubviewToFront(backBtn)
//
//        NSLayoutConstraint.activate([
//            backBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
//            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
//            backBtn.heightAnchor.constraint(equalToConstant: 36),
//            backBtn.widthAnchor.constraint(equalToConstant: 36)
//        ])

        view.addSubview(shareBtn)
        view.bringSubviewToFront(shareBtn)

        NSLayoutConstraint.activate([
            shareBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            shareBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -85),
            shareBtn.heightAnchor.constraint(equalToConstant: 36),
            shareBtn.widthAnchor.constraint(equalToConstant: 36)
        ])
        
        
        
        view.addSubview(productName)
        
        NSLayoutConstraint.activate([
            productName.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 15),
            productName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            productName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            
        ])
        
        view.addSubview(price)
        
        NSLayoutConstraint.activate([
            price.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 35),
            price.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    
    
    
    
    private func staqPlusAndMinus(){
        view.addSubview(horizontalStac)
        NSLayoutConstraint.activate([
            horizontalStac.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 30),
            horizontalStac.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            horizontalStac.heightAnchor.constraint(equalToConstant: 32),
            horizontalStac.widthAnchor.constraint(equalToConstant: 117)
        ])
        
        horizontalStac.addArrangedSubview(plusBtn)
        NSLayoutConstraint.activate([
            plusBtn.heightAnchor.constraint(equalToConstant: 30),
            plusBtn.widthAnchor.constraint(equalToConstant: 30)
        ])
        horizontalStac.addArrangedSubview(numberlbl)
        
        
        horizontalStac.addArrangedSubview(minusBtn)
        NSLayoutConstraint.activate([
            minusBtn.heightAnchor.constraint(equalToConstant: 30),
            minusBtn.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    
    
    private func productDetailsSetupUI(){
        view.addSubview(productDetail)
        NSLayoutConstraint.activate([
            productDetail.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 27),
            productDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        view.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(roomType)
        verticalStackView.addArrangedSubview(color)
        verticalStackView.addArrangedSubview(material)
        verticalStackView.addArrangedSubview(dimensions)
        verticalStackView.addArrangedSubview(weight)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: productDetail.bottomAnchor, constant: 10),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            verticalStackView.heightAnchor.constraint(equalToConstant: 130),
            verticalStackView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        view.addSubview(verticalDetailsStackView)
        
        verticalDetailsStackView.addArrangedSubview(roomTypeDetail)
        verticalDetailsStackView.addArrangedSubview(colorDetail)
        verticalDetailsStackView.addArrangedSubview(materialDetail)
        verticalDetailsStackView.addArrangedSubview(dimensionsDettails)
        verticalDetailsStackView.addArrangedSubview(weightDetails)
        
        NSLayoutConstraint.activate([
            verticalDetailsStackView.topAnchor.constraint(equalTo: productDetail.bottomAnchor, constant: 10),
            verticalDetailsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            verticalDetailsStackView.heightAnchor.constraint(equalToConstant: 130),
            verticalDetailsStackView.widthAnchor.constraint(equalToConstant: 226)
        ])
    }
    private func buyBtnSetupUI(){
       
        view.addSubview(buyBtn)
        NSLayoutConstraint.activate([
            buyBtn.topAnchor.constraint(equalTo: verticalDetailsStackView.bottomAnchor, constant: 35),
            buyBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buyBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buyBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    @objc private func likeBtnTapped(_ sender: UIButton) {
        isLiked.toggle()
        updateUI()
    }
    private func updateUI() {
        let imageName = isLiked ? "heart.fill" : "heart"
        let tintColor = isLiked ? UIColor.red : UIColor.black
        
        likeBtn.setImage(UIImage(systemName: imageName), for: .normal)
        likeBtn.tintColor = tintColor
        
    }
    
    
//        @objc private func backBtnTapped (_ sender: UIButton) {
//            navigationController?.popViewController(animated: true)
//        }
    

    
    
    private func updatePriceLabel() {
        price.text = "\(String(format: "%.0f", valuePrice))$"
        numberlbl.text = "\(numberlblValue)"
    }
    @objc private func plusBtnTapedd(_ sender: UIButton){
        valuePrice += 130
        numberlblValue += 1
        updatePriceLabel()
    }
    
    @objc private func minusBtnTapped(_ sender: UIButton){
        if valuePrice > 0.0, numberlblValue > 0 {
             valuePrice -= 130
            numberlblValue -= 1
            updatePriceLabel()
        }
    }
    func myShopProductDetails(image: UIImage,
                              producName: String,
                              romTypeDetail: String,
                              colorrDetail: String,
                              materiallDetail: String,
                              dimensionssDettails: String,
                              weighttDetails: String ){
        productImage.image = image
        productName.text = producName
        roomTypeDetail.text = romTypeDetail
        colorDetail.text = colorrDetail
        materialDetail.text = materiallDetail
        dimensionsDettails.text = dimensionssDettails
        weightDetails.text = weighttDetails
    }
}


