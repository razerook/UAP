% Nama	:  Siever Geoffrey Kalele
% NPM	:  1917051064


family(person(tom, fox, date(7, may, 1960), works(bbc, 15200)), 
	person(ann, fox, date(5, may, 1961), unemployed), 
	[person(pat, fox, date(5, may, 1983), unemployed), 
	person(jim, fox, date(5, may, 1983), unemployed)]).
	
family(person(franklin, jonson, date(7, may, 1960), unemployed),
    person(tanisha, jonson, date(9, may, 1961), works(digger, 150000)),
       []).

family(person(matthew, smith, date(7, may, 1960), works(bbc, 15200)),
    person(sophie, smith, date(9, may, 1961), works(bbc, 15200)),
       [
       person(pat, smith, date(5, may, 1983), works(cbeebies, 1200)), 
        person(jim, smith, date(5, may, 1983), works(fox, 5200))
       ]).

family(person(jim, smith, date(7, may, 1960), works(bbc, 15200)),
    person(marie, smith, date(9, may, 1961), unemployed),
       []).



children(Family, ChildList) :- 
		family(person(_, Family, _, _), _,  ChildList).

nth_member(1, [person(Person, _, _, _)|_], Person).
nth_member(N, [_|Tail], Person) :-
		nth_member(N1, Tail, Person), N is N1 + 1.
		

nthchild(N, Family, Child) :- 
		children(Family, ChildList), 
		nth_member(N, ChildList, Child).		
%4
husband(X) :- family(X,_,_).
%5
wife(X) :- family(_,X,_).
%6
child(X) :- family(_,_,Children), member(X, Children).
%7
exists(Persons) :- husband(Persons); wife(Persons); child(Persons).
%8
dateofbirth(person(_,_,Date,_),Date).
%9
salary(person(_,_,_, works(_,S)), S).
salary(person(_,_,_, unemployed), 0).

%husband(person( Name, Surname, _, works(_,Total))), Total == 15200.
%
%wife(X).
%
%husband(X)
%
%child(X).
%
%nthchild(N, Family, Child).
%
%exists( Person), dateofbirth( Person, date( _, _, Year) ), Year < 1960, salary( Person, Salary), Salary < 8OOO.
%-
%exists(person(Name,Surname,date(_,_,Y),_)), Y=<1960.
%
%exists( Person),
%dateofbirth( Person, date( _, _, Year)),
%Year > 1960,
%salary( Person, Salary),
%Salary < 8000.
%-
%nth_member(N, [_|Tail], Person)
%
%children(FamName, ChildList).
