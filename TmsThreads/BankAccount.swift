//
//  BankAccount.swift
//  TmsThreads
//
//  Created by Алексей Козел on 10.01.2024.
//

import Foundation

class BankAccount {
    var balance: Int = 0
    let lock = NSLock()

    func deposit(amount: Int) {
        lock.lock()
        balance += amount
        lock.unlock()
    }

    func withdraw(amount: Int) {
        lock.lock()
        if balance >= amount {
            balance -= amount
        }
        lock.unlock()
    }
}
