private ["_Remote_Msg","_bankPos","_shelter","_shelterPos","_vault","_bankMarker","_missiontimeout","_cleanmission","_playerPresent","_starttime","_currenttime",
"_rewards","_weapons","_wavegroup1","_pos","_SpawnPos","_WaveSpawnLocation","_playercount"];


_Remote_Msg = 1;

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

_bankPos = [getMarkerPos "center",0,5500,10,0,2000,0] call BIS_fnc_findSafePos;
_shelter = createVehicle ["Land_MBG_HeavyShelter",[(_bankPos select 0) - 3, (_bankPos select 1) + 1,-0.12],[], 0, "CAN_COLLIDE"];
_shelter setDir 0;
_shelter setVectorUp surfaceNormal position _shelter;
_shelter addEventHandler ["handleDamage", {false}];
_shelterPos = getpos _shelter;
_vault  = createVehicle ["VaultStorage",_shelterPos,[], 0, "CAN_COLLIDE"];
clearWeaponCargoGlobal _vault;
clearMagazineCargoGlobal _vault; 
if ([0.50] call fn_chance) then {
_vault addMagazineCargoGlobal ["ItemRuby",2];
_vault addMagazineCargoGlobal ["ItemTopaz",2];
_vault addMagazineCargoGlobal ["ItemSapphire",2];
_vault addMagazineCargoGlobal ["ItemObsidian",2];
}else{
_vault addMagazineCargoGlobal ["ItemAmethyst",4];
_vault addMagazineCargoGlobal ["ItemEmerald",4];
_vault addMagazineCargoGlobal ["ItemCitrine",5];
_vault addMagazineCargoGlobal "ItemBriefcase100oz";
};



_bankMarker = createMarker ["bank", _shelterPos];
_bankMarker setMarkerText "THEBANK";
_bankMarker setMarkerType "SupplyVehicle";
_bankMarker setMarkerColor "ColorRed";
_bankMarker setMarkerBrush "Solid";
_bankMarker setMarkerSize [0.5,0.5];


//////////////////////////check for players to start despawn
_missiontimeout = true;
_cleanmission = false;
_playerPresent = false;
_starttime = floor(time);
while {_missiontimeout} do {
    sleep 10;
    _currenttime = floor(time);
    {
	if((isPlayer _x) && (_x distance _shelterPos <= 100)) then {
	_playerPresent = true;
	};
	}forEach playableUnits;//check for nearest players
    
	if (_currenttime - _starttime >= _deltime) then {
	_cleanmission = true;
	};
    if ((_playerPresent) || (_cleanmission)) then {
	_missiontimeout = false;
	};
};

if (_playerPresent) then {
_pos           = getpos player;
_SpawnPos = [
[(_pos select 0) - 25.5, (_pos select 1) - 31,-0.012],
[(_pos select 0) - 28, (_pos select 1) - 50,-0.012],
[(_pos select 0) + 33, (_pos select 1) + 29,-0.012],
[(_pos select 0) - 25.5, (_pos select 1) - 31,-0.012],
[(_pos select 0) - 21, (_pos select 1) - 30,-0.012],
[(_pos select 0) + 54, (_pos select 1) + 29,-0.012]
];
_WaveSpawnLocation = _SpawnPos call BIS_fnc_selectRandom; 


//ADD RANDOM ITEMS//ONLY ONE PER AI
_rewards= ["HandGrenade_West","HandGrenade_West","HandGrenade_West","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemAntibiotic","ItemAntibiotic",
            "ItemAntibiotic","HandGrenade_West","ItemTent","ItemMixOil","ItemSandbag","ItemSandbag"]call BIS_fnc_selectRandom;
 
//RANDOMIZE THE WAPONS FOR AI
_weapons = ["G36C_ACOG_DZ","G36K_Camo_DZ","M16A2_GL_DZ","M16A4_GL_ACOG_MFL_DZ","M4A1_MFL_DZ"]call BIS_fnc_selectRandom;
 
//Define AI
_wavegroup1 = [_WaveSpawnLocation, EAST,["Policeman","Policeman","Policeman","Policeman","Policeman","Policeman"]] call BIS_fnc_spawnGroup;


        {
        _x doMove _pos;
                       _x setBehaviour "COMBAT";
                       _x setCombatMode "RED";
                       _x setSkill 1;
                       removeAllWeapons _x;
                       removeAllItems _x;
                      _x addMagazine _rewards;
                      _x addMagazine "30Rnd_556x45_Stanag";
                      _x addMagazine "30Rnd_556x45_Stanag";
                      _x addMagazine "30Rnd_556x45_Stanag";
                      _x addMagazine "30Rnd_556x45_Stanag";
                      _x addMagazine "30Rnd_556x45_Stanag";
                      _x addWeapon    _weapons;
                      _x setVariable ["bodyName","unknown",true];
 
        } foreach units _wavegroup1;
};		

if (_cleanmission) then {
deleteVehicle _shelter;
deleteVehicle _vault;
deleteMarker _bankMarker;
_playercount = ({isPlayer _x } count (_shelterPos nearEntities[['AllVehicles'], 200]));
_ai_to_be_removed = _shelterPos nearEntities ["Man",280];
{
if ((_x in allunits) and !(_x in serverTraders) and !(_x in playableunits)) then{
if (_playercount < 1) then {
_x setdamage 1;
deletevehicle _x;
};
};
} forEach _ai_to_be_removed;


};
