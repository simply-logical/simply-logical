nearby(bond_street,oxford_circus).
nearby(oxford_circus,tottenham_court_road).
nearby(bond_street,tottenham_court_road).
nearby(bond_street,green_park).
nearby(green_park,charing_cross).
nearby(bond_street,charing_cross).
nearby(green_park,piccadilly_circus).
nearby(piccadilly_circus,leicester_square).
nearby(green_park,leicester_square).
nearby(green_park,oxford_circus).
nearby(oxford_circus,piccadilly_circus).
nearby(piccadilly_circus,charing_cross).
nearby(oxford_circus,charing_cross).
nearby(tottenham_court_road,leicester_square).
nearby(leicester_square,charing_cross).
nearby(tottenham_court_road,charing_cross).

/** <examples>
?-nearby(bond_street,Y).
?-nearby(X,piccadilly_circus).
?-nearby(X,Y).
?-nearby(X,Y),nearby(Y,Z).
*/
