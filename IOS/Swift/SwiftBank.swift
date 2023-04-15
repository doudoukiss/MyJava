struct BankAccount {
    
    // Static Properties
    
    static let depositBonusRate = 0.01
    
    // Private Properties
    
    private var balance: Double = 0 {
        didSet {
            if balance < 100 {
                displayLowBalanceMessage()
            }
        }
    }
    
    private let password: String
    
    // Initializers
        
    init(initialDeposit: Double, password: String) {
        self.password = password
        makeDeposit(ofAmount: initialDeposit)
    }
    
    // Internal Methods
    
    mutating func makeDeposit(ofAmount depositAmount: Double) {
        let depositWithBonus = finalDepositWithBonus(fromInitialDeposit: depositAmount)
        print("Making a $\(depositWithBonus) deposit")
        self.balance += depositWithBonus
    }
    
    mutating func makeWithdrawal(ofAmount withdrawalAmount: Double, usingPassword password: String) {
        if !isValid(password) {
            print("Error: Invalid password. Cannot make withdrawal.")
            return
        }
        print("Making a $\(withdrawalAmount) withdrawal.")
        self.balance -= withdrawalAmount
    }
    
    func displayBalance(usingPassword password: String) {
        if !isValid(password) {
            print("Error: Invalid password. Cannot retrieve balance.")
            return
        }
        print("Your current balance is $\(balance).")
    }
    
    // Private Methods
 
    private func finalDepositWithBonus(fromInitialDeposit deposit: Double) -> Double {
        return deposit + (deposit * BankAccount.depositBonusRate)
    }
    
    private func isValid(_ enteredPassword: String) -> Bool {
        return password == enteredPassword
    }
    
    private func displayLowBalanceMessage() {
        print("Alert: Your balance is under $100.")
    }
}
 
var myAccount = BankAccount(initialDeposit: 500, password: "Satoshi")
myAccount.makeDeposit(ofAmount: 50)
myAccount.displayBalance(usingPassword: "Satoshi")
myAccount.makeWithdrawal(ofAmount: 500, usingPassword: "Craig")
myAccount.makeWithdrawal(ofAmount: 500, usingPassword: "Satoshi")
myAccount.displayBalance(usingPassword: "Satoshi")
myAccount.makeDeposit(ofAmount: 100)
myAccount.displayBalance(usingPassword: "Satoshi")