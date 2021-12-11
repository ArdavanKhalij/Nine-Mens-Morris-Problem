
:- module( io, [display_board/1, report_winner/1, welcome/0, get_legal_place/3,
		get_legal_move/4, get_remove_point/3, report_mill/1,
		report_move/2, report_move/3, report_remove/2, empty_point/2
		] ).

:- use_module( [library(lists)] ).

display_board( Board ) :-
	nl,
	dm( a, Board ),
	write( '-----' ),
	dm( b, Board ),
	write( '-----' ),
	dm( c, Board ),
	nl,
	write( '|     |     |' ),
	nl,
	write( '| ' ),
	dm( d, Board ),
	write( '---' ),
	dm( e, Board ),
	write( '---' ),
	dm( f, Board ),
	write( ' |' ),
	nl,
	write( '| |   |   | |' ),
	nl,
	write( '| | ' ),
	dm( g, Board ),
	write( '-' ),
	dm( h, Board ),
	write( '-' ),
	dm( i, Board ),
	write( ' | |' ),
	nl,
	write( '| | |   | | |' ),
	nl,
	dm( j, Board ),
	write( '-' ),
	dm( k, Board ),
	write( '-' ),
	dm( l, Board ),
	write( '   ' ),
	dm( m, Board ),
	write( '-' ),
	dm( n, Board ),
	write( '-' ),
	dm( o, Board ),
	nl,
	write( '| | |   | | |' ),
	nl,
	write( '| | ' ),
	dm( p, Board ),
	write( '-' ),
	dm( q, Board ),
	write( '-' ),
	dm( r, Board ),
	write( ' | |' ),
	nl,
	write( '| |   |   | |' ),
	nl,
	write( '| ' ),
	dm( s, Board ),
	write( '---' ),
	dm( t, Board ),
	write( '---' ),
	dm( u, Board ),
	write( ' |' ),
	nl,
	write( '|     |     |' ),
	nl,
	dm( v, Board ),
	write( '-----' ),
	dm( w, Board ),
	write( '-----' ),
	dm( x, Board ),
	nl,
	nl.

dm( Point, Board ) :-
	user:merel_on_board( Pair, Board ),
	user:pair( Pair, Point, Merel ),
	write( Merel ).
dm( Point, Board ) :-
	empty_point( Point, Board ),
	write( Point ).

% report the winner

report_winner( Winner ) :-
	format( 'Player ~w has won!\n', [Winner] ).

% report a move

report_move( Player, Point ) :-
	format( 'Player ~w takes point ~w.\n', [Player, Point] ).

report_move( Player, OldPoint, NewPoint ) :-
	format( 'Player ~w moves from point ~w to point ~w.\n',
					[Player, OldPoint, NewPoint] ).

report_remove( Player, Point ) :-
	format( 'Player ~w removes merel at point ~w\n', [Player, Point] ).

% ask for a move

get_legal_move( Player, OldPoint, NewPoint, Board ) :-
	format( 'Player ~w, which merel do you wish to move?\n', [Player] ),
	request_move( Player, OldPoint ),
	user:pair( Pair, OldPoint, Player ),
	user:merel_on_board( Pair, Board ),
	!,
	get_legal_move2( Player, OldPoint, NewPoint, Board ).
get_legal_move( Player, OldPoint, NewPoint, Board ) :-
	report_no_merel,
	get_legal_move( Player, OldPoint, NewPoint, Board ).

get_legal_move2( Player, OldPoint, NewPoint, Board ) :-
	format( 'Player ~w, where do you wish to move the merel to?\n', [Player] ),
	request_move( Player, NewPoint ),
	empty_point( NewPoint, Board ),
	user:connected( OldPoint, NewPoint ),
	!.
get_legal_move2( Player, OldPoint, NewPoint, Board ) :-
	report_blocked,
	get_legal_move2( Player, OldPoint, NewPoint, Board ).

% ask for a placement

get_legal_place( Player, Point, Board ) :-
	format( 'Player ~w, where do you wish to place a merel?\n', [Player] ),
	request_move( Player, Point ),
	empty_point( Point, Board ),
	!.
get_legal_place( Player, Point, Board ) :-
	report_blocked,
	get_legal_place( Player, Point, Board ).

% ask for a piece to remove

get_remove_point( Player, Point, Board ) :-
	user:other_player( Player, Other ),
	format( 'Which of Player ~w\'s pieces do you wish to remove?\n', [Other] ),
	request_move( Player, Point ),
	user:pair( Pair, Point, Other ),
	user:merel_on_board( Pair, Board ),
	!.
get_remove_point( Player, Point, Board ) :-
	report_no_merel,
	get_remove_point( Player, Point, Board ).

report_mill( Player ) :-
	format( 'Player ~w, you have made a mill.\n', [Player] ).

report_no_merel :-
	format( '\nNo movable merel there. Please try again.\n', [] ).

report_blocked :-
	format( '\nThat point is not available. Please try again.\n', [] ).


request_move( Player, Answer ) :-
	format( 'Player ~w, please input point name: ', [Player] ),
	ttyflush,
	read( Answer ),
	name( Answer, [_] ),
	Answer @>= a,
	Answer @=< x,
	!.
request_move( Player, Answer ) :-
	format( 'Please enter a letter between a and x.\n', [] ),
	request_move( Player, Answer ).

welcome :-
	format( 'Welcome to Merels!\n\n', [] ).

empty_point( Point, Board ) :-
	user:pair( Pair, Point, _ ),
	\+ ( user:merel_on_board( Pair, Board )).
