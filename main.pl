:- include('variables.pl').
:- include('Map_Eksploration.pl').
:- include('Show_Status.pl').
:- include('Show_Help.pl').
:- include('player.pl').
:- include('battle.pl').

start :-
	write('                                                   .//`                                           '),nl,
	write('                                                   `+yyyo.                                          '),nl,
	write('                                                 `/yy+:+sy-                                         '),nl,
	write('            `````                 `.-/+/++-     -syo//+so/-       `------.                          '),nl,
	write('      .-/+osssssssso/.       .-/+ssssyyyysyo-``ohyysyyo:.` -osssssyyyoooys     `-:-.``              '),nl,
	write('  `:+ssso+//::::///osyo-    /hyy+/::/syy+:/oys:+yysoooosss+yhyo///+ys::/sy.    /dyysssso+/.-.``     '),nl,
	write('.oyyo/:::::::::::::::+sy-   /hyyyo:::ss/::::+sys+::///::/+yyyy/:::/so:::+y/    :hyyo////oyyyssso+/:`'),nl,
	write('-hhyy/:::::::::++++:::+yo  `:oyhys:::/:::::+yyo::+o/os/:+syhys:::::+/:::+yo.:/+syhys::::/syy+://oyo`'),nl,
	write(' .yhyy+++:::::/ss/so::+ys/oooosyys:::::::+sooy/::s+++:/sssyhy+::::::::::/sysoo+/+osy+::::oys::::sy. '),nl,
	write('  `ohyyyyo:::::+s/so:/sys+/+/::/+ss:::::+ssosy+::/+/:+o+:/osyo::::::::::oy+/os/::+/oy+:::+y+:::+y/  '),nl,
	write('   `/+ohhy+:::::oo/:+sy+:/sy+//o:+yo:::::://osy+:::::::::/osy+::/s/::/:oy/:/sysos+:/yo:::/o:::/ys`  '),nl,
	write('      `odhy+:::::/+syys::/ossss/:/ys:/ss+/:::/ossso+++ossyyy+:::oys/os/sy:::/+o+/::+y+/+::::::sy-   '),nl,
	write('       `ydyy/::::+yyhyo::::///:::oy/:/syhyys+////+osyso+/dhy+///syysyy/oyo::::::::oy+:+o:::::oy/    '),nl,
	write('        .hdyy/:::/syhhy+:::::::/sys::/ss:oyhhyyo+//sy-` :yyyyyyyyhhyyyo/+sso++++sys/::so::::/ys`    '),nl,
	write('         -ddys::::oyyyhhsoo++osshys++oyo  `.:oyhhysyy.   ```..--.+hhdysooooyys+yhyo//+yo::::sy.     '),nl,
	write('          :ddys:::/sy-/oyyyys+-/yyssso+-      `.:oyhs.            `:ossyyyhhy. shyhyyyyo:::+y/      '),nl,
	write('           /ddyo/+oyy/  `````  `..```        `.-:/+o+/::-.`           ```..-.  `..--sdys+++yo``     '),nl,
	write('            omhysso+:`                   .:+ssyyyyyyysssoo++/-`                     -oyyhhhs::+:    '),nl,
	write('            `/:-.`                    `:oyhhhyyyyyyyssoo+//++oo+-`                     `.-:..::-    '),nl,
	write('                                    `/shhhhhhyyyyyyysso+/:-:/+osso:`                          `     '),nl,
	write('                                   -shhhhhhhhyyyyyyyssoo+///++ossyyo.                               '),nl,
	write('                                  :hhhhhhhhhhhyyyyyyyssssoooosssyyyys:                              '),nl,
	write('                                 :hdhhhhhhhhhhhyyyyyyyyyssssssyyyyyyyy:                             '),nl,
	write('                                .hddhhhhhhhhhhhhyyhhhyyyyyyyyyyyyyyyyyy.                            '),nl,
	write('                                odddhhhhhhhhhhhdmNNNNNNmhyyyyyyyyyyyhhh+                            '),nl,
	write('                                hdddddhhhhhhhdNMMNmdhdmMMNhyyyyyyhhhhhhy`                           '),nl,
	write('                                hNNmmmdddddddMMMms+/-..oNMNhhhhhddddmmNy                            '),nl,
	write('                                yNNMMMMMMMMMMMMNyyo+/-..yMMMMMMMMMMNNNmo                            '),nl,
	write('                                shhhhhhhhddddMMMdhyoo+++mMMyssso++//:--.                            '),nl,
	write('                                -hhhhhyyyyssodMMMNmddddNMNs.`````....--`                            '),nl,
	write('                                 /hhhhyyyysssoydNMMMMMMNd+.........---`                             '),nl,
	write('                                  /hhhyyyysssoooosyyyso/-----------::.                              '),nl,
	write('                                   :yhhyyyysssooo+++///:::::---:::::`                               '),nl,
	write('                                    `+yyyyyysssoooo++++/////:////:.                                 '),nl,
	write('                                      `/syyyyssssooooo++++++++//.                                   '),nl,
	write('                                         ./osyysssssooooooo+/-`                                     '),nl,
	write('                                             .-:///+///:-.`                                         '),nl,
    write('dr. Shark: Hello!'),nl,
    write('           Welcome to the world of Pokemon!'),nl,
    write('           Your mission is to defeat the legendary Pokemons roaming in this world'),nl,
    write('           I now give you one of the three Pokemons from my lab to start your adventure'),nl,
    write('           Good Luck!'),nl,nl,
	help,nl,
    status,nl,
    map,nl,

	repeat,
		write('>> '), /* Menandakan input */
		read(Input), /*Meminta input dari user */
		do(Input),nl,  /* Menjalankan do(Input) */
        end_condition.

