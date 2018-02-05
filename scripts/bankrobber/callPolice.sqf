//JUANS BOTS//
private ["_pos","_WaveSpawnLocation","_WaveSpawnLocation2","_WaveSpawnLocation3","_WaveSpawnLocation4","_WaveSpawnLocation5","_WaveSpawnLocation6","_WaveSpawnLocation7"
        ,"_wavegroup1","_wavegroup2","_wavegroup3","_wavegroup4","_wavegroup5","_wavegroup6","_wavegroup7","_rewards","_weapons"];
 
_pos           = getpos player;
 
_WaveSpawnLocation = [6056.3, 8707.8, 0.0014];
_WaveSpawnLocation2 = [2425.56, 7693.55, 0.0014];
_WaveSpawnLocation3 = [6101, 8703.7, 0.0014];
_WaveSpawnLocation4 = [6122.17, 8675, 0.0014];
_WaveSpawnLocation5 = [6093.7, 8632.8, 0.0014];
_WaveSpawnLocation6 = [6045.32, 8639.8, 0.0014];
_WaveSpawnLocation7 = [6033.3, 8687.8, 0.0014];
 
//Define AI
_wavegroup1 = [_WaveSpawnLocation, EAST,["Policeman","Policeman","Policeman"]] call BIS_fnc_spawnGroup;
_wavegroup2 = [_WaveSpawnLocation2, EAST,["Policeman","Policeman","Policeman"]] call BIS_fnc_spawnGroup;
_wavegroup3 = [_WaveSpawnLocation3, EAST,["Policeman","Policeman","Policeman"]] call BIS_fnc_spawnGroup;
_wavegroup4 = [_WaveSpawnLocation4, EAST,["Policeman","Policeman","Policeman"]] call BIS_fnc_spawnGroup;
_wavegroup5 = [_WaveSpawnLocation5, EAST,["Policeman","Policeman","Policeman"]] call BIS_fnc_spawnGroup;
_wavegroup6 = [_WaveSpawnLocation6, EAST,["Policeman","Policeman","Policeman","Policeman","Policeman"]] call BIS_fnc_spawnGroup;
_wavegroup7 = [_WaveSpawnLocation7, EAST,["Policeman","Policeman","Policeman"]] call BIS_fnc_spawnGroup;
 
//ADD RANDOM ITEMS//ONLY ONE PER AI
_rewards= ["HandGrenade_West","HandGrenade_West","HandGrenade_West","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemAntibiotic","ItemAntibiotic",
            "ItemAntibiotic","HandGrenade_West","ItemTent","ItemMixOil","ItemSandbag","ItemSandbag"]call BIS_fnc_selectRandom;
 
//RANDOMIZE THE WAPONS FOR AI
_weapons = ["G36C_ACOG_DZ","G36K_Camo_DZ","M16A2_GL_DZ","M16A4_GL_ACOG_MFL_DZ","M4A1_MFL_DZ"]call BIS_fnc_selectRandom;
 
 
//CREATE THE AI GROUP 1
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
       
//CREATE THE AI GROUP2
        {
        //_x doMove _pos;
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
 
        } foreach units _wavegroup2;  
 
//CREATE THE AI GROUP3
        {
        //_x doMove _pos;
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
 
        } foreach units _wavegroup3;
       
//CREATE THE AI GROUP 4
        {
        //_x doMove _pos;
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
 
        } foreach units _wavegroup4;
       
//CREATE THE AI GROUP 5
        {
        //_x doMove _pos;
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
 
        } foreach units _wavegroup5;  
 
//CREATE THE AI GROUP 6
        {
        //_x doMove _pos;
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
 
        } foreach units _wavegroup6;
       
//CREATE THE AI GROUP 7
        {
        //_x doMove _pos;
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
 
        } foreach units _wavegroup7;