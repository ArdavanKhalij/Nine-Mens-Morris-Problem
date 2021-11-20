%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adding the libraries.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- use_module([library(lists), io]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Board presentation (15%)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Defining the name of first player.
is_player1(y).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Defining the name of second player.
is_player2(z).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adding points as facts.
point(a).
point(b).
point(c).
point(d).
point(e).
point(f).
point(g).
point(h).
point(i).
point(j).
point(k).
point(l).
point(m).
point(n).
point(o).
point(p).
point(q).
point(r).
point(s).
point(t).
point(u).
point(v).
point(w).
point(x).
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
other_player(Player_1, Player_2):-
    is_player2(Player_1),
    is_player1(Player_2),
    \+ Player_1 = Player_2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Checking the pairs.
pair((Point, Merel), Point, Merel):-
    is_merel(Merel),
    point(Point).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Merel, point and positions.
merel_on_board((Point, Merel), Board):-
    pair((Point, Merel), Point, Merel),
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
initial_board([]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spotting a winner (15%)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check if there is a possible move.
possible_move(Merel, Point1, Point2, Board):-
    merel_on_board((Point1, Merel), Board),
    connected(Point1, Point2),
    \+member((Point2, z), Board),
    \+member((Point2, y), Board).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First way to lose (No available move).
and_the_winner_is(Board, Player):-
    other_player(Player, Other),
    \+possible_move(Other, a, b, Board),
    \+possible_move(Other, b, a, Board),
    \+possible_move(Other, b, c, Board),
    \+possible_move(Other, c, b, Board),
    \+possible_move(Other, d, e, Board),
    \+possible_move(Other, e, d, Board),
    \+possible_move(Other, e, f, Board),
    \+possible_move(Other, f, e, Board),
    \+possible_move(Other, g, h, Board),
    \+possible_move(Other, h, g, Board),
    \+possible_move(Other, h, i, Board),
    \+possible_move(Other, i, h, Board),
    \+possible_move(Other, j, k, Board),
    \+possible_move(Other, k, j, Board),
    \+possible_move(Other, k, l, Board),
    \+possible_move(Other, l, k, Board),
    \+possible_move(Other, m, n, Board),
    \+possible_move(Other, n, m, Board),
    \+possible_move(Other, n, o, Board),
    \+possible_move(Other, o, n, Board),
    \+possible_move(Other, p, q, Board),
    \+possible_move(Other, q, p, Board),
    \+possible_move(Other, q, r, Board),
    \+possible_move(Other, r, q, Board),
    \+possible_move(Other, s, t, Board),
    \+possible_move(Other, t, s, Board),
    \+possible_move(Other, t, u, Board),
    \+possible_move(Other, u, t, Board),
    \+possible_move(Other, v, w, Board),
    \+possible_move(Other, w, v, Board),
    \+possible_move(Other, w, x, Board),
    \+possible_move(Other, x, w, Board),
    \+possible_move(Other, a, j, Board),
    \+possible_move(Other, j, a, Board),
    \+possible_move(Other, j, v, Board),
    \+possible_move(Other, v, j, Board),
    \+possible_move(Other, d, k, Board),
    \+possible_move(Other, k, d, Board),
    \+possible_move(Other, k, s, Board),
    \+possible_move(Other, s, k, Board),
    \+possible_move(Other, g, l, Board),
    \+possible_move(Other, l, g, Board),
    \+possible_move(Other, l, p, Board),
    \+possible_move(Other, p, l, Board),
    \+possible_move(Other, b, e, Board),
    \+possible_move(Other, e, b, Board),
    \+possible_move(Other, e, h, Board),
    \+possible_move(Other, h, e, Board),
    \+possible_move(Other, q, t, Board),
    \+possible_move(Other, t, q, Board),
    \+possible_move(Other, t, w, Board),
    \+possible_move(Other, w, t, Board),
    \+possible_move(Other, i, m, Board),
    \+possible_move(Other, m, i, Board),
    \+possible_move(Other, m, r, Board),
    \+possible_move(Other, r, m, Board),
    \+possible_move(Other, f, n, Board),
    \+possible_move(Other, n, f, Board),
    \+possible_move(Other, n, u, Board),
    \+possible_move(Other, u, n, Board),
    \+possible_move(Other, c, o, Board),
    \+possible_move(Other, o, c, Board),
    \+possible_move(Other, o, x, Board),
    \+possible_move(Other, x, o, Board),
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
    count_all_merels_of_a_player(Tail,Merel,Number1).
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
    is_it_a_loser2(Board, 2, Number),
    report_winner(Player).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Running a game for 2 human players (25%)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operating the play/3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Returns true if Node1, Node2 and Node3 are full with merels of one player and
% also if they are in a row.
mill(Node1, Node2, Node3, Player, Board):-
    row(Node1, Node2, Node3),
    merel_on_board((Node1, Player), Board),
    merel_on_board((Node2, Player), Board),
    merel_on_board((Node3, Player), Board).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A predicate that finds out 3 merels are in a row (3 possible ways because we
% only have 1 node of three needed nodes).
find_mill(Node, Board, Player, DeleteOrNot):-
    DeleteOrNot = yes,
    merel_on_board((Node, Player), Board),
    mill(Node, _, _, Player, Board).
find_mill(Node, Board, Player, DeleteOrNot):-
    DeleteOrNot = yes,
    merel_on_board((Node, Player), Board),
    mill(_, Node, _, Player, Board).
find_mill(Node, Board, Player, DeleteOrNot):-
    DeleteOrNot = yes,
    merel_on_board((Node, Player), Board),
    mill(_, _, Node, Player, Board).
find_mill(Node, Board, Player, DeleteOrNot):-
        DeleteOrNot = no.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DeleteOrNot for specify that is deleting possible or not.
get_remove_point_and_report_remove(Player, Board, Board2, yes):-
    get_remove_point(Player, Point, Board),
    other_player(Player, Other),
    delete(Board, (Point, Other), Board2),
    report_remove(Player, Point).
get_remove_point_and_report_remove(Player, Board, Board2, no):-
    Board2 = Board.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% having a predicate and put these predicates together for having easier access
% to them.
get_legal_move_and_change(Player, OldPoint, NewPoint, Board, Board3):-
    get_legal_move(Player, OldPoint, NewPoint, Board),
    delete(Board, (OldPoint, Player), Board2),
    append(Board2, [(NewPoint, Player)], Board3).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% code for section 3.6
% First possibility: All the merels have been placed, the board represents a
% winning state, and we have to report the winner. Then we are finished.
/*play(0, Player, Board):-
    and_the_winner_is(Board, Player).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third possibility: All the merels have been placed. We can get a (legal)
% move from the player named in argument 1, move the merel he or she gives,
% check for any new mills, and ask which piece to remove if so, display the board,
% switch players and then play again, with the updated board and the new player.
play(0, Player, Board):-
    get_legal_move_and_change(Player, OldPoint, NewPoint, Board, Board2),
% DeleteOrNot is here because we want find-mill always be true so we can
% countinue play but say to remove predicate to not remove anything
    find_mill(NewPoint, Board2, Player, DeleteOrNot),
    get_remove_point_and_report_remove(Player, Board2, Board3, DeleteOrNot),
    display_board(Board3),
    other_player(Player, Other),
    play(0, Other, Board3).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second possibility: Not all the merels have been placed. We can get a (legal)
% placing from the player named in argument 1, fill the point he or she gives,
% check for any new mills, and ask which piece to remove if so, display the
% board, switch players and then play again, with the updated board and the
% new player.
play(Number, Player, Board):-
    get_legal_place(Player, Point, Board),
    append(Board, [(Point, Player)], Board2),
    Number1 is Number-1,
% DeleteOrNot is here because we want find-mill always be true so we can
% countinue play but say to remove predicate to not remove anything
    find_mill(Point, Board2, Player, DeleteOrNot),
    get_remove_point_and_report_remove(Player, Board2, Board3, DeleteOrNot),
    display_board(Board3),
    other_player(Player, Other),
    play(Number1, Other, Board3).*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Running a game for 1 human and the computer (20%)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DeleteOrNot for specify that is deleting possible or not.
choose_remove_and_report_remove(Player, Board, Board2, yes):-
    choose_remove(Player, Point, Board),
    other_player(Player, Other),
    delete(Board, (Point, Other), Board2),
    report_remove(Player, Point).
choose_remove_and_report_remove(Player, Board, Board2, no):-
    Board2 = Board.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First possibility: All the merels have been placed, the board represents a
% winning state, and we have to report the winner. Then we are finished.
play(0, Player, Board):-
    and_the_winner_is(Board, Player).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third possibility, a: Player 1 is current, we can get a (legal) move/placement
% , fill the square, display the board, and play again, with the new board and
% with player 2 as current player (this is almost exactly like the original
% play/3 above).
play(0, y, Board):-
    get_legal_move_and_change(y, OldPoint, NewPoint, Board, Board2),
    find_mill(NewPoint, Board2, y, DeleteOrNot),
    get_remove_point_and_report_remove(y, Board2, Board3, DeleteOrNot),
    display_board(Board3),
    play(0, z, Board3).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third possibility, b: Player 2 is current, we can choose a move/placement
% (see below), we tell the user what move or placement we have made (see msc
% /merels/io library), we can fill the square, display the board, and play
% again, with the new board and with Player 1 current.
play(0, z, Board):-
    choose_move(z, OldPoint, NewPoint, Board),
    report_move(z, OldPoint, NewPoint),
    delete(Board, (OldPoint, z), Board2),
    append(Board2, [(NewPoint, z)], Board3),
% DeleteOrNot is here because we want find-mill always be true so we can
% countinue play but say to remove predicate to not remove anything
    find_mill(NewPoint, Board3, z, DeleteOrNot),
    choose_remove_and_report_remove(z, Board3, Board4, DeleteOrNot),
    display_board(Board4),
    play(0, y, Board4).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second possibility, a: Player 1 is current, we can get a (legal) move/placement
% , fill the square, display the board, and play again, with the new board and
% with player 2 as current player (this is almost exactly like the original
% play/3 above).
play(Number, y, Board):-
    get_legal_place(y, Point, Board),
    append(Board, [(Point, y)], Board2),
    Number1 is Number-1,
% DeleteOrNot is here because we want find-mill always be true so we can
% countinue play but say to remove predicate to not remove anything
    find_mill(Point, Board2, y, DeleteOrNot),
    get_remove_point_and_report_remove(y, Board2, Board3, DeleteOrNot),
    display_board(Board3),
    play(Number1, z, Board3).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second possibility, b: Player 2 is current, we can choose a move/placement
% (see below), we tell the user what move or placement we have made (see msc
% /merels/io library), we can fill the square, display the board, and play
% again, with the new board and with Player 1 current.
play(Number, z, Board):-
    choose_place(z, Point, Board),
    report_move(z, Point),
    append(Board, [(Point, z)], Board2),
    Number1 is Number-1,
% DeleteOrNot is here because we want find-mill always be true so we can
% countinue play but say to remove predicate to not remove anything
    find_mill(Point, Board2, z, DeleteOrNot),
    choose_remove_and_report_remove(z, Board2, Board3, DeleteOrNot),
    display_board(Board3),
    play(Number1, y, Board3).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Implementing heuristics (25%)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dumbly choose a point (from the assignment)
choose_place(_Player, Point, Board) :-
    connected(Point, _),
    empty_point(Point, Board).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dumbly choose a removal (from the assignment)
choose_remove(Player, Point, Board):-
    pair(Pair, Point, Player),
    merel_on_board(Pair, Board).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dumbly choose a move (from the assignment)
choose_move( Player, OldPoint, NewPoint, Board ) :-
    pair(Pair, OldPoint, Player),
    merel_on_board( Pair, Board ),
    connected(OldPoint, NewPoint),
    empty_point(NewPoint, Board).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Running the game
play :-
    welcome,
    initial_board(Board),
    display_board(Board),
    is_player1(Player),
    play(6, Player, []).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
