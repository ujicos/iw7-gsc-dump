// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._effect["telereap_trail"] = loadfx( "vfx/old/_requests/mp_weapons/vfx_knife_tele_start_blue" );
    level._effect["telereap_smoke"] = loadfx( "vfx/core/smktrail/teleport_smoke_bomb_mp" );
    level._effect["dash_dust"] = loadfx( "vfx/core/screen/vfx_scrnfx_tocam_slidedust_m" );
}

_id_83B2()
{

}

_id_E17E()
{
    self notify( "removeTeleReap" );

    if ( isdefined( self._id_11669 ) )
    {
        scripts\mp\utility\game::_id_C78F( self._id_11669, self._id_11667 );
        self._id_11669 = undefined;
        self._id_11667 = undefined;
    }
}

_id_130E8()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeTeleReap" );
    self._id_D782["power_teleReap"]._id_0019 = 1;

    if ( self _meth_81AD() )
    {
        self playlocalsound( "mp_reap_fail" );
        self._id_D782["power_teleReap"]._id_0019 = 0;
        return 0;
    }

    var_0 = _id_11666();

    if ( !var_0 )
        self playlocalsound( "mp_reap_fail" );

    self._id_D782["power_teleReap"]._id_0019 = 0;
    return var_0;
}

_id_11666()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = 384;
    var_1 = ( 0, 0, 32 );
    var_2 = self.origin + var_1;
    var_3 = anglestoforward( self.angles );
    var_4 = var_2 + var_3 * var_0;
    var_5 = getclosestpointonnavmesh( var_4 );

    if ( var_5[2] > self.origin[2] || !self isonground() )
    {
        if ( var_5[2] > self.origin[2] + 64 )
            var_1 = ( 0, 0, 64 );

        var_5 += var_1;
        var_2 = self.origin + var_1;
        var_4 = var_5;
    }

    var_6 = [];
    var_6[0] = self;
    var_6[1] = self._id_FC9F;
    var_7 = 0.35;
    var_8 = scripts\engine\trace::_id_48BC( 1, 1, 1, 0, 0, 1 );
    var_9 = scripts\engine\trace::_id_3A09( var_2, var_4, 16, 32, ( 0, 0, 0 ), var_6, var_8 );
    var_10 = 1;

    if ( var_9["fraction"] != 1 )
    {
        var_10 = var_9["fraction"] - 0.05;

        if ( var_10 < 0.05 )
            return 0;

        var_4 = var_2 + var_3 * ( var_0 * var_10 );
        var_7 = var_9["fraction"] * 0.35;
    }

    if ( !canspawn( var_4 ) )
    {
        for ( var_11 = 0; var_11 < 10; var_11++ )
        {
            var_10 /= 1.15;
            var_4 = var_2 + var_3 * ( var_0 * var_10 );

            if ( canspawn( var_4 ) )
                break;
        }
    }

    self playlocalsound( "reaper_dash" );
    self playsound( "reaper_dash_npc" );
    thread _id_D504();
    scripts\mp\utility\game::_id_1309( "iw7_erad_mp", self.origin + ( 0, 0, 1000 ), self.origin + ( 0, 0, 2000 ), self );
    self playrumbleonentity( "damage_heavy" );
    earthquake( 0.25, 0.25, self.origin, 32 );
    self._id_9F1B++;
    thread _id_11668();
    thread _id_139E6();
    _id_DD92( var_4, var_1, var_7 );
    return 1;
}

_id_139E6()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "stop_reap" );
    level endon( "game_ended" );
    var_0 = [];

    for (;;)
    {
        var_1 = _id_808B( 384 );

        foreach ( var_3 in var_1 )
        {
            var_4 = 0;

            if ( distancesquared( self.origin, var_3.origin ) > 2048 )
                continue;

            if ( scripts\engine\utility::_id_9F11( var_3 ) )
                continue;

            if ( var_3 scripts\mp\utility\game::_id_9D48( "archetype_heavy" ) )
            {
                var_5 = self _meth_816B();
                var_6 = var_5 * -1;
                var_3 _meth_8366( var_6 );
            }

            foreach ( var_8 in var_0 )
            {
                if ( var_8 == var_3 )
                    var_4 = 1;
            }

            if ( var_4 )
                continue;

            var_3 playrumbleonentity( "artillery_rumble" );
            self playrumbleonentity( "artillery_rumble" );
            var_3 _meth_80B0( 150, self.origin, self, self, "MOD_MELEE" );
            playrumbleonentity( "artillery_rumble", self.origin );
            earthquake( 0.5, 0.5, self.origin, 256 );
            playloopsound( self.origin, "slide_impact" );
            var_0[var_0.size] = var_3;
            wait 0.05;
        }

        wait 0.05;
    }
}

_id_627D()
{
    self._id_FCA5 = 1;
    self._id_FC9F.angles = self.angles + ( 0, 90, 0 );
    self._id_FC9F.origin = _id_0D6E::_id_36DB( 64 );
    self._id_FC9F show();
    self._id_FC9F setcandamage( 1 );
    thread _id_0D6E::_id_BCEE( 64 );
    thread _id_0D6E::_id_FC9C();
    self _meth_80AA();
    self allowjump( 0 );
    self _meth_8010( 0 );
}

