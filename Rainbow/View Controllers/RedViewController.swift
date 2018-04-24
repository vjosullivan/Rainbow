import UIKit

class RedViewController: UIViewController {

    let redOrangeTransition = PopAnimator()

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .blue
        print("Red did load.")
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }

    @objc
    func handleGesture(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == UISwipeGestureRecognizerDirection.right {
            print("Swipe Right")
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.left {
            print("Swipe Left")
            let orangeViewController = storyboard?.instantiateViewController(withIdentifier: "OrangeViewController") as! OrangeViewController
            orangeViewController.transitioningDelegate = self
            present(orangeViewController, animated: true, completion: nil)
        }
    }
}

extension RedViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("Red Trans")
        return redOrangeTransition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}
