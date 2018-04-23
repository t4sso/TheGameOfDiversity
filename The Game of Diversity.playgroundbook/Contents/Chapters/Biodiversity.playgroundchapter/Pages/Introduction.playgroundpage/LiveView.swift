//#-hidden-code
import SpriteKit
import UIKit
import PlaygroundSupport
//SpriteKit scene for our ecosystem. Create it and add it to the view.
let view:SKView = SKView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height))
PlaygroundPage.current.liveView = view
let introScene:SKScene = SKScene(size: CGSize.init(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height))
introScene.anchorPoint = view.center
introScene.scaleMode = SKSceneScaleMode.aspectFit
view.backgroundColor = UIColor.init(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
introScene.backgroundColor = UIColor.init(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
introScene.anchorPoint = CGPoint(x: 0, y: 0)
view.presentScene(introScene)
