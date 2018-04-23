


import SpriteKit
import UIKit
import PlaygroundSupport

//SpriteKit scene for our ecosystem. Create it and add it to the view.

let view:SKView = SKView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height))
PlaygroundPage.current.liveView = view
let attackScene:SKScene = SKScene(size: CGSize.init(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height))
attackScene.anchorPoint = view.center


attackScene.scaleMode = SKSceneScaleMode.aspectFit
view.backgroundColor = UIColor.init(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
attackScene.backgroundColor = UIColor.init(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
attackScene.anchorPoint = CGPoint(x: 0, y: 0)
view.presentScene(attackScene)
