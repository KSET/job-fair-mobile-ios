import Quick
import Nimble
import Apollo
@testable import JobFair

class CompanyGatewayShould: QuickSpec {
    
    override func spec() {
        var sut: CompanyGateway!
        var apollo: ApolloMock!
        
        beforeEach {
            apollo = ApolloMock()
            sut = CompanyGateway(apiClient: apollo)
        }
        
        afterEach {
            apollo = nil
            sut = nil
        }
        
        describe("getCompanies()") {
            it("should ask apollo for companies") {
                _ = sut.fetchCompanies().subscribe()
                
                expect(apollo.didFetchQuery) == true
            }
            
            context("apollo returned error") {
                it("should return error") {
                    apollo.shouldReturnError = true
                    var resultError: Error?
                    
                    _ = sut.fetchCompanies().subscribe(onSuccess: nil, onError: { resultError = $0 })
                    
                    expect(resultError).toEventuallyNot(beNil())
                }
            }
        }
        
        describe("getIndustries()") {
            it("should ask apollo for industries") {
                _ = sut.fetchIndustries().subscribe()
                
                expect(apollo.didFetchQuery) == true
            }
            
            context("apollo returned error") {
                it("should return error") {
                    apollo.shouldReturnError = true
                    var resultError: Error?
                    
                    _ = sut.fetchIndustries().subscribe(onSuccess: nil, onError: { resultError = $0 })
                    
                    expect(resultError).toEventuallyNot(beNil())
                }
            }
        }
    }
}
