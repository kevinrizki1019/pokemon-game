:-include('player.pl').

/* ***** PRINT MAP ***** */
printMap/2.
printInfoLokasi/0.
map/0.
/* Posisi player */
printMap(X,Y) :- posisiPlayer(X,Y), !,  write('P '), Y1 is Y+1, printMap(X,Y1), !.
/* UNTUK DEBUG: nampilin posisi pokemon */
% printMap(X,Y) :- posisiPokemon(_,X,Y), !,  write('O '), Y1 is Y+1, printMap(X,Y1), !.
/* pagar dan gym */
printMap(X,Y) :- gym(X,Y), !,  write('G '), Y1 is Y+1, printMap(X,Y1), !.
printMap(X,Y) :- pagar(X,Y), !,  write('X '), Y1 is Y+1, printMap(X,Y1), !.
/* deadzone*/
printMap(11,11) :- write('X '), nl, !.
printMap(X,11) :- write('X '), nl, X1 is X+1, printMap(X1,0), !.
printMap(11,Y) :- write('X '), Y1 is Y+1, printMap(11,Y1), !.
printMap(0,Y) :- write('X '), Y1 is Y+1, printMap(0,Y1),!.
printMap(X,0) :- write('X '), printMap(X,1), !.
/* area kosong */
printMap(X,Y) :- write('_ '), Y1 is Y+1, printMap(X,Y1), !.
/* UNTUK DEBUG: print koordinatnya */
printInfoLokasi:-  posisiPlayer(X,Y), loc(X,Y,Lokasi), nl, write('Anda sekarang berada di '), write(X), write(' '), write(Y), nl, !.
/* map. */
map :- printMap(0,0), printInfoLokasi.

/* ***** MOVEMENTS ****** */
atas/0.
bawah/0.
kanan/0.
kiri/0.
/* */
atas :- posisiPlayer(X,Y), X\=1, X1 is X-1, \+pagar(X1,Y), retract(posisiPlayer(X,Y)), asserta(posisiPlayer(X1,Y)), !.    
atas :- posisiPlayer(X,Y), X\=1, X1 is X-1, pagar(X1,Y), write('Tidak bisa keatas, pager cuy'),nl,  !. 
atas :- posisiPlayer(X,_), X==1, write('Tidak bisa keatas, pager cuy'),nl, !. 
/* */
bawah :- posisiPlayer(X,Y), X\=10, X1 is X+1,\+pagar(X1,Y), retract(posisiPlayer(X,Y)), asserta(posisiPlayer(X1,Y)), !.
bawah :- posisiPlayer(X,Y), X\=10, X1 is X+1, pagar(X1,Y), write('Tidak bisa kebawah, pager cuy'),nl,  !. 
bawah :- posisiPlayer(X,_), X==10, write('Tidak bisa kebawah, pager cuy'),nl, !. 
/* */
kanan :- posisiPlayer(X,Y), Y\=10, Y1 is Y+1, \+pagar(X,Y1),retract(posisiPlayer(X,Y)), asserta(posisiPlayer(X,Y1)), !.
kanan :- posisiPlayer(X,Y), Y\=10, Y1 is Y+1, pagar(X,Y1),  write('Tidak bisa kekanan, pager cuy'),nl,  !. 
kanan :- posisiPlayer(_,Y), Y==10, write('Tidak bisa kekanan, pager cuy'),nl, !. 
/* */
kiri :- posisiPlayer(X,Y), Y\=1, Y1 is Y-1, \+pagar(X,Y1), retract(posisiPlayer(X,Y)), asserta(posisiPlayer(X,Y1)), !.
kiri :-  posisiPlayer(X,Y), Y\=1, Y1 is Y-1, pagar(X,Y1),write('Tidak bisa kekiri, pager cuy'),nl, !. 
kiri :- posisiPlayer(_,Y), Y==1, write('Tidak bisa kekiri, pager cuy'),nl, !. 

/* pokemon movement */
movePokemon(ID) :-
    random(1,11,Xnew),
    random(1,11,Ynew),
    /* DIKOMEN KARENA MEMBUAT movePokemon mengembalikan 'no' ketika hasil random sama dengan sebelumnya s.*/
    % \+posisiPokemon(_,Xnew,Ynew),
    \+gym(Xnew,Ynew),
    pokemon(ID,Nama),
    \+legendary(Nama),
    posisiPokemon(ID,X,Y),
    retract(posisiPokemon(ID,X,Y)),
    asserta(posisiPokemon(ID,Xnew,Ynew)),!.

movePokemon(ID) :-
    random(1,11,Xnew),
    random(1,11,Ynew),
    gym(Xnew,Ynew),!.

movePokemon(ID) :-
    random(1,11,Xnew),
    random(1,11,Ynew),
    posisiPokemon(ID,X,Y),
    pokemon(ID,Nama),
    legendary(Nama),!.

moveAllPokemon :-
    findall(ID,posisiPokemon(ID,_,_),ListPokemon),
    movePokemonList(ListPokemon).

movePokemonList([]).
movePokemonList(L):-
    L=[H|Tail],
    movePokemon(H),
    movePokemonList(Tail).

/* spawning pokemon */
/* Jika Hasil == 1 , pokemon yang memiliki ID tersebut, muncul di posisi yang ditentukan */
/* legendary pokemon */
spawnPokemon(ID, X, Y, Hasil):-
    pokemon(ID,Nama),
    posisiPokemon(ID,X,Y),
    legendary(Nama),
    random(1,3,RandomValue), 
    Hasil is RandomValue,!.

/* normal pokemon */
spawnPokemon(ID, X, Y, Hasil):-
    pokemon(ID,Nama),
    posisiPokemon(ID,X,Y),
    \+legendary(Nama),
    random(1,2,RandomValue), 
    Hasil is RandomValue,!.

spawn:-
    posisiPlayer(X,Y),
    \+posisiPokemon(_,X,Y),
    write('Tidak ada pokemon disini  '),  nl, !.

spawn:-
    posisiPlayer(X,Y),
    posisiPokemon(ID,X,Y),
    pokemon(ID,Nama),
    type(TipePokemon,Nama),
    health(Nama,HealthPokemon),
    damage(Nama,DamagePokemon),
    spawnPokemon(ID,X,Y,Hasil),
    Hasil==1,
    asserta(battleNow(Nama)), 
    retract(isSedangBertemuPokemon(OldStatus)),
    NewStatus is 1,
    asserta(isSedangBertemuPokemon(NewStatus)),
    write('Kamu bertemu '), write(Nama),nl,
    write('Type     : '), write(TipePokemon),nl,
    write('Health   : '), write(HealthPokemon),nl,
    write('Damage   : '), write(DamagePokemon),nl,
    write('Choose: battle or run ? '), nl, !.

spawn:-
    % posisiPlayer(X,Y),
    % pokemon(ID,Nama),
    % spawnPokemon(ID,X,Y,Hasil),
    % Hasil\=1,
    write('Kamu tidak bertemu pokemon apapun '),  nl, !.


cekGym:-
    posisiPlayer(X,Y),
    gym(X,Y),
    write('Kamu berada di gym, ketik heal untuk mengeheal semua pokemon kamu'), nl,
    retract(gym(X,Y)), !.