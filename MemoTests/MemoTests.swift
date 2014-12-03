//  Copyright (c) 2014 Rob Rix. All rights reserved.

import Memo
import XCTest

final class MemoTests: XCTestCase {
	var effects = 0

	override func setUp() {
		effects = 0
	}


	// MARK: Evaluation

	func testEvaluatesLazilyWithAutoclosureConstruction() {
		let memo = Memo(++effects)
		XCTAssertEqual(effects, 0)
	}

	func testEvaluatesLazilyWithClosureConstruction() {
		let memo = Memo { ++self.effects }
		XCTAssertEqual(effects, 0)
	}

	func testEvaluatesEagerlyWithValueConstruction() {
		let memo = Memo(evaluated: ++effects)
		XCTAssertEqual(effects, 1)
	}


	// MARK: Memoization

	func testMemoizesWithAutoclosureConstruction() {
		let memo = Memo(++effects)
		XCTAssertEqual(memo.value, memo.value)
		XCTAssertEqual(memo.value, effects)
		XCTAssertEqual(effects, 1)
	}

	func testMemoizesWithClosureConstruction() {
		let memo = Memo { ++self.effects }
		XCTAssertEqual(memo.value, memo.value)
		XCTAssertEqual(memo.value, effects)
		XCTAssertEqual(effects, 1)
	}

	func testMemoizesWithValueConstruction() {
		let memo = Memo(evaluated: ++effects)
		XCTAssertEqual(memo.value, memo.value)
		XCTAssertEqual(memo.value, effects)
		XCTAssertEqual(effects, 1)
	}
}
