//#-hidden-code


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

var lifeForms = 10
var numberOfGenes = 8


//#-end-hidden-code
//:# Threats!
//: Invasions, disease, climate change, meteorites, loss of habitat, humans, amongst many others can kill a large number of organisms to the point of extinction.
//:## Meteorites? Really?
/*:
 \
 A meteorite impact in Mexico caused the extinction of dinosaurs 65 million years ago. Massive amounts of dust blotted out the sun, killing _the vegetation_ eaten by the dinosaurs. All organisms are threatened by changes in their environment, unless they can adapt quickly.
 
*/
/*:
 \
 **More examples:**
 + _Kudzu_, a Japanese weed brought to the US in the late 19th century, is spreading at the rate of **150,000 acres** per year, crowding out indigenous vegetation.
 + The rapid spread of a disease called _The Black Plague_ wiped out **more than 30%** of the population of Europe in the 14th century.
 + _Monarch butterflies_ spend their winter in Mexican pine forests that are being cut down in favor of avocado trees. Losing their homes, the population of Monarch butterflies is much smaller than it used to be.
 + A deadly fungus (called _chytrid_) has wiped out **30 species** of frogs and salamanders over the last 30 years.
 */
//: \
//: A threat usually attacks only parts of an ecosystem. This is determined by the variety of the genes in the ecosystem or _gene diversity_. It's much better when an ecosystem has a lot of different genes.
lifeForms = 12
numberOfGenes = 4
geneDiversityLevel = .Highest
//: Try to change `geneDiversityLevel` to `.High`, `.Medium` or `.Low` and see how organisms become more open to attack. The ecosystem is stronger when the diversity level is higher.
//:
//: In some cases, survival is really tough, as threats [can come at the same time](@next).
//#-hidden-code

positionSpecies(number: lifeForms, genePositions: numberOfGenes, speciesCollection: 0, scene: attackScene, animationDuration: 0.9)

attack(threats: lifeForms, gene: exampleGenes[Int(arc4random_uniform(UInt32(genePool)))], scene: attackScene, attackIntensity: 1.0, attackRadius: 1.0, attackDuration: 2.0, shrinkDuration: 6.5)//#-end-hidden-code
