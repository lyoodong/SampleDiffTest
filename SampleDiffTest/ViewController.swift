//
//  ViewController.swift
//  SampleDiffTest
//
//  Created by Dongwan Ryoo on 3/14/24.
//

import UIKit
import diff_match_patch

class ViewController: UIViewController {
    
    var dmp = DiffMatchPatch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDiffs(old: "1234", new: "123")
    }
    
    func fetchDiffs(old: String, new: String) -> [Diff] {
        
        var result: [Diff] = []
        
        if let diffs = dmp.diff_main(ofOldString: old, andNewString: new, checkLines: true) {
            dmp.diff_cleanupEfficiency(diffs)
            
            if let diffs = diffs as? [Diff] {
                result = diffs
            }
        }
        
        result.forEach { diff in
            guard let operation = Operation(rawValue: diff.operation.rawValue) else { return }
            switch operation {
            case .delete:
                print("1")
            case .insert:
                print("2")
            case .equal:
                print("3")
            }
        }
        
        return result
    }
}

enum Operation: UInt32 {
    case delete = 1
    case insert = 2
    case equal = 3
}

