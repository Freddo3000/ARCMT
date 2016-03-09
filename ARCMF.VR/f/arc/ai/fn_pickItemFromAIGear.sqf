_faction = param [0, "blufor"];
_category = param [1, "uniforms"];
_highest = ["", 0];
_result = false;

_items = getArray (missionConfigFile >> "CfgARCMF" >> "ai" >> "gear" >> _faction >> _category);

if (count _items > 0) then {
	{
		_class = _x select 0;
		_prob = _x select 1;
		_rand = random 1;
		
		if (_prob > (_highest select 1)) then {
			_highest = _x;
		};
		
		if (_rand <= _prob) exitWith {
			_result = _class;
		};
	} forEach _items;
} else {
	_result = false;
};

if (typeName _result != "STRING") then {
	if (count _items > 0) then {
		_result = _highest select 0;
	};
};

_result