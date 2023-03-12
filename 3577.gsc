// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_CAA3 = [];
    level._id_CAA3["spawn"] = loadfx( "vfx/iw7/_requests/mp/vfx_phasesplit_holo_spawn" );
    level._id_CAA3["death"] = loadfx( "vfx/iw7/_requests/mp/vfx_phasesplit_holo_death" );
    level._id_CAA3["shimmer"] = loadfx( "vfx/iw7/_requests/mp/vfx_phasesplit_holo_shimmer" );
}

_id_CAC1()
{
    _id_CABB();
}

_id_CAC2()
{
    if ( !_id_CAB5() )
        return 0;

    thread _id_CAC4();
    return 1;
}

_id_CAC4( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "phaseSplit_end" );
    self._id_CAB1 = 1;
    var_1 = anglestoright( self.angles ) * cos( 90 ) + anglestoforward( self.angles ) * sin( 90 );
    var_2 = var_1 * 64;
    var_3 = self.origin + var_2;
    var_3 = getclosestpointonnavmesh( var_3 );
    var_4 = getnodesinradius( var_3, 64, 0, 128 );
    var_5 = var_4[0];
    var_6 = 9999999;

    foreach ( var_8 in var_4 )
    {
        var_9 = lengthsquared( var_8.origin - var_3 );

        if ( var_9 < var_6 )
        {
            var_5 = var_8;
            var_6 = var_9;
        }
    }

    thread _id_CAC8();
    var_11 = _id_CAC0( var_5 );
    var_11 thread _id_CAB4();
    var_11 thread _id_CAB3();
    var_11 thread _id_CAB6();
    _id_0AE2::_id_4575( 10.0, "power_phaseSplit_update", "phaseSplit_end" );
    thread _id_CABB( 1 );
}

_id_CAC8()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "phaseSplit_end" );

    while ( !scripts\mp\killstreaks\emp_common::_id_9D29() )
        scripts\engine\utility::waitframe();

    thread _id_CABB();
}

_id_CABB( var_0 )
{
    if ( !isdefined( self._id_CAB1 ) )
        return;

    self._id_CAB1 = undefined;
    self notify( "phaseSplit_end" );

    if ( !isdefined( var_0 ) || !var_0 )
        self notify( "powers_phaseSplit_update", 0 );
}

_id_CAC0( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = scripts\mp\agents\agent_utility::_id_81FB( 1, 1 );

    var_1 = scripts\mp\agents\agents::_id_16F2( "phaseSplitAgent", self.team, "callback", var_0.origin, self.angles, self, 0, 0, "veteran", ::_id_CAB2 );

    if ( !isdefined( var_1 ) )
        thread _id_CABB();
    else
    {
        if ( isdefined( var_1._id_8C98 ) )
        {
            var_1 _meth_8096( self._id_8C98, "" );
            var_1._id_8C98 = undefined;
        }

        var_1 setmodel( var_1.owner._id_01F1 );
        var_1.health = 25;
        var_1 botsetflag( "disable_attack", 1 );
        var_2 = var_1.origin + anglestoforward( var_1.angles ) * 500;
        var_3 = scripts\engine\trace::_id_DCED( var_1.origin, var_2, level.players );

        if ( !isdefined( var_3 ) )
            var_3["position"] = var_2;
        else
            var_3 = var_3["position"];

        var_4 = getclosestpointonnavmesh( var_3 );
        var_4 = getclosestnodeinsight( var_4 );
        var_1 botsetscriptgoalnode( var_4, "objective" );
        self playlocalsound( "ghost_prism_activate" );
        playfx( level._id_CAA3["spawn"], var_1.origin, anglestoforward( var_1.angles ), anglestoup( var_1.angles ) );
    }
}

_id_CAB6()
{
    self endon( "death" );

    for (;;)
    {
        wait 0.75;
        playfxontag( level._id_CAA3["shimmer"], self, "j_spineupper" );
    }
}

_id_CAB4()
{
    self waittill( "death" );
    var_0 = self _meth_8113();
    var_0 hide();
    playfx( level._id_CAA3["death"], var_0.origin, anglestoforward( var_0.angles ), anglestoup( var_0.angles ) );

    if ( isdefined( self.owner ) )
    {
        self.owner _id_CABB();

        if ( scripts\mp\utility\game::isreallyalive( self.owner ) )
            self.owner iprintlnbold( "Clone Destroyed" );
    }
}

_id_CAB3()
{
    self endon( "death" );
    self.owner scripts\engine\utility::waittill_any( "death", "disconnect", "phaseSplit_end" );
    self suicide();
}

_id_CAB5()
{
    var_0 = scripts\mp\agents\agent_utility::_id_8010( self );

    if ( var_0 >= 2 )
        return 0;

    return 1;
}

_id_CAC9()
{
    level.agent_funcs["phaseSplitAgent"] = level.agent_funcs["player"];
    level.agent_funcs["phaseSplitAgent"]["think"] = scripts\mp\killstreaks\agent_killstreak::_id_10AEA;
    level.agent_funcs["phaseSplitAgent"]["on_killed"] = ::_id_CACA;
    level.agent_funcs["phaseSplitAgent"]["on_damaged"] = scripts\mp\agents\agents::on_agent_player_damaged;
    level.agent_funcs["phaseSplitAgent"]["gametype_update"] = scripts\mp\killstreaks\agent_killstreak::_id_BFF0;
}

_id_CACA( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    scripts\mp\agents\agents::_id_C4B3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, 0 );

    if ( isplayer( var_1 ) && isdefined( self.owner ) && var_1 != self.owner )
        self.owner scripts\mp\utility\game::leaderdialogonplayer( "squad_killed" );

    scripts\mp\agents\agent_utility::deactivateagent();
}

_id_CAB2()
{
    var_0 = self.owner;
    var_1 = [];
    var_2 = var_0 getweaponslistprimaries();
    var_3 = [];

    if ( var_2.size > 0 && var_2[0] != "none" )
    {
        for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        {
            if ( !scripts\mp\weapons::_id_9D3E( var_2[var_4] ) )
                var_3[var_3.size] = var_2[var_4];
        }
    }

    var_2 = var_3;

    if ( var_2.size > 0 && var_2[0] != "none" )
    {
        var_5 = var_2[0];
        var_1["loadoutPrimary"] = scripts\mp\utility\game::_id_8234( var_5 );
        var_6 = getweaponattachments( var_5 );

        for ( var_4 = 0; var_4 < var_6.size; var_4++ )
        {
            var_7 = scripts\engine\utility::ter_op( var_4 > 0, "loadoutPrimaryAttachment" + ( var_4 + 1 ), "loadoutPrimaryAttachment" );
            var_1[var_7] = var_6[var_4];
        }

        var_1["loadoutPrimaryCamo"] = getweaponcamoname( var_5 );
    }

    if ( var_2.size > 0 && var_2[1] != "none" )
    {
        var_5 = var_2[1];
        var_1["loadoutSecondary"] = scripts\mp\utility\game::_id_8234( var_5 );
        var_6 = getweaponattachments( var_5 );

        for ( var_4 = 0; var_4 < var_6.size; var_4++ )
        {
            var_7 = scripts\engine\utility::ter_op( var_4 > 0, "loadoutSecondaryAttachment1" + var_4, "loadoutSecondaryAttachment" );
            var_1[var_7] = var_6[var_4];
        }

        var_1["loadoutSecondaryCamo"] = getweaponcamoname( var_5 );
    }

    return var_1;
}
