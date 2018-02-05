//bankrobber.sqf 
 
private ["_maxSeconds","_seconds","_robComplete","_mypos","_dir","_vault"]; 
 
_maxSeconds = 240;
_seconds = 0;
_robComplete = 0;

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
if (_seconds >= _maxSeconds) exitWith {_robComplete = 1;"The Vault was opened!" call dayz_rollingMessages;};
if (_seconds == 30) then {[] execVM 'scripts\bankrobber\callPolice.sqf';};
_seconds = _seconds + 10;
sleep 10;
};	
	
if (_robComplete != 0) exitWith {
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

waitUntil {(player distance _vault) > 50};
deleteVehicle _vault;
};
