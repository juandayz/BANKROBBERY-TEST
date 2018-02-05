

private ["_hint","_Remote_Msg","_timeBeforRunAgain","_bankPos","_nearestPlayer","_thief","_bankMarker","_shelter","_shelterPos"];
_Remote_Msg = 1;
_timeBeforRunAgain = 3600; //1 hs
_bankPos = [getMarkerPos "center",0,5500,10,0,2000,0] call BIS_fnc_findSafePos;
_shelter = createVehicle ["Land_MBG_HeavyShelter",[(_bankPos select 0) - 3, (_bankPos select 1) + 1,-0.12],[], 0, "CAN_COLLIDE"];
_shelter setDir 0;
_shelter setVectorUp surfaceNormal position _shelter;
_shelter addEventHandler ["handleDamage", {false}];
_shelterPos = getpos _shelter;
_bankMarker = createMarker ["bank", _shelterPos];
_bankMarker setMarkerText "THEBANK";
_bankMarker setMarkerType "SupplyVehicle";
_bankMarker setMarkerColor "ColorRed";
_bankMarker setMarkerBrush "Solid";
_bankMarker setMarkerSize [0.5,0.5];


if(isNil "script_in_progress")then{script_in_progress = false;};

while {true} do {
waitUntil{{isPlayer _x && _x distance _bankPos < 5  } count playableunits > 0};


if(script_in_progress)exitwith{};
script_in_progress = true;


//MSG
if (_Remote_Msg != 1) then {[nil,nil,rTitleText,"The Bank is getting robbed!", "PLAIN",6] call RE;}else{
_hint = parseText format[
"<t align='center' color='#31db3c' shadow='2' size='1.75'>INCIDENT!</t>
<br/>
<t align='center' color='#ffffff'>The Bank is getting robbed!.</t>"
];
RemoteMessage = ['hint', _hint];
publicVariable "RemoteMessage";
};
// 
 

_nearestPlayer = _bankPos nearEntities ["AllVehicles", 5];
{
if (!isNull _x) then {
          if ((getPlayerUID _x) != "") then {
            _thief = _x;
if (isPlayer _thief) then {
bankrobber = [_x,3.5];
publicVariable "bankrobber";
};
};
};
}count _nearestPlayer;
 
uiSleep _timeBeforRunAgain;
script_in_progress = false;
};
 
   
