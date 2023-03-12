// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._effect["vfx_phase_shift_trail_friendly"] = loadfx( "vfx/iw7/_requests/mp/vfx_phase_shift_body_fr.vfx" );
    level._effect["vfx_phase_shift_trail_enemy"] = loadfx( "vfx/iw7/_requests/mp/vfx_phase_shift_body_en.vfx" );
    level._effect["vfx_screen_flash"] = loadfx( "vfx/core/mp/core/vfx_screen_flash" );
}

_id_E154( var_0 )
{
    if ( scripts\mp\utility\game::istrue( self.phaseshift_active ) )
    {
        if ( !scripts\mp\utility\game::istrue( var_0 ) )
        {
            if ( scripts\mp\utility\game::_id_12D6( "specialty_ftlslide" ) )
            {
                if ( scripts\mp\utility\game::_id_9D46() && level.tactical )
                    self _meth_845A( "assassin_mlgslide_mp_tactical" );
                else if ( scripts\mp\utility\game::_id_9D46() )
                    self _meth_845A( "assassin_mlgslide_mp" );
                else if ( level.tactical )
                    self _meth_845A( "assassin_slide_mp_tactical" );
                else
                    self _meth_845A( "assassin_slide_mp" );
            }
            else
                self _meth_845A( "assassin_mp" );

            if ( scripts\mp\utility\game::istrue( self.phaseshift_removedtracker ) )
                scripts\mp\utility\game::giveperk( "specialty_tracker" );

            scripts\mp\utility\game::_id_E150( "specialty_blindeye" );
            scripts\mp\utility\game::_id_E150( "specialty_radarringresist" );
            scripts\engine\utility::_id_1C58( 1 );
            scripts\engine\utility::_id_1C6E( 1 );
            scripts\mp\utility\game::_id_1C47( 1 );
            self._id_38ED = 1;
            self setscriptablepartstate( "compassicon", "defaulticon", 0 );
            scripts\mp\utility\game::_id_8ECC();
            self playlocalsound( "ftl_phase_in" );
            self playsound( "ftl_phase_in_npc" );
            self visionsetnakedforplayer( "", 0.1 );
        }
        else
            self visionsetnakedforplayer( "", 0.0 );

        self _meth_8070( 0.1 );
        _id_F7E3( 0 );
        thread restartweaponvfx();
        self.phaseshift_active = undefined;
        self.phaseshift_removedtracker = undefined;
    }
}

_id_E88D()
{
    if ( !scripts\mp\utility\game::istrue( self.phaseshift_active ) )
    {
        _id_6626( 0, 4.0 );
        return 1;
    }

    return 0;
}

_id_6626( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 4.0;

    self _meth_845A( "assassin_mp_phase" );
    self notify( "phase_shift_start" );
    thread _id_4524( 3 );
    _id_F7E3( 1 );
    thread restartweaponvfx();
    self visionsetnakedforplayer( "phase_shift_mp", 0.1 );
    self playlocalsound( "ftl_phase_out" );
    self playsound( "ftl_phase_out_npc" );
    _id_2A71( self, var_1 );
    self _meth_82C0( "phaseshift_mp_shock", 0.1 );
    scripts\engine\utility::_id_1C58( 0 );
    scripts\mp\equipment\peripheral_vision::_id_CA2A();
    self setscriptablepartstate( "compassicon", "hideIcon", 0 );
    scripts\mp\utility\game::_id_8ECD();
    scripts\mp\utility\game::giveperk( "specialty_blindeye" );
    scripts\mp\utility\game::giveperk( "specialty_radarringresist" );
    scripts\engine\utility::_id_1C6E( 0 );
    scripts\mp\utility\game::_id_1C47( 0 );
    self._id_38ED = 0;

    if ( scripts\mp\utility\game::_id_12D6( "specialty_tracker" ) )
    {
        scripts\mp\utility\game::_id_E150( "specialty_tracker" );
        self.phaseshift_removedtracker = 1;
    }

    self.phaseshift_active = 1;
}

restartweaponvfx()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "startWeaponVFX" );
    self endon( "restartWeaponVFX" );
    var_0 = self getcurrentprimaryweapon();
    scripts\mp\weapons::clearweaponscriptvfx( var_0, scripts\mp\utility\game::istrue( self _meth_8519( var_0 ) ) );
    scripts\engine\utility::waitframe();
    var_0 = self getcurrentprimaryweapon();
    scripts\mp\weapons::runweaponscriptvfx( var_0, scripts\mp\utility\game::istrue( self _meth_8519( var_0 ) ) );
}

