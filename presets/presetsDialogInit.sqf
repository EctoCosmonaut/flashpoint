// a new preset file (e.g "presets\myNewPreset.sqf") must return [string,code]
// where string is the title (e.g. "My New Preset mode")
// and code is whatever you want to run before setup.sqf (copy an existing preset file)
allPresets = [];
{
	allPresets = allPresets + [_x];
	lbAdd [22,(call compile preprocessFileLineNumbers ("presets\" + _x + ".sqf"))select 0];
} forEach ALL_PRESET_FILENAMES;
lbSetCurSel [22,0];

presetButtonAction = {
	_index = lbCurSel 22;
	_filename = allPresets select _index;
	_code = (call compile preprocessFileLineNumbers ("presets\" + _filename + ".sqf"))select 1;
	cutText["","black",1];
	call _code;
	closeDialog 0;
	execVM "setup.sqf";
};