#include "..\..\script_macros.hpp"

while {true} do {
	waitUntil { cursorObject isKindOf "car" && nearestObjects[player, ["car"],5] isNotEqualTo []};
	hint "lol";

	if (side(group player) == WEST) then {
		_amendaction = player addAction["Mettre une amende au véhicule", {
			_vehiculeamende = cursorObject isKindOf "car";
			hint format["%1", typeof cursorObject];
			_vehiculeamend setVariable ["amende", true, true];
			if(vehicle player getVariable "amende") then {
							player action ["getOut", _vehiculeamende];

			};
		}];
		waitUntil { !(cursorObject isKindOf "car" && nearestObjects[player, ["car"],5] isNotEqualTo [])};
		player removeAction _amendaction;
	};
};
