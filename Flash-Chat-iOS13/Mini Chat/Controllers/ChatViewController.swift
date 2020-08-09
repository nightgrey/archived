//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let database : Firestore = Firestore.firestore()
    var messageCollectionListener: ListenerRegistration?
    var messages: [Message] = []
    
    let alert = UIAlertController.init(title: "Error", message: "Computer says no.", preferredStyle: .alert)
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTextfield.delegate = self

        navigationItem.hidesBackButton = true
        navigationItem.title = Constants.appName

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        
        dateFormatter.dateStyle = .medium
        alert.addAction(UIAlertAction(title: "OK", style: .default))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadMessages()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        messageCollectionListener?.remove()
    }

    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let error as NSError  {
            self.alert.message = error.localizedDescription
            self.present(self.alert, animated: true)
        }
    }
}

// MARK: Loading messages
extension ChatViewController {
    func loadMessages() {
        messageCollectionListener = database.collection(Constants.Firestore.messageCollection).order(by: Constants.Firestore.dateField).addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                print(error)
                self.alert.message = error.localizedDescription
                self.present(self.alert, animated: true)
            } else {
                self.messages = []
                
                for document in querySnapshot!.documents {
                    if let sender = document.data()[Constants.Firestore.senderField] as? String,
                    let body = document.data()[Constants.Firestore.bodyField] as? String,
                    let date = document.data()[Constants.Firestore.dateField] as? Timestamp {
                        self.messages.append(
                            Message(sender: sender, body: body, date: date.dateValue())
                        )
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            let lastMessage = IndexPath(row: self.messages.count - 1, section: 0)
                            self.tableView.scrollToRow(at: lastMessage, at: .top, animated: true)
                        }
                    }
                }
            }
        }
    }
}

// MARK: UITableView
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        
        cell.bodyLabel?.text = message.body
        cell.dateLabel?.text = self.dateFormatter.string(from: message.date)
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.youAvatar.isHidden = true
            cell.meAvatar.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: Constants.Colors.primary)
            cell.dateLabel.textAlignment = .left
        } else {
            cell.meAvatar.isHidden = true
            cell.youAvatar.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: Constants.Colors.secondary)
            cell.dateLabel.textAlignment = .right
        }

        return cell
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: UITextField
extension ChatViewController: UITextFieldDelegate {
    func sendMessage() {
        if (messageTextfield.text!.isEmpty) {
            return
        }

        if let body = messageTextfield.text, let sender = Auth.auth().currentUser?.email {
            database.collection(Constants.Firestore.messageCollection).addDocument(data: [
                Constants.Firestore.senderField: sender,
                Constants.Firestore.bodyField: body,
                Constants.Firestore.dateField: Date()
            ]) { (error) in
                if let error = error {
                    self.alert.message = error.localizedDescription
                }
                
                DispatchQueue.main.async {
                    self.messageTextfield.text = ""
                }
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        sendMessage()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        messageTextfield.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if !textField.text!.isEmpty {
            textField.endEditing(true)
            return true
        } else {
            return false
        }
    }

}
