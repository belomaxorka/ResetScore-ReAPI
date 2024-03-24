#include <amxmodx>
#include <reapi>

#pragma semicolon 1

public plugin_init()
{
	register_plugin("[ReAPI] Reset Score", "1.0.0", "Community");
	register_dictionary("resetscore.txt");

	register_clcmd("resetscore", "resetscore");
	register_clcmd("rs", "resetscore");
	register_clcmd("say /rs", "resetscore");
	register_clcmd("say_team /rs", "resetscore");
}

public resetscore(id)
{
	if (!is_user_connected(id))
	{
		return;
	}

	set_entvar(id, var_frags, 0.0);
	set_member(id, m_iDeaths, 0);

	client_print_color(id, print_team_default, "%l %l", "RS_TAG", "RS_SUCCESS");
	client_cmd(id, "spk buttons/blip1.wav");

	message_begin(MSG_ALL, 85);
	write_byte(id);
	write_short(0); write_short(0); write_short(0); write_short(0);
	message_end();
}
