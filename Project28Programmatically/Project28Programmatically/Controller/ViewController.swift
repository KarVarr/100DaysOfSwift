//
//  ViewController.swift
//  Project28Programmatically
//
//  Created by Karen Vardanian on 08.05.2023.
//
import LocalAuthentication
import UIKit

class ViewController: UIViewController {
    
    let button = Button()
    let textView = TextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addView()
        setting()
        layout()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(saveSecretMessage), name: UIApplication.willResignActiveNotification, object: nil)
        
        button.customButton.addTarget(self, action: #selector(unlockTappedButton), for: .touchUpInside)
    }
    
    func addView() {
        view.addSubview(button.customButton)
        view.addSubview(textView.customTextView)
    }
    
    func setting() {
        view.backgroundColor = .white
        
        title = "Nothing to see here"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        textView.customTextView.text = "hekko"
        textView.customTextView.isHidden = true
    
    }
    
    func layout() {
        let tView = textView.customTextView
        let btn = button.customButton
        
        NSLayoutConstraint.activate([
            tView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btn.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.customTextView.contentInset = .zero
        } else {
            textView.customTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }
        
        textView.customTextView.scrollIndicatorInsets = textView.customTextView.contentInset
        
        let selectedRange = textView.customTextView.selectedRange
        textView.customTextView.scrollRangeToVisible(selectedRange)
    }
    
    func unlockSecretMessage() {
        textView.customTextView.isHidden = false
        title = "Secret stuff!"
        
        textView.customTextView.text = KeychainWrapper.standard.string(forKey: "SecretMessage") ?? ""
        //Challenge 1
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
    }
    
    @objc func saveSecretMessage() {
        guard textView.customTextView.isHidden == false else { return }
        
        
        KeychainWrapper.standard.set(textView.customTextView.text, forKey: "SecretMessage")
        textView.customTextView.resignFirstResponder()
        textView.customTextView.isHidden = true
        navigationItem.rightBarButtonItem = nil
        title = "Nothing to see here"
    }
    
    @objc func unlockTappedButton() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [weak self] success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self?.unlockSecretMessage()
                    } else {
                        let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self?.present(ac, animated: true)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Biometry unavailable", message: "Your device is not configured for biometric authentication.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
    
    
    @objc func doneButtonTapped() {
        saveSecretMessage()
    }
    
}

