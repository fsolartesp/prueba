//
//  ValidacionServiciosTest.swift
//  rappi_finalTests
//
//  Created by fredy on 20/04/22.
//
@testable import rappi_final

import XCTest

class ValidacionServiciosTest: XCTestCase {

    var validation: ServicioPelicula!
    
    override func setUp() {
        super.setUp()
        //validation = ServicioPelicula()
    }
    
    override func tearDown() {
        validation = nil
        super.tearDown()
    }
	/*
    func testtraerpelculas()
    {
        var movies: [Pelicula]?
        var isLoading = false
        var error: NSError?
        var query = "Fast"
        
        XCTAssertNoThrow(validation.buscarPelicula(query: query) {[weak self] (result) in
            guard let self = self, query == query else { return }
            
            isLoading = false
            switch result {
            case .success(let response):
                movies = response.results
            case .failure(let error):
                error as NSError
            }
        }
        )
        
    }
*/
    func testPerformance() throws {
        // This is an example of a performance test case.
        measure(
            metrics: [
                XCTClockMetric(),
                XCTCPUMetric(),
                XCTStorageMetric(),
                XCTMemoryMetric()
            ]
        ){
            //validation.check(gess:100)
        }
    }

}
