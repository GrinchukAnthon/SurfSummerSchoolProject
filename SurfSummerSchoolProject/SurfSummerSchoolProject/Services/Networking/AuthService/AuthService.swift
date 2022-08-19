//
//  AuthService.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 18.08.2022.
//

import Foundation

struct AuthService {
    
    let dataTask = BaseNetworkTask<AuthRequestModel, AuthResponseModel>(
        isNeedInjectToken: false,
        method: .post,
        path: "auth/login")
    
    func performLoginRequestAndSaveToken(
        _ credentials: AuthRequestModel,
        _ onResponseWasReceived: @escaping (_ result: Result<AuthResponseModel, Error>) -> Void
    ) {
        dataTask.performRequest(credentials) { result in
            if case let .success(responseModel) = result {
                do {
                    try dataTask.tokenStorage.set(newToken: TokenContainer(
                        token: responseModel.token,
                        receivingDate: .now)
                    )
                } catch {
                    print(error)
                }
            }
            onResponseWasReceived(result)
        }
    }
}
