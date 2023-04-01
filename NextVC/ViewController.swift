//
//  ViewController.swift
//  NextVC
//
//  Created by 박준서 on 2023/04/01.
//
 
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        //firstVC.someString = "안녕하세요"
        //firstVC.mainLabel.text = "안녕하세요"  // 코드로 가능은 함
        firstVC.modalPresentationStyle = .fullScreen
        self.present(firstVC, animated: true, completion: nil)
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        //secondVC.someString = "안녕하세요"
        //secondVC.mainLabel.text = "안녕하세요"    // 에러발생 (스토리보드 객체가 나중에 생김)
        //secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated: true, completion: nil)
    }
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        if num > 5{
            
        }else{
            performSegue(withIdentifier: "toThirdVC", sender: self)
        }
        
        // 세그웨이를 실행한다는 의미의 메서드 호출
        self.performSegue(withIdentifier: "toThirdVC", sender: self)
    }
    
    // 4) 스토리보드에서의 화면 이동(직접 세그웨이)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "toThirdVC"{
            let thirdVC = segue.destination as! ThirdViewController
            thirdVC.someString = "엄마상어"
            //데이터를 전달
        }
        
        if segue.identifier == "toFourthVC"{
            let fourthVC = segue.destination as! FourthViewController
            fourthVC.someString = "뚜루루뚜뚜"
            //데이터를 전달
        }
        
    }
    
    var num = 7
    
    // 참고 - 4) 직접 세그웨이에서만 호출되는 메서드
    // 조건에 따라 다음화면 이동할지/말지
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        if num > 5{
            return false
        }else{
            return true
        }

    }
    
}


