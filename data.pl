plant(peashooter).
plant(snowPea).
plant(repeater).
plant(squash).
plant(threepeater).
plant(cactus).
plant(splitPea).
plant(tanglekelp).
plant(spikeweed).
plant(cherryBomb).

damage(peashooter, normal).
damage(snowPea, normal).
damage(repeater, normal).
damage(squash, massive).
damage(threepeater, normal).
damage(cactus, normal).
damage(splitPea, normal).
damage(tanglekelp, massive).
damage(spikeweed, normal).
damage(cherryBomb, massive).

zombie(flagZombie).
zombie(bucketheadZombie).
zombie(newspaperZombie).
zombie(coneheadZombie).
zombie(footballZombie).
zombie(dancingZombie).
zombie(backupDancer).
zombie(snorkelZombie).
zombie(zomboni).
zombie(baloonZombie).


toughness(flagZombie, low).
toughness(bucketheadZombie, high).
toughness(newspaperZombie, low).
toughness(coneheadZombie, medium).
toughness(footballZombie, veryHigh).
toughness(dancingZombie, medium).
toughness(backupDancer, low).
toughness(snorkelZombie, low).
toughness(zomboni, high).
toughness(baloonZombie, low).

effect(snowPea, slows).
effect(spikeweed, cantBeEaten).


kill(X, Y) :- damage(X, normal), (toughness(Y, low); toughness(Y, medium)), shoot(X), die(Y).
kill(X, Y) :- damage(X, massive), (toughness(Y, high); toughness(Y, veryHigh)), shoot(X), die(Y).
help(X, Y) :- zombie(X), zombie(Y).
eat(X, Y) :- zombie(X), plant(Y).
shoot(X) :- plant(X).
die(X) :- plant(X); zombie(X).
