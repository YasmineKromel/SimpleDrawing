//
//  DrawViewController.swift
//  SimpleDrawing
//
//  Created by mino on 10/20/18.
//  Copyright © 2018 mino. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {
    
    
    
     @IBOutlet weak var Segment: UISegmentedControl!
   
    
    lazy var DrawScViewController: DrawScreenViewController = {let storyboard = UIStoryboard(name:"Main" , bundle: Bundle.main)
    
        var viewcontroller = storyboard.instantiateViewController(withIdentifier: "DrawScreenViewController") as!DrawScreenViewController
        
        self.AddViewControllerAsChildViewController(ChildController: viewcontroller)
        return viewcontroller
    }()
    
    lazy var PreviewSCViewController: PreviewScreenViewController = {let storyboard = UIStoryboard(name:"Main" , bundle: Bundle.main)
        
        var viewcontroller = storyboard.instantiateViewController(withIdentifier: "PreviewScreenViewController") as! PreviewScreenViewController
        
        self.AddViewControllerAsChildViewController(ChildController: viewcontroller)
        return viewcontroller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupSegmentControll()
        updateView()
        
    }
    
    
    
    func updateView()
    {
        DrawScViewController.view.isHidden = !(Segment.selectedSegmentIndex == 0)
        PreviewSCViewController.view.isHidden = (Segment.selectedSegmentIndex == 0)
    }

    private func setupSegmentControll()
    {
        Segment.removeAllSegments()
        Segment.insertSegment(withTitle:"Draw", at: 0, animated: false)
        Segment.insertSegment(withTitle:"Preview",at:1, animated: false)
        
        Segment.addTarget(self, action: #selector(SelectionDidChanged(Sender:)), for: .valueChanged)
        Segment.selectedSegmentIndex = 0
    }
    
    func SelectionDidChanged(Sender: UISegmentedControl)
    {
        updateView()
    }
    
    
    private func AddViewControllerAsChildViewController(ChildController: UIViewController)
    {
        addChildViewController(ChildController)
        
        view.addSubview(ChildController.view)
        ChildController.view.frame = view.bounds
        ChildController.view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        ChildController.didMove(toParentViewController: self)
        
    }
    
    
   
}
