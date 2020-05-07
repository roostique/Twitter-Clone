//
//  LoginController.swift
//  Twitter
//
//  Created by Rustem Supayev on 06/05/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    private let logoImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "TwitterLogo")
        return iv
    }()
    
    private lazy var emailContainerView: UIView = {
       let image = #imageLiteral(resourceName: "mail")
        let view = Utilities().inputContainerView(withImage: image, textField: emailTextField)
        
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
       let image = #imageLiteral(resourceName: "lock")
        let view = Utilities().inputContainerView(withImage: image, textField: passwordTextField)
       
       return view
    }()
    
    private let emailTextField: UITextField = {
        let txt = Utilities().textField(withPlaceholder: "Email")
        return txt
    }()
    
    private let passwordTextField: UITextField = {
        let txt = Utilities().textField(withPlaceholder: "Password")
        txt.isSecureTextEntry = true
           return txt
       }()
    
    private let loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 5
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.setTitle("Log In", for: .normal)
        btn.setTitleColor(.twitterBlue, for: .normal)
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return btn
    }()
    
    private let dontHaveAccButton: UIButton = {
        let btn = Utilities().attributedButton("Don`t have an account?", " Sign Up")
        btn.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    @objc func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        AuthService.shared.logInUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Error logging in \(error.localizedDescription)")
                return
            }
            
            guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow}) else { return }
            guard let tab = window.rootViewController as? MainTabController else { return }
            
            tab.authenticateUserConfigureUI()
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func handleShowSignUp() {
        let controller = SignUpController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        
        [logoImageView].forEach { view.addSubview($0) }
        
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor,
                     right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccButton)
        dontHaveAccButton.anchor(left: view.leftAnchor,
                                 bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,paddingLeft: 40,
                                 paddingRight: 40)
    }
}
