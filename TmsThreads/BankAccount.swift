//
//  BankAccount.swift
//  TmsThreads
//
//  Created by Алексей Козел on 10.01.2024.
//

import Foundation

class BankAccount {
    var balance: Int = 0
    let concurrentQueue = DispatchQueue(label: "com.homework.bankAccount", attributes: .concurrent)
    
    func deposit(amount: Int) {
        concurrentQueue.async(flags: .barrier) {
            self.balance += amount
        }
    }
    
    func withdraw(amount: Int) {
        concurrentQueue.async(flags: .barrier) {
            if self.balance >= amount {
                self.balance -= amount
            } else {
                print("Недостаточно средств")
            }
        }
    }
}
