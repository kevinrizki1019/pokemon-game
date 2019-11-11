/* dynamic variable */
:- dynamic(inventory/1).
:- dynamic(posisiPlayer/2).
:- dynamic(turnPlayer/1).
:- dynamic(health/2).
:- dynamic(damage/2).
:- dynamic(posisiPokemon/3).
:- dynamic(battleNow/2).

/* static variable*/

/* Pemain */
inventory(snivy).
inventory(pansage).
posisiPlayer(1,1).

/* Map */
pagar(1,2).
pagar(4,5).
pagar(6,7).
gym(3,4).
gym(8,10).

/* Pokemon */
/* List pokemon */
/* pokemon(ID,nama_pokemon) */
pokemon(1,snivy).
pokemon(2,tepig).
pokemon(3,oshawott).
pokemon(4,pansage).
pokemon(5,pansear).
pokemon(6,panpour).
pokemon(7,basculin).
pokemon(8,darumaka).
pokemon(9,maractus).
pokemon(10,tympole).
pokemon(11,cottonee).
pokemon(12,litwick).
pokemon(13,heatmor).

/* Posisi pokemon */
/* posisiPokemon(X,Y,Z) : X (ID Pokemon) berada di koordinat (Y,Z) */
posisiPokemon(1,1,2).
posisiPokemon(2,3,4).

/* Type */
/* type(X,Y) : X adalah type dari pokemon Y */
type(grass,snivy).
type(water,oshawott).
type(fire,tepig).
type(grass,pansage).
type(fire,pansear).
type(water,panpour).
type(fire,darumaka).
type(water,basculin).
type(grass,maractus).
type(water,tympole).
type(grass,cottonee).
type(fire,litwick).
type(fire,heatmor).
type(grass,virizion).
type(fire,victini).

/* Starter Pokemon */
/* pokemon ini tidak dapat 'berkeliaran' di rumput.
   hanya dapat dipilih saat awal permainan */
starter(snivy).
starter(tepig).
starter(oshawott).

/* Legendary */
legendary(victini).
legendary(virizion).

/* Health pokemon */
/* health(X,Y) : X memiliki health sebesar Y */
health(snivy,100).
health(tepig,100).
health(oshawott,100).
health(pansage,100).
health(pansear,100).
health(panpour,100).
health(darumaka,100).
health(basculin,100).
health(maractus,100).
health(tympole,100).
health(cottonee,100).
health(litwick,100).
health(heatmor,100).
health(victini,10000).
health(virizion,101001).

/* Damage */
/* damage(X,Y) : X memiliki damage sebesar Y */
damage(victini,135182).
damage(virizion,182135).

/* modifier */
/* modifier(X,Y) : X is super effective against Y */
modifier(fire,grass).
modifier(water,fire).
modifier(grass,water).

/* special attack */
/* weapon(X,Y) : X memiliki special attack Y */
weapon(victini,pistol).
weapon(tepig,ak47).
weapon(oshawott,kemoceng).
weapon(pansage,sapuLidi).
weapon(pansear,kerikil).
weapon(panpour,shotgun).

/* Battle */
turnPlayer(1).

/* Location */
/* location(A,B,C): C berada di koordinat (A,B) */
loc(1,1,'Start Point').
loc(1,2,'Taman Bermain').
loc(1,3,'Taman Bermain').
loc(1,4,'Taman Bermain').
loc(1,5,'Makam Pokemon').
loc(1,6,'Makam Pokemon').
loc(1,7,'Sadikin').
loc(1,8,'Sadikin').
loc(1,9,'ITB').
loc(1,10,'ITB').
loc(2,1,'LabDas8').
loc(2,2,'Taman Bermain').
loc(2,3,'Taman Bermain').
loc(2,4,'Taman Bermain').
loc(2,5,'Sekre Asique').
loc(2,6,'Sekre Asique').
loc(2,7,'Sadikin').
loc(2,8,'Sadikin').
loc(2,9,'ITB').
loc(2,10,'ITB').
loc(3,1,'ITB').
loc(3,2,'Tempat yang berbayang-bayang').
loc(3,3,'Tempat yang berbayang-bayang').
loc(3,4,'Gym Center').
loc(3,5,'Rumah Hantu').
loc(3,6,'Hutan').
loc(3,7,'Hutan').
loc(3,8,'Hutan').
loc(3,9,'Gudang').
loc(3,10,'Gudang').
loc(4,1,'Gedung kimia').
loc(4,2,'Gedung kimia').
loc(4,3,'Tempat yang terbayang-bayang').
loc(4,4,'Rumah Hantu').
loc(4,5,'Rumah Hantu').
loc(4,6,'Hutan').
loc(4,7,'Hutan').
loc(4,8,'Hutan').
loc(4,9,'Rumah nenek').
loc(4,10,'Rumah nenek').
loc(5,1,'Bikini bottom').
loc(5,2,'Bikini bottom').
loc(5,3,'Bikini bottom').
loc(5,4,'Atlantis').
loc(5,5,'Atlantis').
loc(5,6,'Hutan').
loc(5,7,'Hutan').
loc(5,8,'Hutan').
loc(5,9,'Gunung Pokemon').
loc(5,10,'Gunung Pokemon').
loc(6,1,'Bikini bottom').
loc(6,2,'Bikini Bottom').
loc(6,3,'Bikini Bottom').
loc(6,4,'Atlantis').
loc(6,5,'Atlantis').
loc(6,6,'Lapangan Cinta').
loc(6,7,'Lapangan Cinta').
loc(6,8,'Lapangan Cinta').
loc(6,9,'Labtek V').
loc(6,10,'Labtek V').
loc(7,1,'Labtek V').
loc(7,2,'Kandang Domba').
loc(7,3,'Kandang Domba').

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
