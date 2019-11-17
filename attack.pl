:-include('player.pl').
:-include('variable.pl').

/* ***************** Rules when player meet Pokemon ******************** */
executeRun/1.
battle/0.

executeRun(RandomValue) :-
    RandomValue is 1,
    print('Kamu berhasil lari dari Pokemon'),
    retract(isSedangBertemuPokemon(OldStatus)),
    NewStatus is 0,
    asserta(isSedangBertemuPokemon(NewStatus)),!.

executeRun(_) :-
    print('Kamu gagal lari dari Pokemon'),nl,    
    pilihPokemon.

pilihPokemon :-
    retract(isBattle(OldStatus)),
    Status is 1,
    asserta(isBattle(Status)),
    write('Pilih Pokemon mu!'),nl.

/* Battle */
:- dynamic(turnPlayer/1).
:- dynamic(isBattleSelesai/1).
:- dynamic(battleNow/1).

battleNow(1).
turnPlayer(1).
isBattleSelesai(0).

battleNow(TurnStatus) :-
    pick(PokemonPick),
    print('I choose you '), print(PokemonPick), nl,
    TurnStatus is 1,
    turnPemain,
    retract(turnPlayer(TurnStatus)),
    NewTurnStatus is 0,
    asserta(turnPlayer(NewTurnStatus)),
    battleNow(NewTurnStatus),
    !.

battleNow(TurnStatus) :-
    TurnStatus is 0,
    turnEnemy,
    retract(turnPlayer(TurnStatus)),
    NewTurnStatus is 1,
    asserta(turnPlayer(NewTurnStatus)),
    !.

/* attack mechanism */
attack(PokemonSerang,PokemonDiSerang) :- 
    retract(health(PokemonDiSerang,Health0)),
    damage(PokemonSerang,Damage),
    Health1 is Health0-Damage,
    assert(health(PokemonDiSerang,Health1)).

battle :-
    /* battle akan akan terus bergirilir sampai kondisi StatusSelesai bernilai 1 */
    print('hehe'),
    repeat,
        turnPlayer(TurnStatus),
        battleNow(TurnStatus),
        isBattleSelesai(StatusSelesai),
        StatusSelesai == 1,
        !.

turnPemain :-
    write('attack'),nl,!.

turnEnemy :-
    write('attack enemy'),nl,
    retract(isBattleSelesai(OldStatusSelesai)),
    1 is NewStatusSelesai,
    asserta(isBattleSelesai(NewStatusSelesai)),
    !.
