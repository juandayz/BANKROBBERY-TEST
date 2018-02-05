//Client only
if (!isDedicated) then {
"bankrobber"  addPublicVariableEventHandler {(_this select 1) execVM "scripts\bankrobber\bankVault.sqf"}; 
};