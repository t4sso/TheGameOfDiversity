//#-hidden-code


import SpriteKit
import UIKit
import PlaygroundSupport

//SpriteKit scene for our ecosystem. Create it and add it to the view.

let view:SKView = SKView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height))
PlaygroundPage.current.liveView = view
let growScene:SKScene = SKScene(size: CGSize.init(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height))
growScene.anchorPoint = view.center


growScene.scaleMode = SKSceneScaleMode.aspectFit
view.backgroundColor = UIColor.init(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
growScene.backgroundColor = UIColor.init(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
growScene.anchorPoint = CGPoint(x: 0, y: 0)
view.presentScene(growScene)

var lifeForms = 10
var numberOfGenes = 4

//#-end-hidden-code
//:# The ecosystem is growing
//: A new hope
//:
//: Ecosystems are naturally growing too. Parents have children, then children grow up and have grandchildren. _But there's a catch_! If populations drop to very low levels, some genes might not survive; they go extinct (just like species go extinct). Any generations after that will have **only the genes that survived**.
//:
//: When genes or species go extinct, there is no way to recreate them. Evolution of genes and species happens randomly in nature and can take hundreds of thousands or even millions of years.
//:
//: Here you can see how a new generation is formed after the threat is gone. Notice how the new generation will only include the genes that have survived the attack. Try to reduce the `geneDiversityLevel` or the `lifeForms`. You will see that some genes might not be passed on to the next generation.
//#-end-hidden-code
geneDiversityLevel = .High
lifeForms = 16
numberOfGenes = 4
//: Humans can breathe, walk swim, but also travel and play and love and sing because of an evolution that took hundreds of millions of years. Genes were passed from generation to generation, biological traits and features improved and the result is _all of us_.
//:
//: The same principle is true for genes, species, ecosystems, human societies and even cultures and ideas. All of these evolve randomly and slowly, over many hundreds of generations. And there are external threats all the time.
//: We all benefit when we preserve diversity, because *diversity makes us stronger*. This is the conclusion of the Game of Diversity.
//:
//:### Conclusion
//:* Callout(Remember:):
//:_If everyone's the same, everyone's at risk._
//#-hidden-code


positionSpecies(number: lifeForms, genePositions: numberOfGenes, speciesCollection: 0, scene: growScene, animationDuration: 0.9)

attack(threats: lifeForms, gene: exampleGenes[0], scene: growScene, attackIntensity: 1.2, attackRadius: 1.0, attackDuration: 2.0, shrinkDuration: 3.5)

growthCycle(scene: growScene, genePositions: numberOfGenes, number: lifeForms)

//#-end-hidden-code
