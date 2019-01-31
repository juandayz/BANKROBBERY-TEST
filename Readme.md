# BANKROBBERY-TEST  By Jingles and me. **map buildings was taked from !!!!!MIG!!!!! version of bank robbery mod. 

TEST VERSION



INSTALL:

```
1-Drop script folder into your \mpmissions\your instance\
```

```
2-Open your custom fn_selfactions.sqf
```

2-A-Find:

```ruby
//Towing with tow truck
	
	if(_typeOfCursorTarget == "TOW_DZE") then {
		if (s_player_towing < 0) then {
			if(!(_cursorTarget getVariable ["DZEinTow", false])) then {
				s_player_towing = player addAction [localize "STR_EPOCH_ACTIONS_ATTACH" "\z\addons\dayz_code\actions\tow_AttachStraps.sqf",_cursorTarget, 0, false, true];				
			} else {
				s_player_towing = player addAction [localize "STR_EPOCH_ACTIONS_DETACH", "\z\addons\dayz_code\actions\tow_DetachStraps.sqf",_cursorTarget, 0, false, true];				
			};
		};
	} else {
		player removeAction s_player_towing;
		s_player_towing = -1;
	};
	
  ```
  
below paste:

```
 if ((_cursorTarget isKindOf "Notebook") && (player distance _cursorTarget < 5)) then {

if (s_player_bankrob < 0) then {
s_player_bankrob = player addAction ["Hack The Bank", "scripts\the_bank\main_script.sqf"];
};
} else {
player removeAction s_player_bankrob;
s_player_bankrob = -1;	
};	

 ```
 2-B-Find:
    
    ```
    player removeAction s_player_fillgen;
    s_player_fillgen = -1;
    ```
  Below paste:
  ```
   player removeAction s_player_bankrob;
 s_player_bankrob = -1;
 ```
 
 3-Open your custom variables.sqf and paste:
 
 ```
  s_player_bankrob = -1;
 ```
in somewhere with the rest of your actions.


4-Drop the bank_building.sqf into the root of your dayz_server.pbo

5-Open your server_function.sqf and find:

```
call compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\kk_functions.sqf";
```
below paste:

```
[] execVM  "\z\addons\dayz_server\bank_building.sqf";
``` 
 
 

    
    
    
   
    
 
    
 
  
