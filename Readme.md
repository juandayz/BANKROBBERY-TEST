# BANKROBBERY-TEST  the idea to update it is by totis.

TEST VERSION.

The bank is spawned randomly on each server restart.

The script should recognize and take nearest player as a thief to execute the client side script over him.



1.Open your server_functions.sqf and at very bottom add:

```ruby
execVM "\z\addons\dayz_server\bankrobber.sqf";
```

2.Open your custom variables.sqf and in somewhere add:
```ruby
bankrobber = [];
```

3.Open your init.sqf and find this line:
```ruby
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";
```
Paste Below:
```ruby
call compile preprocessFileLineNumbers "dayz_code\init\publicEH.sqf";
```

4.Paste scripts and dayz_code folder into MPMissions\your instance\

5.Paste dayz_server\bankrobber.sqf into: @DayZ_Server\addons\dayz_server.pbo\
