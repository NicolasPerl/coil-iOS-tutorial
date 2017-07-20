//
//  PageOne.swift
//  coil-iOS-tutorial
//
//  Created by Hayden Greer on 7/19/17.
//  Copyright © 2017 Hayden Greer. All rights reserved.
//

import Foundation
import UIKit


class Onboarding: UIPageViewController {
    
    override func viewDidLoad() {
        setViewControllers([getStepZero()], direction: .forward, animated: true)
        
        dataSource = self
        
        view.backgroundColor = UIColor.darkGray
    }

    
    func getStepZero() -> StepZero {
        return storyboard?.instantiateViewController(withIdentifier: "StepZero") as! StepZero
    }
    
    func getStepOne() -> StepOne {
        return storyboard!.instantiateViewController(withIdentifier: "StepOne") as! StepOne
    }
    
    func getStepTwo() -> StepTwo {
        return storyboard!.instantiateViewController(withIdentifier: "StepTwo") as! StepTwo
    }
    
}

extension Onboarding: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: StepZero.self) {
            return nil
        } else if viewController.isKind(of: StepOne.self) {
            return getStepZero()
        } else {
            return getStepOne()
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: StepZero.self) {
            return getStepOne()
        } else if viewController.isKind(of: StepOne.self) {
            return getStepTwo()
        } else {
            return nil
        }
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
