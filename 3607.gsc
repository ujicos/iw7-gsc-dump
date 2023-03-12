// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_DD9E()
{
    level._effect["reaper_kill"] = loadfx( "vfx/iw7/_requests/mp/vfx_meatbag_large.vfx" );
    level._effect["reaper_kill_robot"] = loadfx( "vfx/iw7/core/impact/robot/vfx_mp_c6_melee.vfx" );
    level._effect["screen_blood"] = loadfx( "vfx/iw7/core/zombie/weapon/axe/vfx_zmb_axe_screen_blood.vfx" );
}

_id_DD9D()
{
    self _meth_845E( 1 );
    self _meth_82BA( 1 );
    self setclientomnvar( "ui_odin", 5 );
    self _meth_82C6( "c6reaperservo" );
    thread _id_13B7A();
    self playsoundonmovingent( "reaper_startup" );
    self.health = self.maxhealth;
    self _meth_845A( "reaper_mp" );
    _id_DD94();
    _id_DD99();
    _id_DD9B();
    self._id_B62A = spawn( "script_model", self.origin );
    self._id_B62A setmodel( "tag_origin" );
    thread _id_13ACC();
    thread _id_13A9F();
    thread scripts\mp\supers::watchobjuse( 125 );
    return 1;
}

_id_DD97()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "reaper_removed" );
    self notify( "obj_drain_end" );
    self _meth_845E( 0 );
    self _meth_82BA( 0 );
    self setclientomnvar( "ui_odin", -1 );
    self thermalvisionoff();
    self _meth_82C6( self._id_42B0 );
    self playlocalsound( "reaper_shutdown" );

    if ( scripts\mp\utility\game::istrue( level.tactical ) )
        self _meth_845A( "scout_mp_tactical" );
    else
        self _meth_845A( "scout_mp" );

    _id_DD98();
    reaper_restorerigperks();
    _id_DD9A();
    self._id_B62A delete();
    return;
}

_id_13A9F()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "reaper_removed" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "got_a_kill" );
        self.health = self.maxhealth;
        var_0 = self getvieworigin();
        playfx( level._effect["screen_blood"], var_0 );
    }
}

_id_13B7A()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "reaper_removed" );
    level endon( "game_ended" );
    var_0 = 0;
    self thermalvisionoff();
    self notifyonplayercommand( "switch_reaper_thermal", "+usereload" );
    self notifyonplayercommand( "switch_reaper_thermal", "+activate" );

    for (;;)
    {
        self waittill( "switch_reaper_thermal" );

        if ( !var_0 )
            self _meth_83C0();
        else
            self thermalvisionoff();

        self playlocalsound( "reaper_thermal_toggle" );
        var_0 = !var_0;
    }
}

_id_13ACC()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "reaper_removed" );
    level endon( "game_ended" );
    var_0 = ( 0, 0, 32 );

    for (;;)
    {
        self waittill( "melee_fired" );
        self setscriptablepartstate( "reaper_claws", "claws_on_fire", 0 );
    }
}

_id_DD99()
{
    if ( scripts\mp\utility\game::_id_12D6( "specialty_dodge" ) )
    {
        self.restoredodge = "specialty_dodge";
        self setclientomnvar( "ui_dodge_charges", 0 );
        self notify( "setDodge" );
        scripts\mp\utility\game::_id_E150( "specialty_dodge" );
    }

    if ( scripts\mp\utility\game::_id_12D6( "specialty_afterburner" ) )
    {
        self.restoreafterburner = "specialty_afterburner";
        scripts\mp\utility\game::_id_E150( "specialty_afterburner" );
    }

    if ( scripts\mp\utility\game::_id_12D6( "specialty_rush" ) )
    {
        self.restorerush = "specialty_rush";
        scripts\mp\utility\game::_id_E150( "specialty_rush" );
    }

    self _meth_842C( 0, 400 );
}

reaper_restorerigperks()
{
    if ( isdefined( self.restoredodge ) )
    {
        scripts\mp\utility\game::giveperk( self.restoredodge );
        self.restoredodge = undefined;
    }

    if ( isdefined( self.restoreafterburner ) )
    {
        scripts\mp\utility\game::giveperk( self.restoreafterburner );
        self.restoreafterburner = undefined;
    }

    if ( isdefined( self.restorerush ) )
    {
        scripts\mp\utility\game::giveperk( self.restorerush );
        self.restorerush = undefined;
    }

    self _meth_842C( 0, 50 );
}

_id_DD94()
{
    scripts\mp\utility\game::giveperk( "specialty_extendedmelee" );
    scripts\mp\utility\game::giveperk( "specialty_fastermelee" );
    scripts\mp\utility\game::giveperk( "specialty_sprintmelee" );
    scripts\mp\utility\game::giveperk( "specialty_commando" );
    scripts\mp\utility\game::giveperk( "specialty_selectivehearing" );
    scripts\mp\utility\game::giveperk( "specialty_heartbreaker" );
    scripts\mp\utility\game::giveperk( "specialty_stun_resistance" );
    scripts\mp\utility\game::giveperk( "specialty_ghost" );
}

_id_DD98()
{
    scripts\mp\utility\game::_id_E150( "specialty_extendedmelee" );
    scripts\mp\utility\game::_id_E150( "specialty_fastermelee" );
    scripts\mp\utility\game::_id_E150( "specialty_sprintmelee" );
    scripts\mp\utility\game::_id_E150( "specialty_commando" );
    scripts\mp\utility\game::_id_E150( "specialty_selectivehearing" );
    scripts\mp\utility\game::_id_E150( "specialty_heartbreaker" );
    scripts\mp\utility\game::_id_E150( "specialty_stun_resistance" );
    scripts\mp\utility\game::_id_E150( "specialty_ghost" );
}

_id_DD9B()
{
    self _meth_80A9();
    scripts\engine\utility::_id_1C64( 0 );
    scripts\engine\utility::_id_1C60( 0 );
    scripts\engine\utility::_id_1C6E( 0 );
    scripts\mp\utility\game::_id_1C47( 0 );
    _id_0AE2::_id_D729();
}

_id_DD9A()
{
    self _meth_80DB();
    scripts\engine\utility::_id_1C64( 1 );
    scripts\engine\utility::_id_1C60( 1 );
    scripts\engine\utility::_id_1C6E( 1 );
    scripts\mp\utility\game::_id_1C47( 1 );
    _id_0AE2::_id_D72F();
}

_id_93D9()
{
    return scripts\engine\utility::ter_op( scripts\mp\utility\game::istrue( level._id_8B38 ), 19, 50 );
}

_id_A668()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait 0.05;
    var_0 = self _meth_8113();

    if ( !isdefined( var_0 ) )
        return;

    var_1 = var_0.origin;

    if ( self._id_AE62 == "archetype_scout" )
        playfx( level._effect["reaper_kill_robot"], var_1 + ( 0, 0, 12 ) );
    else
        playfx( level._effect["reaper_kill"], var_1 + ( 0, 0, 12 ) );

    if ( isdefined( var_0 ) )
    {
        var_0 hide( 1 );
        var_0._id_CA6C = 1;
    }
}

isusingreaper()
{
    if ( !isplayer( self ) )
        return 0;

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
        return 0;

    var_0 = scripts\mp\supers::_id_7E4F();

    if ( !isdefined( var_0 ) || var_0 != "super_reaper" )
        return 0;

    return scripts\mp\supers::_id_9F88();
}
