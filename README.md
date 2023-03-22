# JavaEE-Servlets-Project
In this repository you will find a Dice game developed using jakarta.servlets.
## Game Description
<img src="https://user-images.githubusercontent.com/95311883/226892442-fd153d9c-c841-4a37-922d-eb5089b44665.png" width="500">

We consider a game in which we roll 3 dice one by one in any order, using an interface. These dice are numbered 1, 2, and 3.


During a game, the same dice should not be rolled more than once. If a player rolls the same dice more than once, the game stops and the player receives a score of -1.


If the result obtained for dice number 1 is strictly less than the result obtained for dice number 2, and the result obtained for dice number 2 is strictly less than the result obtained for dice number 3, then the player receives a score equal to the sum of the results obtained for all 3 dice.


Otherwise, if the result obtained for dice number 1 is strictly greater than the result obtained for dice number 2, and the result obtained for dice number 2 is strictly greater than the result obtained for dice number 3, then the player receives a score equal to the product of the results obtained for all 3 dice.


If neither of these conditions is met, the player receives a score of zero. The game should stop once the score can be determined. For example, if the result for dice number 1 is 5 and the result for dice number 2 is 6, there is no need to wait for the result of dice number 3, as the score will be 0 regardless of the result of the 3rd dice.

## Game features
### Sign up & Log in
![Untitled design (1)](https://user-images.githubusercontent.com/95311883/226898971-5b8534c1-2494-4ea5-b6c5-aa59e4fe7efd.png)

You can create user & log into it. these features release a some exception:
![Untitled design (6)](https://user-images.githubusercontent.com/95311883/226902410-867f887b-53ba-4ee9-852c-535037cd6a4a.png)

### Consulting your best score & other player's scores
<img src="https://user-images.githubusercontent.com/95311883/226903090-117c8a02-3224-4e34-b868-ee6e9a453022.png" width="500">

## Tools used
+ IDE:
  - Eclipse

+ Package:
  - jakarta.servlet
  
+ Server:
  - Tomcat 10.1
