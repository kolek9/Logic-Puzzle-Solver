%left or right is fine since neither are specified in this instance, only used for neighbors
leftOf(A,B, [A,B,_,_,_]).
leftOf(A,B, [_,A,B,_,_]).
leftOf(A,B, [_,_,A,B,_]).
leftOf(A,B, [_,_,_,A,B]).

%if either student is to the left of the other, they are neighbors
neighbors(A,B,D) :- leftOf(A,B,D) ; leftOf(B,A,D).

%rename of member predicate to type quicker
m(A,B) :- member(A,B).

%order -> (major, music, car, team, drink)

%rules for/returns all students in order with their unique preferences
d(Dorms) :-
    
	% The computer science student lives in the middle of the corridor
	Dorms = [_,_,(d(compsci,_,_,_,_)),_,_],
      
    % The history major is a jazz fan.
	m(d(history,jazz,_,_,_),Dorms),
    
    % The Yankees fan drives a Toyota.
    m(d(_,_,toyota,yankees,_),Dorms),
    
    % The accounting major drinks Coke.
    m(d(accounting,_,_,_,coke),Dorms),
    
    % The engineering major drinks coffee
    m(d(engineering,_,_,_,coffee),Dorms),
    
    % The computer science student and history student are neighbors.
    neighbors((d(compsci,_,_,_,_)),(d(history,_,_,_,_)),Dorms),
    
    % The student at the far end of the hall likes classical music
    Dorms = [_,_,_,_,(d(_,classical,_,_,_))],
      
    % The tea drinker drives a Tesla.
    m(d(_,_,tesla,_,tea),Dorms),
    
    % The classical music fan lives next to the jazz listener.
    neighbors((d(_,classical,_,_,_)),(d(_,jazz,_,_,_)),Dorms),
    
    % The English major does not live in either of the first two rooms. 
   	m(d(english,_,_,_,_),Dorms),
    not(Dorms = [d(english,_,_,_,_),_,_,_,_]),
    not(Dorms = [_,d(english,_,_,_,_),_,_,_]),
    
    % The Royals fan drives a Tesla.
    m(d(_,_,tesla,royals,_),Dorms),
      
    % The Cubs fan listens to jazz.
    m(d(_,jazz,_,cubs,_),Dorms),
      
    % The engineering major follows the Chiefs
    m(d(engineering,_,_,chiefs,_),Dorms),
     
    % The first room is the home of the Broncos fan
    Dorms = [d(_,_,_,broncos,_),_,_,_,_],

    % The Coke drinker drives a Nissan.
    m(d(_,_,nissan,_,coke),Dorms),
      
    % The country music fan and the techno fan are neighbors.
    neighbors((d(_,country,_,_,_)),(d(_,techno,_,_,_)),Dorms),
      
    % The accounting major lives in the first room.
    Dorms = [d(accounting,_,_,_,_),_,_,_,_],
      
    % The fans of the 2 Kansas City teams (Chiefs and Royals) are neighbors
    neighbors((d(_,_,_,chiefs,_)),(d(_,_,_,royals,_)),Dorms),
      
    % The accounting major listens to rock music
    m(d(accounting,rock,_,_,_),Dorms),
      
    % The Yankees fan drinks milk.
    m(d(_,_,_,yankees,milk),Dorms),
      
    % The Chevy driver listens to country music.
    m(d(_,country,chevy,_,_),Dorms),
    
    % The jazz fan drives a Ford.
    m(d(_,jazz,ford,_,_),Dorms),
    
    %water is never specifically listed, but is one of the drinks, added rather than a filler
    m(d(_,_,_,_,water), Dorms).

%returns the music the cs student listens to
cs(CS_Student_Music) :-
	d(Dorms),
	m(d(compsci,CS_Student_Music,_,_,_), Dorms).

%returns what the english student drinks
eng(English_Student_Drink) :-
	d(Dorms),
	m(d(english,_,_,_,English_Student_Drink), Dorms).
