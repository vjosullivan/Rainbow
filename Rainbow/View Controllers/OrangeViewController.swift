import UIKit

class OrangeViewController: UIViewController {

    let orangeRedTransition = PopAnimator(duration: 2.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Orange did load.")

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }

    @objc
    func handleGesture(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == UISwipeGestureRecognizerDirection.right {
            print("Swipe Right")
            let redViewController = storyboard?.instantiateViewController(withIdentifier: "RedViewController") as! RedViewController
            redViewController.transitioningDelegate = self
            self.present(redViewController, animated: true, completion: nil)
       }
        else if gesture.direction == UISwipeGestureRecognizerDirection.left {
            print("Swipe Left")
            let yellowViewController = storyboard?.instantiateViewController(withIdentifier: "YellowViewController") as! YellowViewController
            self.present(yellowViewController, animated: true, completion: nil)

        }
    }
}

extension OrangeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("Red Trans")
        return orangeRedTransition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}
