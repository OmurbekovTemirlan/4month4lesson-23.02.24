//
//  MakerView.swift
//  4month4lessonDZ
//
//  Created by Apple on 22.2.2024.
//

import UIKit

class MakerView {
    
    
    func makerLabel(text: String = "Login",
                    size: CGFloat = 18,
                    weight: UIFont.Weight = .bold,
                    textColor: UIColor = UIColor(hex: "#000000"),
                    backraundColor: UIColor = .clear,
                    textAlignment: NSTextAlignment = .left,
                    numberOfLines: Int = 0,
                    lineBreakMode: NSLineBreakMode = .byWordWrapping,
                    translatesAutoresizingMaskIntoConstraints: Bool = false
                    
                    
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: size, weight: weight)
        label.textColor = textColor
        label.backgroundColor = backraundColor
        label.numberOfLines = numberOfLines
        label.textAlignment = textAlignment
        label.lineBreakMode = lineBreakMode
        label.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        return label
    }
    
    func makerTextField(textColor: UIColor = .black,
                        placeholder: String = "Fill the field",
                        cornerRadius: CGFloat = 16,
                        backgroundColor: UIColor = .clear,
                        borderColor: CGColor = UIColor.gray.cgColor,
                        borderWidth: CGFloat = 2 ) -> UITextField {
        
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.layer.cornerRadius = cornerRadius
        tf.backgroundColor = backgroundColor
        tf.layer.borderColor  = borderColor
        tf.layer.borderWidth = borderWidth
        tf.textColor = textColor
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        tf.leftView = view
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }
    func makeButton(
        imageBtn: UIImage = UIImage(named: "") ?? UIImage(),
        title: String = "",
        for state: UIControl.State = .normal,
        fontBtn: UIFont? = UIFont.systemFont(ofSize: 16),
        colorBt: UIColor = UIColor(hex: "#000000"),
        backgroundColorBT: UIColor? = nil,
        cornerRadiusBt: CGFloat = 16,
        numberOfLines: CGFloat = 1,
        target: Any? = nil,
        action: Selector? = nil) -> UIButton{
        
        let button = UIButton(type: .system)
        button.setImage(imageBtn, for: state)
        button.setTitle(title, for: state)
        button.titleLabel?.font = fontBtn
        button.tintColor = colorBt
        button.backgroundColor = backgroundColorBT
        button.layer.cornerRadius = cornerRadiusBt
        button.titleLabel?.numberOfLines = Int(numberOfLines)
        
        if let target = target, let action = action {
            button.addTarget(target, action: action, for: .touchUpInside)
        }
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }


}
