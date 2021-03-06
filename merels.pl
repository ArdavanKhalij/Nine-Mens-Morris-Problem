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
% First priority points (4 connections) (If you dont know what I mean, please check the
% Description part at the end of the code)
point(e).
point(k).
point(t).
point(n).
% Second priority points (3 connections) (If you dont know what I mean, please check the
% Description part at the end of the code)
point(b).
point(j).
point(o).
point(w).
point(h).
point(l).
point(m).
point(q).
% Third priority points (2 connections) (If you dont know what I mean, please check the
% Description part at the end of the code)
point(a).
point(c).
point(d).
point(f).
point(g).
point(i).
point(p).
point(r).
point(s).
point(u).
point(v).
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
% Checking the pairs and the merel and the points name.
pair((Point, Merel), Point, Merel):-
    is_merel(Merel),
    point(Point).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Merel, point and positions. Check if the pair is available on the board,
% returns false if it was not
merel_on_board((Point, Merel), Board):-
    pair((Point, Merel), Point, Merel),
    member((Point, Merel), Board).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rows for checking if three positions are in a row or not. returns true if they
% are.
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
% Connected for checking if two positions are connected on the board or not.
% Returns true if they are.
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
% Checking if board is in its initial state. Returns true if it is empty.
initial_board([]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spotting a winner (15%)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check if there is a possible move. returns false if there wasnt any possible
% move.
possible_move(Merel, Point1, Point2, Board):-
    merel_on_board((Point1, Merel), Board),
    connected(Point1, Point2),
    \+member((Point2, z), Board),
    \+member((Point2, y), Board).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First way to lose (No available move). return true if all of the nodes dont
% have any possible moves.
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
% Second and_the_winner_is predicate. Is true if there are 2 or less merels of
% the other player available on the board.
and_the_winner_is(Board, Player):-
    is_player1(Player),
    is_it_a_loser1(Board, 2, _Number),
    report_winner(Player).
and_the_winner_is(Board, Player):-
    is_player2(Player),
    is_it_a_loser2(Board, 2, _Number),
    report_winner(Player).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second way to lose (only two merels left).
% Counting the number of merels of players for finding the loser.
% Returns the number.
count_all_merels_of_a_player([], _Merel, 0).
count_all_merels_of_a_player([(_,Merel)|Tail],Merel,Number):-
    count_all_merels_of_a_player(Tail,Merel,Number1),
    Number is Number1+1.
count_all_merels_of_a_player([(_,Merel1)|Tail],Merel,Number1):-
    Merel1\=Merel,
    count_all_merels_of_a_player(Tail,Merel,Number1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check if Number of merels is what we want for a loser palyer (2). We use this
% predicate in the and_the_winner_is
is_it_a_loser1(Board, Number, N):-
    count_all_merels_of_a_player(Board, z, N),
    Number = N.
is_it_a_loser2(Board, Number, N):-
    count_all_merels_of_a_player(Board, y, N),
    Number = N.
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
find_mill(_Node, _Board, _Player, DeleteOrNot):-
    DeleteOrNot = no.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DeleteOrNot(last argument of the predicate) for specify that is deleting
% possible or not.
get_remove_point_and_report_remove(Player, Board, Board2, yes):-
    get_remove_point(Player, Point, Board),
    other_player(Player, Other),
    delete(Board, (Point, Other), Board2),
    report_remove(Player, Point).
get_remove_point_and_report_remove(_Player, Board, Board2, no):-
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
    get_legal_move_and_change(Player, _OldPoint, NewPoint, Board, Board2),
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
% DeleteOrNot(last argument of the predicate) for specify that is deleting
% possible or not.
choose_remove_and_report_remove(Player, Board, Board2, yes):-
    choose_remove(Player, Point, Board),
    other_player(Player, Other),
    delete(Board, (Point, Other), Board2),
    report_remove(Player, Point).
choose_remove_and_report_remove(_Player, Board, Board2, no):-
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
    get_legal_move_and_change(y, _OldPoint, NewPoint, Board, Board2),
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First kind of heuristics (Dumbly).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dumbly choose a point (from the assignment)
/*choose_place(_Player, Point, Board) :-
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
    empty_point(NewPoint, Board).*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second kind of heuristics (Not dumbly). Searching until finding the
% suitable situation.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Choose a point. Finding the first empty node available.
/*choose_place(_Player, Point, Board):-
    findall(X, point(X), Points),
    find_an_empty_node(Board, Points, Point),
    connected(Point, _),
    empty_point(Point, Board).
%%%%%%%%%%%
% Find the first empty position (in order of a - x) and it should always
% succeed because we have 24, positions and 18 merels.
find_an_empty_node(Board, [Points_Head|Points_Tail], Legal_Point):-
    member((Points_Head, y), Board),
    find_an_empty_node(Board, Points_Tail, Legal_Point).
find_an_empty_node(Board, [Points_Head|Points_Tail], Legal_Point):-
    member((Points_Head, z), Board),
    find_an_empty_node(Board, Points_Tail, Legal_Point).
find_an_empty_node(_Board, [Points_Head|_Points_Tail], Legal_Point):-
    Legal_Point = Points_Head.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Choose a removal. Find a first merel that is not in a mill and it belongs to
% the opponent.
choose_remove(_Player, Point, Board):-
    findall(X, point(X), Points),
    find_a_merel_for_remove(Points, Point, Board).
%%%%%%%%%%%
% A predicate that finds out 3 merels are in a row (3 possible ways because we
% only have 1 node of three needed nodes).
find_mill_for_computer(Node, Board, Player):-
    merel_on_board((Node, Player), Board),
    mill(Node, _, _, Player, Board).
find_mill_for_computer(Node, Board, Player):-
    merel_on_board((Node, Player), Board),
    mill(_, Node, _, Player, Board).
find_mill_for_computer(Node, Board, Player):-
    merel_on_board((Node, Player), Board),
    mill(_, _, Node, Player, Board).
%%%%%%%%%%%
% Searching all points and find one that is not in a row and delete it. It
% always succeed because we dont call it until the time we have a mill.
find_a_merel_for_remove([Points_Head|_Points_Tail], Point, Board):-
    merel_on_board((Points_Head, y), Board),
    \+find_mill_for_computer(Points_Head, Board, y),
    Point = Points_Head.
find_a_merel_for_remove([Points_Head|Points_Tail], Point, Board):-
    \+merel_on_board((Points_Head, y), Board),
    find_a_merel_for_remove(Points_Tail, Point, Board).
find_a_merel_for_remove([Points_Head|Points_Tail], Point, Board):-
    find_mill_for_computer(Points_Head, Board, y),
    find_a_merel_for_remove(Points_Tail, Point, Board).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Choose a move. Find the first merel that belongs to the player and has a free
% connection.
choose_move(_Player, OldPoint, NewPoint, Board):-
    findall(X, point(X), Points),
    find_a_merel(Board, OldPoint, NewPoint, Points).
%%%%%%%%%%%
% Fist finding a position that has a z, merel on it, and then try to find a free
% connection for moving that merel (NewPoint). return false if it cant.
find_a_merel(Board, OldPoint, NewPoint, [Points_Head|_Points_Tail]):-
    merel_on_board((Points_Head, z), Board),
    findall(X, point(X), Pionts),
    does_it_have_a_free_connection(Board, Pionts, Points_Head, Free_connection),
    OldPoint = Points_Head,
    NewPoint = Free_connection.
find_a_merel(Board, OldPoint, NewPoint, [Points_Head|Points_Tail]):-
    \+merel_on_board((Points_Head, z), Board),
    find_a_merel(Board, OldPoint, NewPoint, Points_Tail).
find_a_merel(Board, OldPoint, NewPoint, [Points_Head|Points_Tail]):-
    findall(X, point(X), Pionts),
    \+does_it_have_a_free_connection(Board, Pionts, Points_Head, _Free_connection),
    find_a_merel(Board, OldPoint, NewPoint, Points_Tail).
%%%%%%%%%%%
% succeed when can find a free connection and returns false if it cant.
does_it_have_a_free_connection(Board, [Points_Head|Points_Tail], Point, Free_connection):-
    merel_on_board((Point, z), Board),
    \+connected(Point, Points_Head),
    does_it_have_a_free_connection(Board, Points_Tail, Point, Free_connection).
does_it_have_a_free_connection(Board, [Points_Head|Points_Tail], Point, Free_connection):-
    merel_on_board((Point, z), Board),
    merel_on_board((Points_Head, z), Board),
    does_it_have_a_free_connection(Board, Points_Tail, Point, Free_connection).
does_it_have_a_free_connection(Board, [Points_Head|Points_Tail], Point, Free_connection):-
    merel_on_board((Point, z), Board),
    merel_on_board((Points_Head, y), Board),
    does_it_have_a_free_connection(Board, Points_Tail, Point, Free_connection).
does_it_have_a_free_connection(Board, [Points_Head|Points_Tail], Point, Free_connection):-
    merel_on_board((Point, z), Board),
    Point = Points_Head,
    does_it_have_a_free_connection(Board, Points_Tail, Point, Free_connection).
does_it_have_a_free_connection(Board, [Points_Head|_Points_Tail], Point, Free_connection):-
    connected(Point, Points_Head),
    \+merel_on_board((Points_Head, z), Board),
    \+merel_on_board((Points_Head, y), Board),
    Point \= Points_Head,
    Free_connection = Points_Head.*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third kind of heuristics. Base on the end of section 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Choose a point. We first look for a potential mill, then for any empty node.
choose_place(Player, Point, Board):-
    choose_place1(Player, Point, Board).
choose_place(Player, Point, Board):-
    \+choose_place1(Player, Point, Board),
    choose_place2(Player, Point, Board).
%%%%%%%%%%%
% choose_place1 for checking mills and choose_place2 is for checking for an
% empty node and they used in choose_place for making a condition that the
% program first search for a potential mill and then for a free position.
choose_place1(_Player, Point, Board):-
    findall(X, point(X), Points),
    find_an_empty_node_in_a_mill(Board, Points, Point),
    connected(Point, _),
    empty_point(Point, Board).
choose_place2(_Player, Point, Board):-
    findall(X, point(X), Points),
    find_an_empty_node(Board, Points, Point),
    connected(Point, _),
    empty_point(Point, Board).
%%%%%%%%%%%
% find an empty node in an one_empty_node_mill or two_empty_node_mill (find a potential mill)
find_an_empty_node_in_a_mill(Board, [Points_Head|Points_Tail], Legal_Point):-
    member((Points_Head, y), Board),
    find_an_empty_node_in_a_mill(Board, Points_Tail, Legal_Point).
find_an_empty_node_in_a_mill(Board, [Points_Head|Points_Tail], Legal_Point):-
    member((Points_Head, z), Board),
    find_an_empty_node_in_a_mill(Board, Points_Tail, Legal_Point).
find_an_empty_node_in_a_mill(Board, [Points_Head|Points_Tail], Legal_Point):-
    \+find_a_potential_mill(Points_Head, Board, z),
    find_an_empty_node_in_a_mill(Board, Points_Tail, Legal_Point).
find_an_empty_node_in_a_mill(Board, [Points_Head|_Points_Tail], Legal_Point):-
    \+member((Points_Head, y), Board),
    \+member((Points_Head, z), Board),
    Legal_Point = Points_Head.
%%%%%%%%%%%
% Find the first empty position (in order of a - x) and it should always
% succeed because we have 24, positions and 18 merels.
find_an_empty_node(Board, [Points_Head|Points_Tail], Legal_Point):-
    member((Points_Head, y), Board),
    find_an_empty_node(Board, Points_Tail, Legal_Point).
find_an_empty_node(Board, [Points_Head|Points_Tail], Legal_Point):-
    member((Points_Head, z), Board),
    find_an_empty_node(Board, Points_Tail, Legal_Point).
find_an_empty_node(_Board, [Points_Head|_Points_Tail], Legal_Point):-
    Legal_Point = Points_Head.
%%%%%%%%%%%
% Returns true if Node1, Node2 and Node3 are full with merels of one player and
% also if they are in a row.
% the order here is super important and I give it priority for some acts for
% example potential mills with one missing merel has the highest priority.
% potential mills with one missing merel.
potential_mill(Node1, Node2, Node3, Player, Board):-
    row(Node1, Node2, Node3),
    other_player(Player, Other),
    merel_on_board((Node2, Player), Board),
    merel_on_board((Node3, Player), Board),
    \+merel_on_board((Node1, Other), Board),
    \+merel_on_board((Node1, Player), Board).
potential_mill(Node1, Node2, Node3, Player, Board):-
    row(Node1, Node2, Node3),
    merel_on_board((Node1, Player), Board),
    other_player(Player, Other),
    merel_on_board((Node3, Player), Board),
    \+merel_on_board((Node2, Other), Board),
    \+merel_on_board((Node2, Player), Board).
potential_mill(Node1, Node2, Node3, Player, Board):-
    row(Node1, Node2, Node3),
    merel_on_board((Node1, Player), Board),
    other_player(Player, Other),
    merel_on_board((Node2, Player), Board),
    \+merel_on_board((Node3, Other), Board),
    \+merel_on_board((Node3, Player), Board).
% potential mills with one missing merel of opponent.
potential_mill(Node1, Node2, Node3, Player, Board):-
    row(Node1, Node2, Node3),
    other_player(Player, Other),
    merel_on_board((Node2, Other), Board),
    merel_on_board((Node3, Other), Board),
    \+merel_on_board((Node1, Other), Board),
    \+merel_on_board((Node1, Player), Board).
potential_mill(Node1, Node2, Node3, Player, Board):-
    row(Node1, Node2, Node3),
    other_player(Player, Other),
    merel_on_board((Node1, Other), Board),
    merel_on_board((Node3, Other), Board),
    \+merel_on_board((Node2, Other), Board),
    \+merel_on_board((Node2, Player), Board).
potential_mill(Node1, Node2, Node3, Player, Board):-
    row(Node1, Node2, Node3),
    other_player(Player, Other),
    merel_on_board((Node1, Other), Board),
    merel_on_board((Node2, Other), Board),
    \+merel_on_board((Node3, Other), Board),
    \+merel_on_board((Node3, Player), Board).
% potential mills with two missing merel.
potential_mill(Node1, Node2, Node3, Player, Board):-
    row(Node1, Node2, Node3),
    merel_on_board((Node1, Player), Board),
    other_player(Player, Other),
    \+merel_on_board((Node2, Player), Board),
    \+merel_on_board((Node2, Other), Board),
    \+merel_on_board((Node3, Other), Board),
    \+merel_on_board((Node3, Player), Board).
potential_mill(Node1, Node2, Node3, Player, Board):-
    row(Node1, Node2, Node3),
    other_player(Player, Other),
    \+merel_on_board((Node1, Other), Board),
    \+merel_on_board((Node1, Player), Board),
    merel_on_board((Node2, Player), Board),
    \+merel_on_board((Node3, Other), Board),
    \+merel_on_board((Node3, Player), Board).
potential_mill(Node1, Node2, Node3, Player, Board):-
    row(Node1, Node2, Node3),
    other_player(Player, Other),
    \+merel_on_board((Node1, Other), Board),
    \+merel_on_board((Node1, Player), Board),
    \+merel_on_board((Node2, Player), Board),
    \+merel_on_board((Node2, Other), Board),
    merel_on_board((Node3, Player), Board).
% potential mills with two missing merel.
potential_mill(Node1, Node2, Node3, Player, Board):-
    row(Node1, Node2, Node3),
    other_player(Player, Other),
    merel_on_board((Node1, Other), Board),
    \+merel_on_board((Node2, Player), Board),
    \+merel_on_board((Node2, Other), Board),
    \+merel_on_board((Node3, Other), Board),
    \+merel_on_board((Node3, Player), Board).
potential_mill(Node1, Node2, Node3, Player, Board):-
    row(Node1, Node2, Node3),
    other_player(Player, Other),
    \+merel_on_board((Node1, Other), Board),
    \+merel_on_board((Node1, Player), Board),
    merel_on_board((Node2, Other), Board),
    \+merel_on_board((Node3, Other), Board),
    \+merel_on_board((Node3, Player), Board).
potential_mill(Node1, Node2, Node3, Player, Board):-
    row(Node1, Node2, Node3),
    other_player(Player, Other),
    \+merel_on_board((Node1, Other), Board),
    \+merel_on_board((Node1, Player), Board),
    \+merel_on_board((Node2, Player), Board),
    \+merel_on_board((Node2, Other), Board),
    merel_on_board((Node3, Other), Board).
%%%%%%%%%%%
% A predicate that finds out 3 merels are in a row (3 possible ways because we
% only have 1 node of three needed nodes).
find_a_potential_mill(Node, Board, Player):-
    \+merel_on_board((Node, Player), Board),
    potential_mill(Node, _, _, Player, Board).
find_a_potential_mill(Node, Board, Player):-
    \+merel_on_board((Node, Player), Board),
    potential_mill(_, Node, _, Player, Board).
find_a_potential_mill(Node, Board, Player):-
    \+merel_on_board((Node, Player), Board),
    potential_mill(_, _, Node, Player, Board).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Choose a removal.
choose_remove(Player, Point, Board):-
    choose_remove1(Player, Point, Board).
choose_remove(Player, Point, Board):-
    choose_remove2(Player, Point, Board),
    \+choose_remove1(Player, Point, Board).
%%%%%%%%%%%
choose_remove1(_Player, Point, Board):-
    findall(X, point(X), Points),
    find_a_merel_for_remove_mill(Points, Point, Board).
choose_remove2(_Player, Point, Board):-
    findall(X, point(X), Points),
    find_a_merel_for_remove(Points, Point, Board).
%%%%%%%%%%%
% A predicate that finds out 3 merels are in a row (3 possible ways because we
% only have 1 node of three needed nodes).
find_mill_for_computer(Node, Board, Player):-
    merel_on_board((Node, Player), Board),
    mill(Node, _, _, Player, Board).
find_mill_for_computer(Node, Board, Player):-
    merel_on_board((Node, Player), Board),
    mill(_, Node, _, Player, Board).
find_mill_for_computer(Node, Board, Player):-
    merel_on_board((Node, Player), Board),
    mill(_, _, Node, Player, Board).
%%%%%%%%%%%
% Searching all points and find one that is not in a row and delete it.
find_a_merel_for_remove([Points_Head|_Points_Tail], Point, Board):-
    merel_on_board((Points_Head, y), Board),
    \+find_mill_for_computer(Points_Head, Board, y),
    Point = Points_Head.
find_a_merel_for_remove([Points_Head|Points_Tail], Point, Board):-
    \+merel_on_board((Points_Head, y), Board),
    find_a_merel_for_remove(Points_Tail, Point, Board).
find_a_merel_for_remove([Points_Head|Points_Tail], Point, Board):-
    find_mill_for_computer(Points_Head, Board, y),
    find_a_merel_for_remove(Points_Tail, Point, Board).
%%%%%%%%%%%
find_a_merel_for_remove_mill([Points_Head|Points_Tail], Point, Board):-
    \+merel_on_board((Points_Head, y), Board),
    find_a_merel_for_remove_mill(Points_Tail, Point, Board).
find_a_merel_for_remove_mill([Points_Head|Points_Tail], Point, Board):-
    find_mill_for_computer(Points_Head, Board, y),
    find_a_merel_for_remove_mill(Points_Tail, Point, Board).
find_a_merel_for_remove_mill([Points_Head|Points_Tail], Point, Board):-
    find_a_potential_mill(Points_Head, Board, y),
    find_a_merel_for_remove_mill(Points_Tail, Point, Board).
find_a_merel_for_remove_mill([Points_Head|_Points_Tail], Point, Board):-
    merel_on_board((Points_Head, y), Board),
    \+find_mill_for_computer(Points_Head, Board, y),
    Point = Points_Head.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Choose a move.
choose_move(Player, OldPoint, NewPoint, Board):-
    choose_move1(Player, OldPoint, NewPoint, Board).
choose_move(Player, OldPoint, NewPoint, Board):-
    choose_move2(Player, OldPoint, NewPoint, Board),
    \+choose_move1(Player, OldPoint, NewPoint, Board).
%%%%%%%%%%%
choose_move1(_Player, OldPoint, NewPoint, Board):-
    findall(X, point(X), Points),
    find_a_merel_that_has_a_connection_in_mill(Board, OldPoint, NewPoint, Points).
choose_move2(_Player, OldPoint, NewPoint, Board):-
    findall(X, point(X), Points),
    find_a_merel(Board, OldPoint, NewPoint, Points).
%%%%%%%%%%%
% Fist finding a position that has a z, merel on it, and then try to find a free
% connection for moving that merel (NewPoint). return false if it cant.
find_a_merel_that_has_a_connection_in_mill(Board, OldPoint, NewPoint, [Points_Head|Points_Tail]):-
    \+merel_on_board((Points_Head, z), Board),
    find_a_merel_that_has_a_connection_in_mill(Board, OldPoint, NewPoint, Points_Tail).
find_a_merel_that_has_a_connection_in_mill(Board, OldPoint, NewPoint, [Points_Head|Points_Tail]):-
    findall(X, point(X), Points),
    \+does_it_have_a_free_connection_and_mill(Board, Points, Points_Head, _Free_connection),
    find_a_merel_that_has_a_connection_in_mill(Board, OldPoint, NewPoint, Points_Tail).
find_a_merel_that_has_a_connection_in_mill(Board, OldPoint, NewPoint, [Points_Head|_Points_Tail]):-
    merel_on_board((Points_Head, z), Board),
    findall(X, point(X), Pionts),
    does_it_have_a_free_connection_and_mill(Board, Pionts, Points_Head, Free_connection),
    OldPoint = Points_Head,
    NewPoint = Free_connection.
%%%%%%%%%%%
find_a_merel(Board, OldPoint, NewPoint, [Points_Head|_Points_Tail]):-
    merel_on_board((Points_Head, z), Board),
    findall(X, point(X), Pionts),
    does_it_have_a_free_connection(Board, Pionts, Points_Head, Free_connection),
    OldPoint = Points_Head,
    NewPoint = Free_connection.
find_a_merel(Board, OldPoint, NewPoint, [Points_Head|Points_Tail]):-
    \+merel_on_board((Points_Head, z), Board),
    find_a_merel(Board, OldPoint, NewPoint, Points_Tail).
find_a_merel(Board, OldPoint, NewPoint, [Points_Head|Points_Tail]):-
    findall(X, point(X), Pionts),
    \+does_it_have_a_free_connection(Board, Pionts, Points_Head, _Free_connection),
    find_a_merel(Board, OldPoint, NewPoint, Points_Tail).
%%%%%%%%%%%
% succeed when can find a free connection and returns false if it cant. In this
% version it also move the merel to somewhere that there is a possibility for a mill.
does_it_have_a_free_connection_and_mill(Board, [Points_Head|Points_Tail], Point, Free_connection):-
    merel_on_board((Point, z), Board),
    \+connected(Point, Points_Head),
    does_it_have_a_free_connection_and_mill(Board, Points_Tail, Point, Free_connection).
does_it_have_a_free_connection_and_mill(Board, [Points_Head|Points_Tail], Point, Free_connection):-
    merel_on_board((Point, z), Board),
    merel_on_board((Points_Head, z), Board),
    does_it_have_a_free_connection_and_mill(Board, Points_Tail, Point, Free_connection).
does_it_have_a_free_connection_and_mill(Board, [Points_Head|Points_Tail], Point, Free_connection):-
    merel_on_board((Point, z), Board),
    merel_on_board((Points_Head, y), Board),
    does_it_have_a_free_connection_and_mill(Board, Points_Tail, Point, Free_connection).
does_it_have_a_free_connection_and_mill(Board, [Points_Head|Points_Tail], Point, Free_connection):-
    merel_on_board((Point, z), Board),
    Point = Points_Head,
    does_it_have_a_free_connection_and_mill(Board, Points_Tail, Point, Free_connection).
does_it_have_a_free_connection_and_mill(Board, [Points_Head|Points_Tail], Point, Free_connection):-
    merel_on_board((Point, z), Board),
    Point = Points_Head,
    \+find_a_potential_mill(Points_Head, Board, z),
    does_it_have_a_free_connection_and_mill(Board, Points_Tail, Point, Free_connection).
does_it_have_a_free_connection_and_mill(Board, [Points_Head|_Points_Tail], Point, Free_connection):-
    connected(Point, Points_Head),
    \+merel_on_board((Points_Head, z), Board),
    \+merel_on_board((Points_Head, y), Board),
    Point \= Points_Head,
    Free_connection = Points_Head.
%%%%%%%%%%%
% succeed when can find a free connection and returns false if it cant.
does_it_have_a_free_connection(Board, [Points_Head|Points_Tail], Point, Free_connection):-
    merel_on_board((Point, z), Board),
    \+connected(Point, Points_Head),
    does_it_have_a_free_connection(Board, Points_Tail, Point, Free_connection).
does_it_have_a_free_connection(Board, [Points_Head|Points_Tail], Point, Free_connection):-
    merel_on_board((Point, z), Board),
    merel_on_board((Points_Head, z), Board),
    does_it_have_a_free_connection(Board, Points_Tail, Point, Free_connection).
does_it_have_a_free_connection(Board, [Points_Head|Points_Tail], Point, Free_connection):-
    merel_on_board((Point, z), Board),
    merel_on_board((Points_Head, y), Board),
    does_it_have_a_free_connection(Board, Points_Tail, Point, Free_connection).
does_it_have_a_free_connection(Board, [Points_Head|Points_Tail], Point, Free_connection):-
    merel_on_board((Point, z), Board),
    Point = Points_Head,
    does_it_have_a_free_connection(Board, Points_Tail, Point, Free_connection).
does_it_have_a_free_connection(Board, [Points_Head|_Points_Tail], Point, Free_connection):-
    connected(Point, Points_Head),
    \+merel_on_board((Points_Head, z), Board),
    \+merel_on_board((Points_Head, y), Board),
    Point \= Points_Head,
    Free_connection = Points_Head.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Running the game
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
play :-
    welcome,
    initial_board(Board),
    display_board(Board),
    is_player1(Player),
    play(6, Player, []).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of the program.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Some explanation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
After designing it so that two humans could play it, I wrote three different
levels of heuristics in this program.
The first type was precisely the same as you mentioned in the description in
the last part. After that, I commented on that part of the code and started
the second level of smartness of the heuristics.
The second heuristics are chosen based on what they see first. So they choose,
remove, and move the first possible merel.
The third heuristics are based on the explanation at the end of part two of the
assignment. So I will explain here that what did I do for each strategy in the
third heuristics.

1. If there is a mill to be made, make it; if opponent is able to make a mill,
remove one of the relevant pieces: I did this part with find_an_empty_node_
in_a_mill and potential_mill, predicates, and also making the choose_place
to two parts for making a XOR.

2. If opponent is about to make a mill, block it if possible: I did this part
by only adding other options to potential_mill predicates. These options check
if there is a potential mill for the opponent to and also, the order of these
options is essential here because it shows their priority.

3. Place pieces on points with many connections, where possible: We can do this
part by giving priority to the positions. In my predicates for choosing an empty
place, I used the findall predicate. As you know findall get together all the
points because I wrote these predicates as well:
point(a).
point(b).
.
.
.
So I can get a list of the nodes. And also, the list's order is based on the
order of the point predicates, so simply, by changing the order of the point
predicates, we can make the program check the higher priority nodes (nodes with
more connections) sooner.

4. Otherwise, move your pieces together: I should mention that instead of
moving pieces together, I decided to do something different. I prioritize
potential mills that only have one node fill with merel, so automatically,
the merels become closer together. Of course, this is not precisely the same,
but I think it works well or even better than just moving the pieces together.
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