/* control w-a-s-d cuman bisa jalan kalo player lagi gak ketemu pokemon atau player telah menyelesaikan battle atau run */
do(w) :- isSedangBertemuPokemon(Status), Status == 0, atas, printInfoLokasi, moveAllPokemon,  spawn, cekGym, !.
do(w) :- isSedangBertemuPokemon(Status), Status == 1, print('You can\'t do that'), cekGym,!.
do(s) :- isSedangBertemuPokemon(Status), Status == 0, bawah, printInfoLokasi, moveAllPokemon,  spawn, cekGym, !.
do(s) :- isSedangBertemuPokemon(Status), Status == 1, print('You can\'t do that'), cekGym,!.
do(a) :- isSedangBertemuPokemon(Status), Status == 0, kiri, printInfoLokasi, moveAllPokemon, spawn, cekGym, !.
do(a) :- isSedangBertemuPokemon(Status), Status == 1, print('You can\'t do that'),cekGym, !.
do(d) :- isSedangBertemuPokemon(Status), Status == 0, kanan, printInfoLokasi, moveAllPokemon,  spawn, cekGym,!.
do(d) :- isSedangBertemuPokemon(Status), Status == 1, print('You can\'t do that'), cekGym,!.

/* run dan battle hanya bisa dijalanin kalo player lagi ketemu pokemon */
do(run) :- 
    isSedangBertemuPokemon(Status), Status is 1,
    isBattle(StatusBattle), StatusBattle is 0,
    random(0,2,RandomValue), executeRun(RandomValue),!.
do(run) :- 
    isSedangBertemuPokemon(Status), Status is 0,
    isBattle(StatusBattle), StatusBattle is 1,
    print('You can\'t do that'),!.
do(battle) :- 
    isSedangBertemuPokemon(Status), Status is 1,
    pilihPokemon,
	asserta(isEnemyAfterBattle(0)),
    !.
do(battle) :- 
    isSedangBertemuPokemon(Status), Status is 0,
    print('You can\'t do that'),!.

do(map) :- map,!.
do(status) :- status,!.
do(help) :- help,!.
do(heal) :- heal,!.
do(drop(X)) :- drop(X),!.

/* pick(X) gak bisa dijalanin kalo player lagi gak battle */
do(pick(X)) :- 
    isBattle(Status), 
    Status is 1, 
    pick(X), 
    battle(X),!.
do(pick(_)) :- 
    isBattle(Status), 
    Status is 0,
    print('You can\'t do that! You are not in a fight now'),nl,!. 

do(quit) :- 
	write('Are you sure you wanna leave the game? [y/n]'),nl,
	write('>> '),read(X),!,end(X),!.

do(_) :- print('You input the wrong command!'),nl,!.
do(fail) :- fail.


end('n') :-
	write('Please continue your adventure, trainer!'),nl,!.
end(y) :- halt,!.

end_condition :-
	jml_inventory(0),!,
	write('dr. Shark: Ho ho ho. You have failed to complete the missions.'),nl,
	write('As for now, meet your fate and disappear from this world!'),nl,end(y),!.
end_condition :-
  	totalLegendary(0), !,
  	write('dr. Shark: Congratulation!!! You have helped me in defeating or capturing the 2 Legendary Pokemons.'),nl,
 	write('As promised, I won\'t kill you and you\'re free!'),nl,end(y),!.
