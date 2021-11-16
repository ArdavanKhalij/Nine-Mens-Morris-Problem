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
  merel_on_board((a, a), Board),
  merel_on_board((b, b), Board),
  merel_on_board((c, c), Board),
  merel_on_board((d, d), Board),
  merel_on_board((e, e), Board),
  merel_on_board((f, f), Board),
  merel_on_board((g, g), Board),
  merel_on_board((h, h), Board),
  merel_on_board((i, i), Board),
  merel_on_board((j, j), Board),
  merel_on_board((k, k), Board),
  merel_on_board((l, l), Board),
  merel_on_board((m, m), Board),
  merel_on_board((n, n), Board),
  merel_on_board((o, o), Board),
  merel_on_board((p, p), Board),
  merel_on_board((q, q), Board),
  merel_on_board((r, r), Board),
  merel_on_board((s, s), Board),
  merel_on_board((t, t), Board),
  merel_on_board((u, u), Board),
  merel_on_board((v, v), Board),
  merel_on_board((w, w), Board),
  merel_on_board((x, x), Board).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spotting a winner (15%)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First way to loose (No other available move).
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
