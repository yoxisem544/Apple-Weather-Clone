//
//  TemperatureTests.swift
//  WeatherCloneTests
//
//  Created by David on 2023/4/28.
//

import XCTest
@testable import WeatherClone

final class TemperatureTests: XCTestCase {

    func testValueInC() throws {
        XCTAssertEqual(Temperature.F(68).valueInC, 20)
        XCTAssertEqual(Temperature.C(20).valueInC, 20)
    }

    func testValueInF() throws {
        XCTAssertEqual(Temperature.F(68).valueInF, 68)
        XCTAssertEqual(Temperature.C(20).valueInF, 68)
    }

}
