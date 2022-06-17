//
//  ViewController.swift
//  TaskExecuterApp
//
//  Created by Ahmed Mazher on 17/06/2022.
//

import UIKit


// assume that a shared class
let maxConcurrent = 3

let semaphore = DispatchSemaphore(value: maxConcurrent)

let tasksQueue = DispatchQueue(label: "com.app.heavyQueue", attributes: .concurrent)
// end

class ViewController: UIViewController {
    
    var screenString = NSMutableAttributedString()
    
    // MARK: - IBOutlets
    @IBOutlet weak var screenTView: UITextView!
    
    @IBOutlet weak var task1Btn: UIButton!
    @IBOutlet weak var task2Btn: UIButton!
    @IBOutlet weak var task3Btn: UIButton!
    @IBOutlet weak var task4Btn: UIButton!
    // end

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Methods
    private func initBtnsDesign(_ unselectedBtns: [UIButton], _ selectedBtn: UIButton){
        // unselect buttons
        self.clearButtonsSelectedSate(unselectBtns: unselectedBtns)
        
        // select the selected button
        selectedBtn.selectedBtn()
    }
    
    func heavyTask1(num: Int){
        // assume that this is a heavy task
        var counter = 0
        for i in 0..<Int.random(in: 99999 ... 10000000){
            counter += i
        }
        
        // update the UI in the main thread always!
        DispatchQueue.main.async { [weak self] in
            let text = "\n \(self?.getCurrentDateAndTime() ?? "") Task \(num)".withBoldText(text: "Task \(num)")
            self?.screenString.append(text)
            
            self?.screenTView.attributedText = self?.screenString
        }
        
    }
    // end
    
    // MARK: - IBActions
    
    @IBAction func task1Clicked(_ sender: UIButton) {
        
        initBtnsDesign([task1Btn,task2Btn,task3Btn,task4Btn], sender)
        
        
        tasksQueue.async { [weak self] in
            //lock shared resource access
            semaphore.wait()
            
            //heavy Task
            self?.heavyTask1(num: 1)
            
            // Release the lock
            semaphore.signal()
            
        }
    }
    
    @IBAction func task2Clicked(_ sender: UIButton) {
        initBtnsDesign([task1Btn,task2Btn,task3Btn,task4Btn], sender)
        
        tasksQueue.async { [weak self] in
            //lock shared resource access
            semaphore.wait()
            
            //heavy Task
            self?.heavyTask1(num: 2)
            
            // Release the lock
            semaphore.signal()
            
        }
    }
    
    @IBAction func task3Clicked(_ sender: UIButton) {
        initBtnsDesign([task1Btn,task2Btn,task3Btn,task4Btn], sender)
        
        tasksQueue.async { [weak self] in
            //lock shared resource access
            semaphore.wait()
            
            //heavy Task
            self?.heavyTask1(num: 3)
            
            // Release the lock
            semaphore.signal()
            
        }
    }
    
    @IBAction func task4Clicked(_ sender: UIButton) {
        initBtnsDesign([task1Btn,task2Btn,task3Btn,task4Btn], sender)
        
        tasksQueue.async { [weak self] in
            //lock shared resource access
            semaphore.wait()
            
            //heavy Task
            self?.heavyTask1(num: 4)
            
            // Release the lock
            semaphore.signal()
            
        }
        
    }
    //end
    
    
    
}

