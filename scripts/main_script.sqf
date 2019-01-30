private ["_item1","_item2","_maxSeconds","_seconds","_playerNear","_inzone","_range","_zone"];

_playerNear = {isPlayer _x} count (([player] call FNC_GetPos) nearEntities ["CAManBase",5]) > 1;
if (_playerNear) exitWith {localize "STR_EPOCH_PLAYER_84" call dayz_rollingMessages;};


if(isNil "script_in_progress")then{
        script_in_progress = false;
};
 
if(script_in_progress)exitwith{
    systemChat "The bank is empty";
};
script_in_progress = true;

_zone = [7019.1758, 7635.146,0];//bank coords    
_range = 50;
_inzone = 1;
                    

//config loot
_item1= ["ItemRuby","ItemTopaz","ItemSapphire"]call BIS_fnc_selectRandom;
_item2= ["ItemObsidian","ItemAmethyst","ItemEmerald","ItemBriefcase100oz"]call BIS_fnc_selectRandom;

_maxSeconds = 60;
_seconds = 0;

execVM "the_bank\security.sqf";//call ai
player switchMove "";
player playActionNow "Medic";
while {true} do {
if ((player distance _zone) > _range) exitWith {_inzone = 0;};
systemChat format["COUNTDOWN: %1",_maxSeconds - _seconds];
if (_seconds >= _maxSeconds) exitWith {"opened! collect rewards from the ground!" call dayz_rollingMessages;};
if (_seconds == 30) then {"im Trying...Im Trying" call dayz_rollingMessages;};
_seconds = _seconds + 10;
sleep 10;
};        
 
if (_inzone == 0) exitWith {"FAIL! you leave the bank area" call dayz_rollingMessages;};
 
[nil,nil,rTitleText,"The bank has been robbed successfully!", "PLAIN",10] call RE;
    
    
if ([0.50] call fn_chance) then {
[_item1,1,(round(random 4)*4)] call fn_dropItem;
[_item2,1,(round(random 4)*6)] call fn_dropItem;
}else{
[_item1,1,(round(random 4)*8)] call fn_dropItem;
[_item2,1,(round(random 4)*10)] call fn_dropItem;
};
    
 
sleep 900; 
script_in_progress = false; 
