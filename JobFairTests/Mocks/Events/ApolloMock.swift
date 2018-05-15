import Apollo
@testable import JobFair

class ApolloMock: APIClient, Cancellable {

    var didFetchQuery = false
    var shouldReturnError = false

    func fetch<Query>(query: Query, resultHandler: ((GraphQLResult<Query.Data>?, Error?) -> Void)?) -> Cancellable where Query: GraphQLQuery {
        didFetchQuery = true
        if shouldReturnError {
            resultHandler?(nil, TestErrors.fakeError)
        }
        return self
    }

    func cancel() {}
}
