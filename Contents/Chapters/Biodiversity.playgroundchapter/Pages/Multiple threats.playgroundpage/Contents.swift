//#-hidden-code
import SpriteKit
import UIKit
import PlaygroundSupport

//SpriteKit scene for our ecosystem. Create it and add it to the view.

let view:SKView = SKView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height))
PlaygroundPage.current.liveView = view
let multiScene:SKScene = SKScene(size: CGSize.init(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height))
multiScene.anchorPoint = view.center


multiScene.scaleMode = SKSceneScaleMode.aspectFit
view.backgroundColor = UIColor.init(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
multiScene.backgroundColor = UIColor.init(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
multiScene.anchorPoint = CGPoint(x: 0, y: 0)
view.presentScene(multiScene)

var lifeForms = 10
var numberOfGenes = 8
var forceOfFirstAttack = 0.8
var forceOfSecondAttack = 0.8

//#-end-hidden-code
//:# More threats
//: As if one wasn't enough!
/*:
 \
 Sometimes a disease might spread _because_ of starvation, loss of habitat, and/or lack of genetic diversity. Having a large variety of genes helps protect the populations against environmental changes, both natural and manmade. Mankind has unfortunately caused the extinction of many species.
 
 */
/*:
 \
 **A few examples:**
 + _Northern white rhino_ in March 2018 and _West African black rhino_ in 2011
 + _Pyrenean ibex_ (a wild goat from the mountains between Spain and France) in 2000
 + _Javan tiger_ (one of three tiger species unique to the Sunda islands) in 1976
 + _Caribbean monk seal_ in the 1950s
 + _Tasmanian tiger_ in 1936
 + _North American sea mink_ in the late 1800’s
 + _African cheetahs_ and _koalas_ both suffer from a lack of genetic diversity and are at risk of extinction today.
 */
//: \
//: Here you can see how two consecutive attacks affect the ecosystem. You can change `forceOfFirstAttack` and `forceOfSecondAttack` to any number between 0 and 10. See how a higher `geneDiversityLevel` and `numberOfGenes` help the ecosystem to defend against forceful attacks.
numberOfGenes = 4
geneDiversityLevel = .High
forceOfFirstAttack = 8
forceOfSecondAttack = 8
//: When you're finished testing, move to the [next page](@next).
//#-hidden-code


positionSpecies(number: lifeForms, genePositions: numberOfGenes, speciesCollection: 0, scene: multiScene, animationDuration: 0.9)

attack(threats: lifeForms, gene: exampleGenes[Int(arc4random_uniform(UInt32(genePool)))], scene: multiScene, attackIntensity: forceOfFirstAttack / 10, attackRadius: 0.9, attackDuration: 2.5, shrinkDuration: 4)

attack(threats: lifeForms, gene: exampleGenes[Int(arc4random_uniform(UInt32(genePool)))], scene: multiScene, attackIntensity: forceOfSecondAttack / 10, attackRadius: 0.95, attackDuration: 2.5, shrinkDuration: 4)//#-end-hidden-code

