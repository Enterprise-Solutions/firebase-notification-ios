//
//  RespuestaController.swift
//  Firebase Notifications
//
//  Created by Jorge Casariego on 8/30/19.
//  Copyright © 2019 Jorge Casariego. All rights reserved.
//

import UIKit
import SDWebImage

class RespuestaController: UIViewController {
    
    var alerta: Alerta? {
        didSet {
            if let alerta = alerta {
                tituloTextView.text = alerta.title
                mensajeTextView.text = alerta.body
                promocionImageView.sd_setImage(with: URL(string: alerta.imageUrl ?? ""))
            }
        }
    }
    
    let tituloTextView: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    let mensajeTextView: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    let promocionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(tituloTextView)
        view.addSubview(mensajeTextView)
        view.addSubview(promocionImageView)
        
        tituloTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        tituloTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        tituloTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        tituloTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        mensajeTextView.topAnchor.constraint(equalTo: tituloTextView.bottomAnchor, constant: 10).isActive = true
        mensajeTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        mensajeTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        mensajeTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        promocionImageView.topAnchor.constraint(equalTo: mensajeTextView.bottomAnchor, constant: 10).isActive = true
        promocionImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        promocionImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        promocionImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    
}
