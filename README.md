# Nine-Mens-Morris-Problem
### This is a VUB project for the course declarative programming under supervision of Dr. Geraint Wiggins and Mr. Steven Homer.
## How to play the game
The modern rules of Merels date from the Middle Ages, though there is evidence that a simpler version of the game existed as long ago as 1400BC. Like many games, the rules are simple, but the emerging possibilities are complex. We start with a board made up of lines connecting points,like this: <br><br>
a-----b-----c<br>
|.....|.....|<br>
|.d---e---f.|<br>
|.|...|...|.|<br>
|.|.g-h-i.|.|<br>
|.|.|...|.|.|<br>
j-k-l...m-n-o<br>
|.|.|...|.|.|<br>
|.|.p-q-r.|.|<br>
|.|...|...|.|<br>
|.s---t---u.|<br>
|.....|.....|<br>
v-----w-----x<br><br>
I have labelled the points with letters for easy reference. Note that you must stick to this labelling, otherwise the supplied library code may not work.
There are the rules of Merels, taken from Past Times’ compendium of “Cloister Games”:<br><br>
“Starting with nine men (merels) each, you place alternately one at a time on to any vacant point on the board. Each time you manage to form a [straight] row of three merels, creating a mill, you may remove any one of your opponent’s merels, though not one which is in a mill. When all the merels have been entered on to the board, you continue taking turns by moving one merel to an adjacent point along a line, with the object of making a mill. You win the game if you manage to block your opponents merels so they cannot be moved, or if you reduce him/her to only two merels.<br>
You may make or break the same mill any number of times, capturing one of your opponents merels each time you make a mill. If you are left with only three merels on the board forming a mill and it is your turn, you must [still] move and break the mill.”<br><br>
There are some simple strategies which will help a computer win at Merels. They do not involve any real planning, but can often lead to a win, or at least hold off a loss. Applied in this order, they are:<br><br>
1. If there is a mill to be made, make it; if opponent is able to make a mill, remove one of the relevant pieces;
2. If opponent is about to make a mill, block it if possible;
3. Place pieces on points with many connections, where possible;
4. Otherwise, move your pieces together.<br>
We will use these simple heuristics at the end of the practical.<br>

This description is from Dr. Geraint Wiggins and Mr. Steven Homer.
