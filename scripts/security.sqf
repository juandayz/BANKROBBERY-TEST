private ["_SpawnPos2","_WaveSpawnLocation2","_wavegroup2","_rewards2","_weapons","_SpawnPos","_firstWave","_pos","_rewards","_WaveSpawnLocation","_wavegroup1"];
   
_firstWave = 5;  
_pos     = [7019.1758, 7635.146, 1.1120623];//This pos is used as center of the custom place where ai is located.
 
//sleep
uiSleep _firstWave;
 
 
//RADOM POSITIONS AROUND _POS COORDS TO SPAWN.
_SpawnPos = [
[7117.0615, 7682.4253, -3.0517578e-005],[7116.8257, 7683.9414, 3.0517578e-005],[7065.1577, 7668.9253, 3.0517578e-005]
]call BIS_fnc_selectRandom;
_WaveSpawnLocation = _SpawnPos;
 
 
 
_SpawnPos2 = [
[(_pos select 0) - 50.5, (_pos select 1) - 21,-0.012],
[(_pos select 0) - 20, (_pos select 1) - 20,-0.012],
[(_pos select 0) + 25, (_pos select 1) + 5,-0.012],
[(_pos select 0) + 16, (_pos select 1) - 14,-0.012],
[(_pos select 0) + 49, (_pos select 1) + 17.5,-0.012],
[(_pos select 0) + 38.5, (_pos select 1) - 16,-0.012]
];
_WaveSpawnLocation2 = _SpawnPos2 call BIS_fnc_selectRandom;
 
//RADOM POSITIONS AROUND _POS COORDS TO SPAWN.
 
 
//CREATE THE AI WAVE [Position,Side,"AMOUNT AND TYPE OF UNITS]
_wavegroup1 = [_WaveSpawnLocation, EAST,["RUS_Commander","TK_Soldier_Officer_EP1","MVD_Soldier_GL","TK_Soldier_EP1","TK_Soldier_EP1"]] call BIS_fnc_spawnGroup;    
_wavegroup2 = [_WaveSpawnLocation2, EAST,["RU_Soldier_Officer","RU_Soldier_Pilot","CZ_Soldier_Spec2_Wdl_ACR","TK_Soldier_EP1","TK_Soldier_EP1"]] call BIS_fnc_spawnGroup;
 
 
//ADD RANDOM ITEMS//ONLY ONE PER AI
_rewards= ["HandGrenade_West","ItemBloodbag","ItemAntibiotic","ItemTent","ItemMixOil","ItemSandbag"]call BIS_fnc_selectRandom;
_rewards2= ["HandGrenade_West","ItemBloodbag","ItemAntibiotic","ItemTent","ItemMixOil","ItemSandbag"]call BIS_fnc_selectRandom;
 
 
 
//RANDOMIZE THE WAPONS FOR AI
_weapons = ["M4A1_DZ","M16A4_ACOG_DZ","m8_carbine"]call BIS_fnc_selectRandom;
_weapons2 = ["M4A1_DZ","M16A4_ACOG_DZ","m8_carbine"]call BIS_fnc_selectRandom;
 
 
 
//CREATE THE AI GROUP
        {
        _x doMove _pos;
                       _x setBehaviour "COMBAT";
                       _x setCombatMode "RED";
                       _x setSkill 0.6;
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
 
 
{
        _x doMove position player;
                       _x setBehaviour "COMBAT";
                       _x setCombatMode "RED";
                       _x setSkill 0.6;
                       removeAllWeapons _x;
                       removeAllItems _x;
                      _x addMagazine _rewards2;
                      _x addMagazine "30Rnd_556x45_Stanag";
                      _x addMagazine "30Rnd_556x45_Stanag";
                      _x addMagazine "30Rnd_556x45_Stanag";
                      _x addMagazine "30Rnd_556x45_Stanag";
                      _x addMagazine "30Rnd_556x45_Stanag";
                      _x addWeapon    _weapons2;
                      _x addBackPack    "DZ_Patrol_Pack_EP1";
                      _x setVariable ["bodyName","unknown",true];              
                   
        } foreach units _wavegroup2;