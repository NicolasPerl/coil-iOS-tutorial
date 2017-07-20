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
        setViewControllers([getWelcome()], direction: .forward, animated: true)
        
        dataSource = self
        
        view.backgroundColor = UIColor.gray
    }

    
    func getWelcome() -> Welcome {
        return storyboard?.instantiateViewController(withIdentifier: "Welcome") as! Welcome
    }
    
    func getCreateCoil() -> CreateCoil {
        return storyboard!.instantiateViewController(withIdentifier: "CreateCoil") as! CreateCoil
    }
    
    func getTutoring() -> Tutoring {
        return storyboard!.instantiateViewController(withIdentifier: "Tutoring") as! Tutoring
    }
    
    func getClassBoard() -> ClassBoard {
        return storyboard!.instantiateViewController(withIdentifier: "ClassBoard") as! ClassBoard
    }
    
    func getGurus() -> Gurus {
        return storyboard!.instantiateViewController(withIdentifier: "Gurus") as! Gurus
    }
    
}

extension Onboarding: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: Welcome.self) {
            return nil
        } else if viewController.isKind(of: CreateCoil.self) {
            return getWelcome()
        } else if viewController.isKind(of: Tutoring.self) {
            return getCreateCoil()
        }else if viewController.isKind(of: ClassBoard.self){
            return getTutoring()
        } else {
            return getClassBoard()
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: Welcome.self) {
            return getCreateCoil()
        } else if viewController.isKind(of: CreateCoil.self) {
            return getTutoring()
        } else if viewController.isKind(of: Tutoring.self) {
            return getClassBoard()
        }else if viewController.isKind(of: ClassBoard.self) {
            return getGurus()
        }else {
            return nil
        }
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 5
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
