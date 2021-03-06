/* dynamic variable */
:- dynamic(inventory/1).
:- dynamic(legendary/1).
:- dynamic(totalLegendary/1).
:- dynamic(jml_inventory/1).
:- dynamic(posisiPlayer/2).
:- dynamic(health/2).
:- dynamic(damage/2).
:- dynamic(posisiPokemon/3).
:- dynamic(battleNow/1).
:- dynamic(curr_health/2).
:- dynamic(isSedangBertemuPokemon/1).
:- dynamic(isBattle/1).
:- dynamic(level/2).
:- dynamic(damage/2).
:- dynamic(skill/3).
:- dynamic(health/2).
:- dynamic(gym/2).

/* static variable*/
/* Pemain */
/* Map */
pagar(1,5).
pagar(4,5).
pagar(6,7).
gym(1,2).
gym(8,10).

/* Pokemon */
/* List pokemon */
/* pokemon(ID,nama_pokemon) */
pokemon(1,snivy).
pokemon(21,servine).
pokemon(2,tepig).
pokemon(22,pignite).
pokemon(3,oshawott).
pokemon(23,dewott).
pokemon(4,pansage).
pokemon(5,pansear).
pokemon(6,panpour).
pokemon(7,basculin).
pokemon(8,darumaka).
pokemon(9,maractus).
pokemon(10,tympole).
pokemon(11,pidove).
pokemon(12,woobat).
pokemon(13,blitzle).
pokemon(14,emolga).
pokemon(15,throh).
pokemon(16,sawk).
pokemon(17,victini).
pokemon(18,virizion).

/* level Pokemon */
level(1,oshawott).
level(1,tepig).
level(1,snivy).

/* Posisi mula-mula pokemon */
/* posisiPokemon(X,Y,Z) : X (ID Pokemon) berada di koordinat (Y,Z) */
posisiPokemon(4,1,3).
posisiPokemon(5,1,4).
posisiPokemon(6,1,5).
posisiPokemon(7,2,1).
posisiPokemon(8,2,2).
posisiPokemon(9,2,3).
posisiPokemon(10,3,4).
posisiPokemon(11,3,5).
posisiPokemon(12,3,6).
posisiPokemon(13,4,7).
posisiPokemon(14,4,8).
posisiPokemon(15,4,9).
posisiPokemon(16,5,5).
posisiPokemon(17,7,7).
posisiPokemon(18,7,8).

/* Type */
/* type(X,Y) : X adalah type dari pokemon Y */
type(grass,snivy).
type(grass,servine).
type(water,oshawott).
type(water,dewott).
type(fire,tepig).
type(fire,pignite).
type(grass,pansage).
type(fire,pansear).
type(water,panpour).
type(fire,darumaka).
type(water,basculin).
type(grass,maractus).
type(grass,virizion).
type(fire,victini).
type(flying,pidove).
type(flying,woobat).
type(electric,blitzle).
type(electric,emolga).
type(fighting,throh).
type(fighting,sawk).

/* Starter Pokemon */
/* pokemon ini tidak dapat 'berkeliaran' di rumput.
   hanya dapat dipilih saat awal permainan */
starter(snivy).
starter(tepig).
starter(oshawott).

/* Legendary */
legendary(victini).
legendary(virizion).
totalLegendary(2).

/* Health pokemon */
/* health(X,Y) : X memiliki health sebesar Y */
health(snivy,100).
health(servine,120).
health(tepig,100).
health(pignite,120).
health(oshawott,100).
health(dewott,120).
health(pansage,100).
health(pansear,100).
health(panpour,100).
health(darumaka,100).
health(basculin,100).
health(maractus,100).
health(pidove,100).
health(woobat,100).
health(blitzle,100).
health(emolga,100).
health(throh,100).
health(sawk,100).
health(victini,150).
health(virizion,150).

/* Damage */
/* damage(X,Y) : X memiliki damage sebesar Y */
damage(victini,30).
damage(virizion,30).
damage(snivy,10).
damage(tepig,10).
damage(oshawott,10).
damage(pansage,10).
damage(pansear,10).
damage(panpour,10).
damage(darumaka,10).
damage(basculin,10).
damage(maractus,10).
damage(pidove,10).
damage(woobat,10).
damage(blitzle,10).
damage(emolga,10).
damage(throh,10).
damage(sawk,10).
damage(servine,20).
damage(pignite,20).
damage(dewott,20).

/* modifier */
/* superEffective(T1,T2) : T1 is super effective against T2 */
/* notEffective(T1,T2) : T1 is not too effective against T2*/
superEffective(fire,grass).
superEffective(water,fire).
superEffective(grass,water).
superEffective(electric,flying).
superEffective(electric,water).
superEffective(flying,grass).
superEffective(flying,fighting).

notEffective(grass,grass).
notEffective(grass,fire).
notEffective(grass,flying).
notEffective(fire,fire).
notEffective(fire,water).
notEffective(water,water).
notEffective(water,grass).
notEffective(electric,grass).
notEffective(electric,electric).
notEffective(fighting,flying).
notEffective(flying,electric).

/* special attack */
/* skill(X,Y,Z) : X memiliki special attack Y bernilai Z */
skill(victini,flameBurst,40).
skill(virizion,seedBomb,40).
skill(tepig,ember,20).
skill(pignite,flameThrower,30).
skill(oshawott,waterGun,20).
skill(dewott,razorShell,30).
skill(snivy,vineWhip,20).
skill(servine,leafTornado,30).
skill(pansage,megaDrain,20).
skill(pansear,incinerate,20).
skill(panpour,waterGun,20).
skill(darumaka,flameCharge,20).
skill(basculin,aquaJet,20).
skill(maractus,needleArm,20).
skill(pidove,airCutter,20).
skill(woobat,gust,20).
skill(blitzle,shockWave,20).
skill(emolga,spark,20).
skill(throh,vitalThrow,20).
skill(sawk,karateChop,20).

isSedangBertemuPokemon(0).
isBattle(0).

/* Location */
/* location(A,B,C): C berada di koordinat (A,B) */
loc(_,_,'Rumput'). 

/* Deadzone */
deadzone(0,0).
deadzone(0,1).
deadzone(0,2).
deadzone(0,3).
deadzone(0,4).
deadzone(0,5).
deadzone(0,6).
deadzone(0,7).
deadzone(0,8).
deadzone(0,9).
deadzone(0,10).
deadzone(0,11).
deadzone(11,0).
deadzone(11,1).
deadzone(11,2).
deadzone(11,3).
deadzone(11,4).
deadzone(11,5).
deadzone(11,6).
deadzone(11,7).
deadzone(11,8).
deadzone(11,9).
deadzone(11,10).
deadzone(11,11).
deadzone(0,11).
deadzone(1,11).
deadzone(2,11).
deadzone(3,11).
deadzone(4,11).
deadzone(5,11).
deadzone(6,11).
deadzone(7,11).
deadzone(8,11).
deadzone(9,11).
deadzone(10,11).
deadzone(1,0).
deadzone(2,0).
deadzone(3,0).
deadzone(4,0).
deadzone(5,0).
deadzone(6,0).
deadzone(7,0).
deadzone(8,0).
deadzone(9,0).
deadzone(10,0).
deadzone(11,0).