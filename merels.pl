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
