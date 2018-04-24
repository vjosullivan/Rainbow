import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc
    func handleGesture(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == UISwipeGestureRecognizerDirection.right {
            print("Swipe Right")
            let orangeViewController = storyboard?.instantiateViewController(withIdentifier: "OrangeViewController") as! OrangeViewController
             self.present(orangeViewController, animated: true, completion: nil)
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.left {
            print("Swipe Left")
            let greenViewController = storyboard?.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
            self.present(greenViewController, animated: true, completion: nil)

        }
    }
}

