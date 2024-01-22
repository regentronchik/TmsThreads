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
        let queue = DispatchQueue(label: "com.homework.BankOperations", attributes: .concurrent)
        
        DispatchQueue.concurrentPerform(iterations: 10) { i in
            if i % 2 == 0 {
                account.deposit(amount: 100)
                print("Пополнение.Баланс счета: \(account.balance)")
            } else {
                account.withdraw(amount: 50)
                print("Снятие.Баланс счета: \(account.balance)")
            }
        }
        queue.sync(flags: .barrier) {}
        print("Финальный баланс: \(account.balance)")
    }
}
