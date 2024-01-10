//
//  ViewController.swift
//  TmsThreads
//
//  Created by Алексей Козел on 10.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let account = BankAccount()
        let queue = DispatchQueue(label: "BankOperations", attributes: .concurrent)
        for i in 1...10 {
            queue.async {
                account.deposit(amount: 100)
                print("Thread \(i) - Deposit: balance = \(account.balance)")
            }

            queue.async{
                account.withdraw(amount: 50)
                print("Thread \(i) - Withdraw: balance = \(account.balance)")
            }
        }
        queue.sync(flags: .barrier) {}
        print("Final balance: \(account.balance)")
    }
}

