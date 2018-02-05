//bankrobber.sqf 
 
private ["_maxSeconds","_seconds","_robComplete","_mypos","_dir","_vault","_fill_lists","_fill"]; 
 
_maxSeconds = 240;
_seconds = 0;
_robComplete == 0;
[] execVM 'scripts\bankrobber\callPolice.sqf';
"The Vault will be filled in 4Min. Police was alerted!" call dayz_rollingMessages;
_mypos = getposATL player;
_dir = getdir player;
_mypos = [(_mypos select 0)+2*sin(_dir),(_mypos select 1)+2*cos(_dir), (_mypos select 2)];
_vault  = createVehicle ["VaultStorage",_mypos,[], 0, "CAN_COLLIDE"];
_vault setDir _dir;
_vault setposATL _mypos;		
clearWeaponCargoGlobal _vault;
clearMagazineCargoGlobal _vault; 
while {true} do {
systemChat format["COUNTDOWN: %1",_maxSeconds - _seconds];
if (_seconds >= _maxSeconds) exitWith {_robComplete == 1;"The Vault was opened!" call dayz_rollingMessages;};
_seconds = _seconds + 10;
sleep 10;
};	
	
if (_robComplete != 0) exitWith {
_fill_lists = [
[["ItemBriefcase100oz","ItemRuby","ItemGoldBar","ItemSilverBar","PartOre"]],
[["ItemBriefcase100oz","ItemObsidian","ItemTopaz","ItemSapphire","ItemSapphire","ItemSapphire","ItemSapphire"]],
[["ItemBriefcase100oz","ItemAmethyst","ItemAmethyst","ItemEmerald","ItemEmerald","ItemCitrine","ItemRuby"]]
];
_fill = _fill_lists call BIS_fnc_selectRandom;
"The Vault was opened!" call dayz_rollingMessages;
{_vault addMagazineCargoGlobal [_x,1];} forEach (_fill select 0);
waitUntil {(player distance _vault) > 50};
deleteVehicle _vault;
};
