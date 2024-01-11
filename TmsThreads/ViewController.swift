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
        for _ in 1...10 {
            let thread1 = Thread {
                account.deposit(amount: 100)
                print("Thread 1 - Deposit: balance = \(account.balance)")
            }
            let thread2 = Thread {
                account.withdraw(amount: 50)
                print("Thread 2 - Withdraw: balance = \(account.balance)")
            }
            thread1.start()
            thread2.start()
        }
    }
}
