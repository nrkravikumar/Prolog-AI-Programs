%TSP Using Heuristic

road(bangalore,delhi, 9).
road(hyderabad,bangalore, 3).
road(hyderabad,delhi, 6).
road(hyderabad,vijayawada, 5).
road(vijayawada,hyderabad, 5).
road(chennai,hyderabad, 4).
road(chennai,vijayawada, 8).

get_road(Start, End, Visited, Result) :-
get_road(Start, End, [Start], 0, Visited, Result).

get_road(Start, End, Waypoints, DistanceAcc, Visited, TotalDistance) :-
road(Start, End, Distance),reverse([End|Waypoints], Visited),
TotalDistance is DistanceAcc + Distance.

get_road(Start, End, Waypoints, DistanceAcc, Visited, TotalDistance) :-
road(Start, Waypoint, Distance),\+ member(Waypoint, Waypoints),
NewDistanceAcc is DistanceAcc + Distance,get_road(Waypoint,End,
[Waypoint|Waypoints],NewDistanceAcc,Visited,TotalDistance).

%Input:
	get_road(chennai,delhi,Visited,Distance).

%Output:
	Distance = 10,
	Visited = [chennai, hyderabad, delhi]

%Input:
	get_road(chennai,bangalore,Visited,Distance).

%Output:
	Distance = 7,
	Visited = [chennai, hyderabad, bangalore]