_id_6978( var_0 )
{

}

_id_10918( var_0 )
{
    var_1 = spawn( "script_model", self.origin );
    var_1 setmodel( "tag_origin" );

    if ( getdvarint( "bg_thirdPerson" ) == 0 )
        var_1 _meth_8429( self );

    wait 0.1;
    _func_29A( scripts\engine\utility::_id_7ECB( var_0 + "_friendly" ), var_1, "tag_origin", self.team );
    _func_29A( scripts\engine\utility::_id_7ECB( var_0 ), var_1, "tag_origin", scripts\mp\utility\game::_id_8027( self.team ) );
    wait 0.15;
    var_1 delete();
}

_id_108EE( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawn( "script_model", var_1.origin );
    var_5.angles = var_1.angles;
    var_5 setmodel( "tag_origin" );
    var_5.owner = var_1;
    var_5._id_CACB = var_2;
    var_5._id_762C = var_0;
    wait 0.1;

    if ( var_1 == var_2 )
    {
        _func_29A( var_0, var_5, "tag_origin", var_3 );
        var_5 _meth_8429( var_2 );
    }
    else
        playfxontagforclients( var_0, var_5, "tag_origin", var_2 );

    var_5 thread _id_12EEA( var_4 );
}

_id_2A71( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_0.team == "allies" )
        var_2 = "axis";
    else if ( var_0.team == "axis" )
        var_2 = "allies";
    else
    {

    }

    thread _id_108EE( scripts\engine\utility::_id_7ECB( "vfx_phase_shift_trail_enemy" ), var_0, var_0, var_2, var_1 );
    var_3 = scripts\engine\utility::ter_op( level.teambased, scripts\engine\utility::_id_7ECB( "vfx_phase_shift_trail_friendly" ), scripts\engine\utility::_id_7ECB( "vfx_phase_shift_trail_enemy" ) );
    thread _id_108EE( var_3, var_0, var_0, var_0.team, var_1 );

    foreach ( var_5 in level.players )
    {
        if ( var_5 == var_0 )
            continue;

        var_6 = scripts\engine\utility::ter_op( level.teambased && var_5.team == var_0.team, scripts\engine\utility::_id_7ECB( "vfx_phase_shift_trail_friendly" ), scripts\engine\utility::_id_7ECB( "vfx_phase_shift_trail_enemy" ) );
        thread _id_108EE( var_6, var_5, var_0, var_0.team, var_1 );
    }
}

_id_12EEA( var_0 )
{
    var_1 = 0;
    var_2 = 0.15;

    for (;;)
    {
        if ( !isdefined( self ) || !isdefined( self.owner ) || !scripts\mp\utility\game::isreallyalive( self.owner ) || !isdefined( self._id_CACB ) || !scripts\mp\utility\game::isreallyalive( self._id_CACB ) || !_id_9DDF( self._id_CACB ) || var_1 > var_0 )
        {
            self.origin += ( 0, 0, 10000 );
            wait 0.2;
            self delete();
            return;
        }

        var_1 += var_2;

        if ( self._id_CACB == self.owner )
        {
            foreach ( var_4 in level.players )
            {
                if ( !_id_213D( var_4, self.owner ) )
                {
                    self _meth_8388( var_4 );
                    continue;
                }

                self _meth_8429( var_4 );
            }
        }
        else
        {
            foreach ( var_4 in level.players )
            {
                if ( !_id_213D( var_4, self.owner ) )
                {
                    self _meth_8388( self.owner );
                    continue;
                }

                self _meth_8429( self.owner );
            }
        }

        self moveto( self.owner.origin, var_2 );
        wait( var_2 );
    }
}

_id_9DDF( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = ( isplayer( var_0 ) || isagent( var_0 ) ) && var_0 _meth_84D9();
    var_2 = isdefined( var_0._id_FF03 ) && var_0._id_FF03 == 1;
    return var_1 || var_2;
}

_id_213D( var_0, var_1 )
{
    var_2 = _id_9DDF( var_0 );
    var_3 = _id_9DDF( var_1 );
    return var_2 && var_3 || !var_3 && !var_2;
}

_id_F7E3( var_0 )
{
    return self _meth_84D8( var_0 );
}

_id_4524( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "confuseBotsOnTeleport" );
    self endon( "confuseBotsOnTeleport" );
    scripts\mp\utility\game::_enableignoreme();
    wait( var_0 );
    scripts\mp\utility\game::_disableignoreme();
}
