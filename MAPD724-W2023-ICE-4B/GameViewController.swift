import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var currentScene: GKScene?

    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var EndLabel: UILabel!
    @IBOutlet weak var EndButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        presentStartScene()
        
        
        CollisionManager.gameViewController = self
        
        
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateLivesLabel()
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func setScene(sceneName: String) -> Void {
        currentScene = GKScene(fileNamed: sceneName)
        if let scene = currentScene!.rootNode as! SKScene?
        {
            scene.scaleMode = .aspectFill
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }
    
    func presentStartScene(){
        LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        StartLabel.isHidden = false
        StartButton.isHidden = false
        setScene(sceneName: "StartScene")
    }
    
    func presentEndScene(){
        LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        StartLabel.isHidden = true
        StartButton.isHidden = true
        EndLabel.isHidden = false
        EndButton.isHidden = false
        setScene(sceneName: "EndScene")
    }
    
    
    @IBAction func StartButton_Pressed(_ sender: UIButton) {
        LivesLabel.isHidden = false
        ScoreLabel.isHidden = false
        StartLabel.isHidden = true
        StartButton.isHidden = true
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
    }
    
    @IBAction func RestartButton_Pressed(_ sender: UIButton) {
        EndButton.isHidden = true
        LivesLabel.isHidden = false
        ScoreLabel.isHidden = false
        EndLabel.isHidden = true
        
        setScene(sceneName: "GameScene")
    }
}

