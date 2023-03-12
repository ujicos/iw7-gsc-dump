// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_A4AD = [];
    level._id_A4AD["juggernaut"] = spawnstruct();
    level._id_A4AD["juggernaut"]._id_10A41 = "used_juggernaut";
    level._id_A4AD["juggernaut_recon"] = spawnstruct();
    level._id_A4AD["juggernaut_recon"]._id_10A41 = "used_juggernaut_recon";
    level._id_A4AD["juggernaut_maniac"] = spawnstruct();
    level._id_A4AD["juggernaut_maniac"]._id_10A41 = "used_juggernaut_maniac";
    level thread _id_13AB0();
}

_id_8371( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 0.05;

    if ( isdefined( self._id_ACAE ) )
        scripts\mp\perks\perkfunctions::_id_12CE5();

    scripts\mp\weapons::_id_5608();

    if ( scripts\mp\utility\game::_id_12D6( "specialty_explosivebullets" ) )
        scripts\mp\utility\game::_id_E150( "specialty_explosivebullets" );

    self.health = self.maxhealth;
    var_1 = 1;

    switch ( var_0 )
    {
        case "juggernaut":
            self.isjuggernaut = 1;
            self._id_A4AA = 0.8;
            scripts\mp\class::giveloadout( self.pers["team"], var_0, 0 );
            self._id_BCF6 = 0.8;
            scripts\mp\utility\game::giveperk( "specialty_scavenger" );
            scripts\mp\utility\game::giveperk( "specialty_quickdraw" );
            scripts\mp\utility\game::giveperk( "specialty_detectexplosive" );
            scripts\mp\utility\game::giveperk( "specialty_sharp_focus" );
            scripts\mp\utility\game::giveperk( "specialty_radarjuggernaut" );
            break;
        case "juggernaut_recon":
            self._id_9E5E = 1;
            self._id_A4AA = 0.8;
            scripts\mp\class::giveloadout( self.pers["team"], var_0 );
            self._id_BCF6 = 0.8;
            scripts\mp\utility\game::giveperk( "specialty_scavenger" );
            scripts\mp\utility\game::giveperk( "specialty_coldblooded" );
            scripts\mp\utility\game::giveperk( "specialty_noscopeoutline" );
            scripts\mp\utility\game::giveperk( "specialty_detectexplosive" );
            scripts\mp\utility\game::giveperk( "specialty_sharp_focus" );
            scripts\mp\utility\game::giveperk( "specialty_radarjuggernaut" );

            if ( !isagent( self ) )
            {
                self _meth_81F3( self );
                scripts\mp\missions::_id_D992( "ch_airdrop_juggernaut_recon" );
            }

            break;
        case "juggernaut_maniac":
            self._id_9E5D = 1;
            self._id_A4AA = 1.15;
            scripts\mp\class::giveloadout( self.pers["team"], var_0, 0 );
            scripts\mp\utility\game::giveperk( "specialty_blindeye" );
            scripts\mp\utility\game::giveperk( "specialty_coldblooded" );
            scripts\mp\utility\game::giveperk( "specialty_noscopeoutline" );
            scripts\mp\utility\game::giveperk( "specialty_detectexplosive" );
            scripts\mp\utility\game::giveperk( "specialty_marathon" );
            scripts\mp\utility\game::giveperk( "specialty_falldamage" );
            self._id_BCF6 = 1.15;
            break;
        default:
            var_1 = self [[ level._id_B331 ]]( var_0 );
            break;
    }

    if ( _id_CA4E( "specialty_hardline" ) )
        scripts\mp\utility\game::giveperk( "specialty_hardline" );

    scripts\mp\weapons::_id_12ED5();
    self _meth_80A9();

    if ( !isagent( self ) )
    {
        if ( var_1 )
        {
            self setclientomnvar( "ui_juggernaut", 1 );
            thread scripts\mp\utility\game::_id_115DE( level._id_A4AD[var_0]._id_10A41, self );
            thread _id_A4A9();
            thread _id_139F1();
            thread _id_13A13();
        }
    }

    if ( self._id_110F4 == "specialist" )
        thread scripts\mp\killstreaks\killstreaks::_id_41C0();

    thread _id_A4AC();

    if ( isdefined( self._id_3AF4 ) )
    {
        wait 0.05;
        self attach( self._id_3AF4, "J_spine4", 1 );
    }

    level notify( "juggernaut_equipped", self );
    scripts\mp\matchdata::_id_AFC9( var_0, self.origin );
}

