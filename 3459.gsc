// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "agent", ::_id_12905 );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "recon_agent", ::_id_128F8 );
}

setup_callbacks()
{
    level.agent_funcs["squadmate"] = level.agent_funcs["player"];
    level.agent_funcs["squadmate"]["think"] = ::_id_10AEA;
    level.agent_funcs["squadmate"]["on_killed"] = ::_id_C4AA;
    level.agent_funcs["squadmate"]["on_damaged"] = scripts\mp\agents\agents::on_agent_player_damaged;
    level.agent_funcs["squadmate"]["gametype_update"] = ::_id_BFF0;
}

_id_BFF0()
{
    return 0;
}

_id_12905( var_0, var_1 )
{
    return _id_130DB( "agent" );
}

_id_128F8( var_0, var_1 )
{
    return _id_130DB( "reconAgent" );
}

_id_130DB( var_0 )
{
    if ( scripts\mp\agents\agent_utility::_id_8008( "squadmate" ) >= 5 )
    {
        self iprintlnbold( &"KILLSTREAKS_AGENT_MAX" );
        return 0;
    }

    if ( scripts\mp\agents\agent_utility::_id_8010( self ) >= 2 )
    {
        self iprintlnbold( &"KILLSTREAKS_AGENT_MAX" );
        return 0;
    }

    var_1 = scripts\mp\agents\agent_utility::_id_81FB( 0, 1 );

    if ( !isdefined( var_1 ) )
        return 0;

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
        return 0;

    var_2 = var_1.origin;
    var_3 = vectortoangles( self.origin - var_1.origin );
    var_4 = scripts\mp\agents\agents::_id_16F2( "squadmate", self.team, undefined, var_2, var_3, self, 0, 0, "veteran" );

    if ( !isdefined( var_4 ) )
    {
        self iprintlnbold( &"KILLSTREAKS_AGENT_MAX" );
        return 0;
    }

    var_4._id_A6BB = var_0;

    if ( var_4._id_A6BB == "reconAgent" )
    {
        var_4 thread _id_F22B( "iw6_riotshield_mp" );
        var_4 thread _id_6CE2();
        var_4 thread scripts\mp\class::giveloadout( self.pers["team"], "reconAgent", 0 );
        var_4 scripts\mp\agents\agent_common::set_agent_health( 250 );
        var_4 scripts\mp\perks\perkfunctions::_id_F785();
        var_4 setmodel( "mp_fullbody_synaptic_1" );
        var_4 _meth_8096( var_4._id_8C98 );
        var_4._id_8C98 = undefined;
    }
    else
        var_4 scripts\mp\perks\perkfunctions::_id_F785();

    var_4 scripts\mp\utility\game::_id_13CE( "player_name_bg_green_agent", "player_name_bg_red_agent" );
    return 1;
}

_id_6CE2()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "giveLoadout" );
    scripts\mp\perks\perkfunctions::_id_F785();
    scripts\mp\utility\game::giveperk( "specialty_quickswap" );
    scripts\mp\utility\game::giveperk( "specialty_regenfaster" );
    self botsetdifficultysetting( "minInaccuracy", 1.5 * self botgetdifficultysetting( "minInaccuracy" ) );
    self botsetdifficultysetting( "maxInaccuracy", 1.5 * self botgetdifficultysetting( "maxInaccuracy" ) );
    self botsetdifficultysetting( "minFireTime", 1.5 * self botgetdifficultysetting( "minFireTime" ) );
    self botsetdifficultysetting( "maxFireTime", 1.25 * self botgetdifficultysetting( "maxFireTime" ) );
}

_id_F22B( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "giveLoadout" );

    if ( !isdefined( var_0 ) )
        var_0 = "iw6_riotshield_mp";

    self notify( "weapon_change", var_0 );
}

_id_10AEA()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "owner_disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self botsetflag( "prefer_shield_out", 1 );
        var_0 = self [[ scripts\mp\agents\agent_utility::agentfunc( "gametype_update" ) ]]();

        if ( !var_0 )
        {
            if ( !scripts\mp\bots\bots_util::_id_2DDA( self.owner ) )
                scripts\mp\bots\bots_strategy::_id_2DC1( self.owner, 350 );
        }

        wait 0.05;
    }
}

_id_C4AA( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    scripts\mp\agents\agents::_id_C4B3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, 0 );

    if ( isplayer( var_1 ) && isdefined( self.owner ) && var_1 != self.owner )
    {
        self.owner scripts\mp\utility\game::leaderdialogonplayer( "squad_killed" );
        scripts\mp\damage::onkillstreakkilled( "squad_mate", var_1, var_4, var_3, var_2, "destroyed_squad_mate" );
    }

    scripts\mp\agents\agent_utility::deactivateagent();
}
