import Foundation
import XCTest


class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}
let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)


public class GetAlbumReleaseTest: XCTestCase {
    public func testAlbumRelease() {
        let lab1Object = Lab1()
        XCTAssertEqual("Slippery When Wet was released in 1986", lab1Object.getAlbumRelease("Slippery When Wet", 1986))
        XCTAssertEqual("Purple Rain was released in 1984", lab1Object.getAlbumRelease("Purple Rain", 1984))
    }
}

public class DigitsTest: XCTestCase {
    public func testDigits() {
        let lab1Object = Lab1()
        XCTAssertEqual([1, 2, 3], lab1Object.digits(123))
        XCTAssertEqual([0], lab1Object.digits(0))
    }
}

public class InDictTest: XCTestCase {
    public func testInDict() {
        let lab1Object = Lab1()
        XCTAssertEqual("Test", lab1Object.inDict(1, [1 : "Test"]))
        XCTAssertEqual("None", lab1Object.inDict(2, [1 : "Test"]))
    }
}

GetAlbumReleaseTest.defaultTestSuite.run()
DigitsTest.defaultTestSuite.run()
InDictTest.defaultTestSuite.run()
