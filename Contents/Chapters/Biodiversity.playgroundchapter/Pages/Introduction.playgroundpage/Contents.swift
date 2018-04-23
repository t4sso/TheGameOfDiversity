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
var lifeForms = 2
var positionsForGenes = 4
//#-end-hidden-code
//:# The Game of Diversity
//:
//:## Introduction
//: Just like most humans are not exactly alike, neither are all organisms. This is because there is variety in the genes. Genes pass biological traits (attributes or features) from parents to their children. In this book you can see how genes affect all living species. To start, tap **Run My Code** to create two example organisms with four genes each.
lifeForms =  2
//: Try changing `lifeForms` to `4` and tap **Run My Code** again to create a few more organisms with random genes. In the natural world, some organisms have a lot of genes in common. In those cases, they look similar and/or have similar capabilities. For example, there are genes related to singing shared among dozens of birds species!
//:
//: Next, let's [create an ecosystem](@next)!
//#-hidden-code
positionsForGenes = 4
geneDiversityLevel = .Highest
positionSpecies(number: lifeForms, genePositions: positionsForGenes, speciesCollection: 0, scene: introScene, animationDuration: 2.0)//#-end-hidden-code