_id_DD92( var_0, var_1, var_2 )
{
    var_3 = self.origin + var_1;
    var_4 = scripts\engine\utility::_id_107E6();
    thread _id_DD91( self, var_4 );
    _id_DD93( var_0, var_4, var_1, var_2 );
    wait 0.25;
    self._id_9F1B--;
    self notify( "stop_reap" );
}

_id_DD93( var_0, var_1, var_2, var_3 )
{
    var_4 = self.origin + var_2;
    var_5 = var_4 - var_0;
    var_6 = lengthsquared( var_5 );
    var_7 = self getentityvelocity();
    var_8 = lengthsquared( var_4 - var_0 );
    self _meth_823A( var_1, "tag_origin" );
    self playlocalsound( "synaptic_dash" );
    self playsound( "synaptic_dash_npc" );

    if ( var_3 < 0.1 )
        var_9 = 0;
    else
        var_9 = 0.1;

    if ( var_3 <= 0 )
        var_3 = 0.1;

    if ( !isdefined( self._id_11667 ) )
    {
        var_1 moveto( var_0, var_3, var_9, 0 );
        wait( var_3 );
    }
    else
    {
        var_10 = _id_8089( var_4 );
        var_1 moveto( var_10 + var_2, var_3, var_9, 0 );
        wait( var_3 / 4 );
        var_10 = _id_8089( var_4 );
        var_1 moveto( var_10 + var_2, var_3, 0, 0 );
        wait( var_3 / 4 );
        var_10 = _id_8089( var_4 );
        var_1 moveto( var_10 + var_2, var_3, 0, 0 );
        wait( var_3 / 2 );
    }

    wait 0.1;
    self unlink();
    self _meth_8366( var_7 * 1.3 );
    self setstance( "stand" );
}

_id_8089( var_0 )
{
    var_1 = self._id_11667.origin - var_0;
    var_2 = distance( var_0, self._id_11667.origin );
    var_3 = vectortoangles( var_1 );
    var_4 = anglestoforward( var_3 );
    var_5 = var_0 + var_4 * ( var_2 + 100 );

    if ( capsuletracepassed( var_5, 24, 48, self, 0, 0 ) )
        return var_5;

    return self._id_11667.origin;
}

_id_D504()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    playfxontag( scripts\engine\utility::_id_7ECB( "telereap_trail" ), self, "TAG_EYE" );
    wait 0.5;
    stopfxontag( scripts\engine\utility::_id_7ECB( "telereap_trail" ), self, "TAG_EYE" );
}

_id_DD91( var_0, var_1 )
{
    var_0 scripts\engine\utility::waittill_any( "death", "disconnect", "stop_reap" );
    scripts\engine\utility::waitframe();

    if ( isdefined( var_1 ) )
        var_1 delete();
}

_id_808B( var_0 )
{
    var_1 = [];

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    foreach ( var_3 in level.players )
    {
        if ( var_3 == self )
            continue;

        if ( !isdefined( var_3.team ) )
            continue;

        if ( var_3.team != scripts\mp\utility\game::_id_8027( self.team ) )
            continue;

        if ( !scripts\mp\utility\game::isreallyalive( var_3 ) )
            continue;

        if ( var_0 != 0 )
        {
            var_4 = scripts\engine\utility::_id_56F4( self.origin, var_3.origin );
            var_5 = var_0 * var_0;

            if ( var_4 > var_5 )
                continue;
        }

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_42A4( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_1 = 100;
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        var_5 = var_4.origin - self.origin;
        var_6 = anglestoforward( self getplayerangles() );
        var_7 = vectordot( var_5, var_6 );

        if ( var_7 <= 0 )
            continue;

        var_8 = vectornormalize( var_5 );
        var_9 = vectornormalize( var_6 );
        var_7 = vectordot( var_8, var_9 );
        var_4._id_5AC7 = var_7;
        var_2[var_2.size] = var_7;
    }

    var_11 = scripts\mp\utility\game::_id_DB9F( var_2 );
    var_12 = [];

    for ( var_13 = 0; var_13 < var_11.size; var_13++ )
    {
        foreach ( var_15 in var_0 )
        {
            if ( isdefined( var_15._id_5AC7 ) && var_15._id_5AC7 == var_11[var_13] )
                var_12[var_12.size] = var_15;
        }
    }

    return var_12;
}

_id_11668()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = [];
    var_1 = [];
    self._id_11667 = undefined;
    var_0 = _id_808B( 384 );
    var_2 = 0;

    if ( isdefined( var_0 ) && var_0.size > 0 )
    {
        if ( var_0.size > 1 )
            var_1 = _id_42A4( var_0 );
        else
            var_1 = var_0;
    }

    foreach ( var_4 in var_1 )
    {
        var_5 = var_4.origin - self.origin;
        var_6 = anglestoforward( self getplayerangles() );
        var_7 = vectordot( var_5, var_6 );

        if ( var_7 <= 0 )
            continue;

        var_8 = vectornormalize( var_5 );
        var_9 = vectornormalize( var_6 );
        var_7 = vectordot( var_8, var_9 );

        if ( var_7 < 0.9 )
            continue;

        var_10 = self geteye();
        var_11 = var_4 geteye();
        var_12 = [];
        var_12[0] = self;
        var_12[1] = var_4;
        var_13 = scripts\engine\trace::_id_DCF1( var_10, var_11, var_12 );

        if ( !var_13 )
            continue;

        self._id_11667 = var_4;
        var_2 = 1;
        break;
    }

    if ( !var_2 )
        self._id_11667 = undefined;
}