_id_CA4E( var_0 )
{
    var_1 = self.pers["loadoutPerks"];

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0 )
            return 1;
    }

    return 0;
}

_id_A4A9()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "jugg_removed" );

    for (;;)
    {
        wait 3.0;
        scripts\mp\utility\game::_id_D4FB( self, "juggernaut_breathing_player", "juggernaut_breathing_sound" );
    }
}

_id_13AB0()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "host_migration_end" );

        foreach ( var_1 in level.players )
        {
            if ( isai( var_1 ) )
                continue;
            else
            {
                if ( var_1 scripts\mp\utility\game::isjuggernaut() && !( isdefined( var_1._id_9E5C ) && var_1._id_9E5C ) )
                {
                    var_1 setclientomnvar( "ui_juggernaut", 1 );
                    continue;
                }

                var_1 setclientomnvar( "ui_juggernaut", 0 );
            }
        }
    }
}

_id_A4AC()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "jugg_removed" );
    thread _id_A4AB();
    scripts\engine\utility::waittill_any( "death", "joined_team", "joined_spectators", "lost_juggernaut" );
    self _meth_80DB();
    self.isjuggernaut = 0;
    self._id_9E5A = 0;
    self._id_9E5B = 0;
    self._id_9E5E = 0;
    self._id_9E5D = 0;
    self._id_9E5C = 0;

    if ( isplayer( self ) )
        self setclientomnvar( "ui_juggernaut", 0 );

    self _meth_83CC( "specialty_radarjuggernaut", 1 );
    self notify( "jugg_removed" );
}

_id_A4AB()
{
    self endon( "disconnect" );
    self endon( "jugg_removed" );
    level waittill( "game_ended" );

    if ( isplayer( self ) )
        self setclientomnvar( "ui_juggernaut", 0 );
}

_id_F766()
{
    if ( isdefined( self._id_8C98 ) )
    {
        self _meth_8096( self._id_8C98, "" );
        self._id_8C98 = undefined;
    }

    self setmodel( "mp_fullbody_juggernaut_heavy_black" );
    self setviewmodel( "viewhands_juggernaut_ally" );
    self _meth_82C6( "vestheavy" );
}

_id_F767()
{
    if ( isdefined( self._id_8C98 ) )
    {
        self _meth_8096( self._id_8C98, "" );
        self._id_8C98 = undefined;
    }

    self setmodel( "mp_fullbody_heavy" );
    self setviewmodel( "viewhands_juggernaut_ally" );
    self attach( "mp_warfighter_head_1", "", 1 );
    self._id_8C98 = "mp_warfighter_head_1";
    self _meth_82C6( "nylon" );
}

_id_55F4()
{
    if ( scripts\mp\utility\game::isjuggernaut() )
    {
        self._id_A4A4 = 1;
        self setclientomnvar( "ui_juggernaut", 0 );
    }
}

_id_626C()
{
    if ( scripts\mp\utility\game::isjuggernaut() )
    {
        self._id_A4A4 = undefined;
        self setclientomnvar( "ui_juggernaut", 1 );
    }
}

_id_139F1()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "jugg_removed" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( !isdefined( self._id_A4A4 ) && scripts\mp\utility\game::isusingremote() )
        {
            self waittill( "black_out_done" );
            _id_55F4();
        }

        wait 0.05;
    }
}

_id_13A13()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "jugg_removed" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( isdefined( self._id_A4A4 ) && !scripts\mp\utility\game::isusingremote() )
            _id_626C();

        wait 0.05;
    }
}

_id_988F( var_0, var_1, var_2, var_3 )
{
    level._id_B331 = var_0;
    level._id_B333 = var_1;
    level._id_B332 = var_3;
    game["allies_model"]["JUGGERNAUT_CUSTOM"] = var_2;
    game["axis_model"]["JUGGERNAUT_CUSTOM"] = var_2;
}
