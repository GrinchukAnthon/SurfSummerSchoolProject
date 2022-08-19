//
//  BaseTokenStorage.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 18.08.2022.
//

import Foundation

struct BaseTokenStorage: TokenStorage {
    
//    MARK: - Nested Types
    
    private enum Constants {
        static let applicationNameInKeyChain = "com.surf.aducation.project"
        static let tokenKey = "token"
        static let tokenDateKey = "tokenDate"
    }
    
//    MARK: - Private Properties
    
    private var unprotectedStorage: UserDefaults {
        UserDefaults.standard
    }
        
//    MARK: - TokenStorage
    
    func getToken() throws -> TokenContainer {
        let queryDictionaryForSavingToken: [CFString: AnyObject] = [
            kSecAttrService: Constants.applicationNameInKeyChain as AnyObject,
            kSecAttrAccount: Constants.tokenKey as AnyObject,
            kSecClass: kSecClassGenericPassword,
            kSecMatchLimit: kSecMatchLimitOne,
            kSecReturnData: kCFBooleanTrue
        ]
        var tokenInResult: AnyObject?
        let status  = SecItemCopyMatching(queryDictionaryForSavingToken as CFDictionary, &tokenInResult)
        
        try throwErrorFromStatusIfNeeded(status)
        
        guard let data = tokenInResult as? Data else {
            throw Error.tokenWasNotFoundInKeyChainOrCantRepresentAsData
        }
        let retrivingToken = try JSONDecoder().decode(String.self, from: data)
        let tokenSavingDate = try getSavingTokenDate()
                
        return TokenContainer(token: retrivingToken, receivingDate: tokenSavingDate)
    }
    func set(newToken: TokenContainer) throws {
        try removeTokenFromConteiner()
        
        let tokenInData = try JSONEncoder().encode(newToken.token)
        let queryDictionaryForSavingToken: [CFString: AnyObject] = [
            kSecAttrService: Constants.applicationNameInKeyChain as AnyObject,
            kSecAttrAccount: Constants.tokenKey as AnyObject,
            kSecClass: kSecClassGenericPassword,
            kSecValueData: tokenInData as AnyObject
        ]
        let status = SecItemAdd(queryDictionaryForSavingToken as CFDictionary, nil)
        try throwErrorFromStatusIfNeeded(status)
        saveTokenSavingDate(.now)
    }
    
    func removeTokenFromConteiner() throws {
        let queryDictionaryForDeliteToken: [CFString: AnyObject] = [
            kSecAttrService: Constants.applicationNameInKeyChain as AnyObject,
            kSecAttrAccount: Constants.tokenKey as AnyObject,
            kSecClass: kSecClassGenericPassword,
        ]
        let status = SecItemDelete(queryDictionaryForDeliteToken as CFDictionary)
        try throwErrorFromStatusIfNeeded(status)
        removeTokenSavingDate()
    }
}

private extension BaseTokenStorage {
    
    enum Error: Swift.Error {
        case unknownError(status: OSStatus)
        case keyIsAlredyInKeyChain
        case tokenWasNotFoundInKeyChainOrCantRepresentAsData
        case tokenDateWasNotFound
    }
    func getSavingTokenDate() throws -> Date {
        guard let savingDate = unprotectedStorage.value(forKey: Constants.tokenDateKey) as? Date else {
            throw Error.tokenDateWasNotFound
        }
        return savingDate
    }
    func saveTokenSavingDate(_ newDate: Date) {
        unprotectedStorage.set(newDate, forKey: Constants.tokenDateKey)
    }
    func removeTokenSavingDate() {
        unprotectedStorage.set(nil, forKey: Constants.tokenDateKey)
    }
    func throwErrorFromStatusIfNeeded(_ status: OSStatus) throws {
        guard status == errSecSuccess || status == -25300 else {
            throw Error.unknownError(status: status)
        }
        guard status != -25299 else {
            throw Error.keyIsAlredyInKeyChain
        }
    }
}
