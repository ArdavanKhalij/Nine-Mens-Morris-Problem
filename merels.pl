%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Board presentation (15%)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adding the libraries.
:- use_module([library(lists), io]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Defining the name of first player.
is_player1(y).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Defining the name of second player.
is_player2(z).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check the players name.
is_merel(Player):-
  is_player1(Player).
is_merel(Player):-
  is_player2(Player).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check both players and check that they are not the same.
other_player(Player_1, Player_2):-
  is_player1(Player_1),
  is_player2(Player_2),
  \+ Player_1 = Player_2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Checking the pairs.
pair((Point, Merel), Point, Merel).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Merel, point and positions.
merel_on_board((Point, Merel), Board):-
  member((Point, Merel), Board).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rows
row(a, b, c).
row(c, b, a).
row(d, e, f).
row(f, e, d).
row(g, h, i).
row(i, h, g).
row(j, k, l).
row(l, k, j).
row(m, n, o).
row(o, n, m).
row(p, q, r).
row(r, q, p).
row(s, t, u).
row(u, t, s).
row(v, w, x).
row(x, w, v).
row(a, j, v).
row(v, j, a).
row(d, k, s).
row(s, k, d).
row(g, l, p).
row(p, l, g).
row(b, e, h).
row(h, e, b).
row(q, t, w).
row(w, t, q).
row(i, m, r).
row(r, m, i).
row(f, n, u).
row(u, f, f).
row(c, o, x).
row(x, o, c).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Connected nodes.
connected(a, b).
connected(b, a).
connected(b, c).
connected(c, b).
connected(d, e).
connected(e, d).
connected(e, f).
connected(f, e).
connected(g, h).
connected(h, g).
connected(h, i).
connected(i, h).
connected(j, k).
connected(k, j).
connected(k, l).
connected(l, k).
connected(m, n).
connected(n, m).
connected(n, o).
connected(o, n).
connected(p, q).
connected(q, p).
connected(q, r).
connected(r, q).
connected(s, t).
connected(t, s).
connected(t, u).
connected(u, t).
connected(v, w).
connected(w, v).
connected(w, x).
connected(x, w).
connected(a, j).
connected(j, a).
connected(j, v).
connected(v, j).
connected(d, k).
connected(k, d).
connected(k, s).
connected(s, k).
connected(g, l).
connected(l, g).
connected(l, p).
connected(p, l).
connected(b, e).
connected(e, b).
connected(e, h).
connected(h, e).
connected(q, t).
connected(t, q).
connected(t, w).
connected(w, t).
connected(i, m).
connected(m, i).
connected(m, r).
connected(r, m).
connected(f, n).
connected(n, f).
connected(n, u).
connected(u, n).
connected(c, o).
connected(o, c).
connected(o, x).
connected(x, o).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Checking if boerd is in its initial state.
% name of the point means empty, y is for the first players and z is for second player
initial_board(Board):-
  Board = [].
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spotting a winner (15%)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First way to lose (No other available move).
and_the_winner_is(Board, Player):-
  is_player1(Player),
  \+get_legal_move(z, a, b, Board),
  \+get_legal_move(z, b, a, Board),
  \+get_legal_move(z, b, c, Board),
  \+get_legal_move(z, c, b, Board),
  \+get_legal_move(z, d, e, Board),
  \+get_legal_move(z, e, d, Board),
  \+get_legal_move(z, e, f, Board),
  \+get_legal_move(z, f, e, Board),
  \+get_legal_move(z, g, h, Board),
  \+get_legal_move(z, h, g, Board),
  \+get_legal_move(z, h, i, Board),
  \+get_legal_move(z, i, h, Board),
  \+get_legal_move(z, j, k, Board),
  \+get_legal_move(z, k, j, Board),
  \+get_legal_move(z, k, l, Board),
  \+get_legal_move(z, l, k, Board),
  \+get_legal_move(z, m, n, Board),
  \+get_legal_move(z, n, m, Board),
  \+get_legal_move(z, n, o, Board),
  \+get_legal_move(z, o, n, Board),
  \+get_legal_move(z, p, q, Board),
  \+get_legal_move(z, q, p, Board),
  \+get_legal_move(z, q, r, Board),
  \+get_legal_move(z, r, q, Board),
  \+get_legal_move(z, s, t, Board),
  \+get_legal_move(z, t, s, Board),
  \+get_legal_move(z, t, u, Board),
  \+get_legal_move(z, u, t, Board),
  \+get_legal_move(z, v, w, Board),
  \+get_legal_move(z, w, v, Board),
  \+get_legal_move(z, w, x, Board),
  \+get_legal_move(z, x, w, Board),
  \+get_legal_move(z, a, j, Board),
  \+get_legal_move(z, j, a, Board),
  \+get_legal_move(z, j, v, Board),
  \+get_legal_move(z, v, j, Board),
  \+get_legal_move(z, d, k, Board),
  \+get_legal_move(z, k, d, Board),
  \+get_legal_move(z, k, s, Board),
  \+get_legal_move(z, s, k, Board),
  \+get_legal_move(z, g, l, Board),
  \+get_legal_move(z, l, g, Board),
  \+get_legal_move(z, l, p, Board),
  \+get_legal_move(z, p, l, Board),
  \+get_legal_move(z, b, e, Board),
  \+get_legal_move(z, e, b, Board),
  \+get_legal_move(z, e, h, Board),
  \+get_legal_move(z, h, e, Board),
  \+get_legal_move(z, q, t, Board),
  \+get_legal_move(z, t, q, Board),
  \+get_legal_move(z, t, w, Board),
  \+get_legal_move(z, w, t, Board),
  \+get_legal_move(z, i, m, Board),
  \+get_legal_move(z, m, i, Board),
  \+get_legal_move(z, m, r, Board),
  \+get_legal_move(z, r, m, Board),
  \+get_legal_move(z, f, n, Board),
  \+get_legal_move(z, n, f, Board),
  \+get_legal_move(z, n, u, Board),
  \+get_legal_move(z, u, n, Board),
  \+get_legal_move(z, c, o, Board),
  \+get_legal_move(z, o, c, Board),
  \+get_legal_move(z, o, x, Board),
  \+get_legal_move(z, x, o, Board),
  report_winner(Player).
and_the_winner_is(Board, Player):-
  is_player2(Player),
  \+get_legal_move(y, a, b, Board),
  \+get_legal_move(y, b, a, Board),
  \+get_legal_move(y, b, c, Board),
  \+get_legal_move(y, c, b, Board),
  \+get_legal_move(y, d, e, Board),
  \+get_legal_move(y, e, d, Board),
  \+get_legal_move(y, e, f, Board),
  \+get_legal_move(y, f, e, Board),
  \+get_legal_move(y, g, h, Board),
  \+get_legal_move(y, h, g, Board),
  \+get_legal_move(y, h, i, Board),
  \+get_legal_move(y, i, h, Board),
  \+get_legal_move(y, j, k, Board),
  \+get_legal_move(y, k, j, Board),
  \+get_legal_move(y, k, l, Board),
  \+get_legal_move(y, l, k, Board),
  \+get_legal_move(y, m, n, Board),
  \+get_legal_move(y, n, m, Board),
  \+get_legal_move(y, n, o, Board),
  \+get_legal_move(y, o, n, Board),
  \+get_legal_move(y, p, q, Board),
  \+get_legal_move(y, q, p, Board),
  \+get_legal_move(y, q, r, Board),
  \+get_legal_move(y, r, q, Board),
  \+get_legal_move(y, s, t, Board),
  \+get_legal_move(y, t, s, Board),
  \+get_legal_move(y, t, u, Board),
  \+get_legal_move(y, u, t, Board),
  \+get_legal_move(y, v, w, Board),
  \+get_legal_move(y, w, v, Board),
  \+get_legal_move(y, w, x, Board),
  \+get_legal_move(y, x, w, Board),
  \+get_legal_move(y, a, j, Board),
  \+get_legal_move(y, j, a, Board),
  \+get_legal_move(y, j, v, Board),
  \+get_legal_move(y, v, j, Board),
  \+get_legal_move(y, d, k, Board),
  \+get_legal_move(y, k, d, Board),
  \+get_legal_move(y, k, s, Board),
  \+get_legal_move(y, s, k, Board),
  \+get_legal_move(y, g, l, Board),
  \+get_legal_move(y, l, g, Board),
  \+get_legal_move(y, l, p, Board),
  \+get_legal_move(y, p, l, Board),
  \+get_legal_move(y, b, e, Board),
  \+get_legal_move(y, e, b, Board),
  \+get_legal_move(y, e, h, Board),
  \+get_legal_move(y, h, e, Board),
  \+get_legal_move(y, q, t, Board),
  \+get_legal_move(y, t, q, Board),
  \+get_legal_move(y, t, w, Board),
  \+get_legal_move(y, w, t, Board),
  \+get_legal_move(y, i, m, Board),
  \+get_legal_move(y, m, i, Board),
  \+get_legal_move(y, m, r, Board),
  \+get_legal_move(y, r, m, Board),
  \+get_legal_move(y, f, n, Board),
  \+get_legal_move(y, n, f, Board),
  \+get_legal_move(y, n, u, Board),
  \+get_legal_move(y, u, n, Board),
  \+get_legal_move(y, c, o, Board),
  \+get_legal_move(y, o, c, Board),
  \+get_legal_move(y, o, x, Board),
  \+get_legal_move(y, x, o, Board),
  report_winner(Player).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second way to lose (only two merels left).
% Counting the number of merels of players for finding the loser
count_all_merels_of_a_player([], Merel, 0).
count_all_merels_of_a_player([(_,Merel)|Tail],Merel,Number):- 
  count_all_merels_of_a_player(Tail,Merel,Number1), 
  Number is Number1+1.
count_all_merels_of_a_player([(_,Merel1)|Tail],Merel,Number1):-
  Merel1\=Merel,
  count_all_merels_of_a_player(Tail,MerelX,Number1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check if Number of merels is what we want for a loser palyer (2).
is_it_a_loser1(Board, Number, N):-
  count_all_merels_of_a_player(Board, z, N),
  Number = N.
is_it_a_loser2(Board, Number, N):-
  count_all_merels_of_a_player(Board, y, N),
  Number = N.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second and_the_winner_is predicate.
and_the_winner_is(Board, Player):-
  is_player1(Player),
  is_it_a_loser1(Board, 2, Number),
  report_winner(Player).
and_the_winner_is(Board, Player):-
  is_player2(Player),
  is_it_a_loser2(Board, 2, Number).
  report_winner(Player).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Running a game for 2 human players (25%)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operating the play/3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A predicate that finds out 3 merels in a row.
find_mill(Node, Board, Player):-
  member((Node, Player), Board),
  row(Node, _Node1, _Node2),
  row(_Node3, Node, _Node4),
  row(_Node5, _Node6, Node).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mixing two predicates for using Point in both.
get_legal_place_and_find_mill(Player, Point, Board):-
  get_legal_place(Player, Point, Board),
  find_mill(Point, Board, Player).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mixing two predicates for using Point in both.
get_remove_point_and_report_remove(Player, Point, Board):-
  get_remove_point(Player, Point, Board),
  report_remove(Player, Point).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Switch to other player
switch_player(Player, Result):-
  Player = y,
  Result is z.
switch_player(Player, Result):-
  Player = z,
  Result is y.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mixing two predicates for using Number1 and Result in both.
switch_player_and_play_again_and_reduce_number(Number, Board, Player, Result, Number1):-
  Number1 is Number-1,
  switch_player(Player, Result),
  play(Number1, Result, Board).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First possibility: All the merels have been placed, the board represents a
%  winning state, and we have to report the winner. Then we are finished.
play(0, Player, Board):-
  display_board(Board),
  and_the_winner_is(Board, Player).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third possibility: All the merels have been placed. We can get a (legal) 
% move from the player named in argument 1, move the merel he or she gives, 
% check for any new mills, and ask which piece to remove if so, display the board, 
% switch players and then play again, with the updated board and the new player.
play(0, Player, Board):-

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second possibility: Not all the merels have been placed. We can get a (legal)
% placing from the player named in argument 1, fill the point he or she gives, 
%check for any new mills, and ask which piece to remove if so, display the 
% board, switch players and then play again, with the updated board and the 
% new player.
play(Number, Player, Board):-
  display_board(Board),
  get_legal_place_and_find_mill(Player, Point, Board),
  get_remove_point_and_report_remove(Player, Point, Board),
  display_board(Board),
  switch_player_and_play_again_and_reduce_number(Number, Board, Player, Result, Number1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Running the game
% play :- 
%   welcome,
%   initial_board( Board ),
%   display_board( Board ),
%   is_player1( Player ),
%   play( 18, Player, Board ).
