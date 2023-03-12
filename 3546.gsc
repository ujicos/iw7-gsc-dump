// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_2B29()
{
    _id_0AE1::_id_DF06( "power_blackhat", [ "passive_increased_radius" ] );
}

_id_E0D4()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self playlocalsound( "mp_overcharge_off" );
}

_id_13073()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeBlackhat" );
    level endon( "game_ended" );
    self playlocalsound( "mp_overcharge_on" );
    thread _id_2B2D();
}

_id_2B2D()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "blackhat_used" );
    self iprintlnbold( "Blackhat" );
    var_0 = _id_0AE2::_id_D735( "power_blackhat" );
    var_1 = 0;
    self _meth_8441( "ges_hack_lock_in", undefined, var_1, 0.5 );

    for (;;)
    {
        if ( !_id_0AE2::_id_9F09( var_0 ) )
            break;

        if ( _id_0AE2::_id_9F09( var_0 ) )
        {
            thread _id_2B2B( var_0 );

            while ( _id_0AE2::_id_9F09( var_0 ) )
            {
                wait 0.05;

                if ( !_id_0AE2::_id_9F09( var_0 ) )
                    break;
            }
        }

        wait 0.05;
    }

    self _meth_8442( "ges_hack_lock_in" );
}

_id_2B2E()
{
    self notify( "powers_blackhat_used", 1 );
    self notify( "blackhat_used" );
    self _meth_8442( "ges_hack_lock_in" );
}

_id_2B2B( var_0 )
{
    self notify( "using_blackhat" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "blackhat_used" );
    self endon( "using_blackhat" );
    var_1 = [];
    var_2 = [];
    var_3 = _id_0AE1::_id_7FC4( "power_blackhat", 20 );

    for (;;)
    {
        if ( _id_0AE2::_id_9F09( var_0 ) )
        {
            var_4 = [];
            var_1 = _id_7E94( self );

            foreach ( var_6 in var_1 )
            {
                var_7 = self _meth_8409( var_6.origin, 65, var_3 );

                if ( var_7 )
                    var_4[var_4.size] = var_6;
            }

            if ( var_4.size )
            {
                var_2 = sortbydistance( var_4, self.origin );
                self._id_AA25 = var_2[0];
                scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.25 );

                if ( isdefined( self._id_AA25 ) && isdefined( self._id_AA26 ) && self._id_AA26 )
                {
                    _id_11375( self._id_AA25 );
                    self notify( "blackhat_fired" );
                    _id_2B2E();
                }
                else if ( isdefined( self._id_AA25 ) )
                {
                    self._id_AA25 _meth_80B0( 1000, self._id_AA25.origin, self, self, "MOD_IMPACT", "power_blackhat_mp" );
                    self notify( "blackhat_fired" );
                    _id_2B2E();
                    scripts\mp\killstreaks\killstreaks::_id_839F();
                }
            }

            self._id_AA26 = 0;
            wait 0.1;
            scripts\mp\hostmigration::waittillhostmigrationdone();
            continue;
        }

        self notify( "powers_blackhat_used", 0 );
        break;
    }
}

_id_11375( var_0 )
{

}

_id_11319( var_0 )
{
    var_1 = level._id_13C7D["sticky_mine_mp"];
    var_0 scripts\mp\weapons::_id_11061();
    var_0 thread scripts\mp\weapons::_id_57EB( "tag_fx", var_1._id_B760["friendly"], var_1._id_B760["enemy"] );
}

_id_2B2A()
{
    var_0 = self getentitynumber();
    level._id_B779[var_0] = self;
    level notify( "mine_planted" );
}

_id_2B2C()
{
    var_0 = undefined;

    if ( isdefined( self ) )
        var_0 = self getentitynumber();

    if ( isdefined( var_0 ) )
        level._id_B779[var_0] = undefined;
}

_id_E12A()
{
    if ( !isdefined( self._id_6644 ) )
        return;

    self._id_6644 destroy();
}

_id_7E94( var_0 )
{
    var_1 = _id_2B28();

    if ( var_1.size )
    {
        var_2 = var_1;
        return var_2;
    }
    else
        return var_1;
}

_id_2B28( var_0 )
{
    var_1 = [];
    var_2 = scripts\mp\utility\game::_id_8027( self.team );

    if ( level.teambased )
    {
        if ( isdefined( level._id_B779 ) )
        {
            foreach ( var_4 in level._id_B779 )
            {
                if ( isdefined( var_4 ) && ( var_4.team != self.team || isdefined( var_4.owner ) && var_4.owner != self ) )
                {
                    self._id_AA26 = 1;
                    var_1[var_1.size] = var_4;
                }
            }
        }

        if ( isdefined( level._id_12A83 ) )
        {
            foreach ( var_7 in level._id_12A83 )
            {
                if ( isdefined( var_7 ) && ( var_7.team != self.team || isdefined( var_7.owner ) && var_7.owner != self ) )
                    var_1[var_1.size] = var_7;
            }
        }

        if ( isdefined( level._id_12AF3 ) )
        {
            foreach ( var_10 in level._id_12AF3[var_2] )
            {
                if ( isdefined( var_10 ) && ( var_10.team != self.team || isdefined( var_10.owner ) && var_10.owner != self ) )
                    var_1[var_1.size] = var_10;
            }
        }

        if ( isdefined( level._id_3F14 ) && ( level._id_3F14.team != self.team || isdefined( level._id_3F14.owner ) && level._id_3F14.owner != self ) )
            var_1[var_1.size] = level._id_3F14;

        if ( isdefined( level._id_AD8B ) )
        {
            foreach ( var_13 in level._id_AD8B )
            {
                if ( isdefined( var_13 ) && ( var_13.team != self.team || isdefined( var_13.owner ) && var_13.owner != self ) )
                    var_1[var_1.size] = var_13;
            }
        }

        if ( isdefined( level._id_27EF ) )
        {
            foreach ( var_16 in level._id_27EF )
            {
                if ( isdefined( var_16 ) && ( var_16.team != self.team || isdefined( var_16.owner ) && var_16.owner != self ) )
                    var_1[var_1.size] = var_16;
            }
        }

        if ( isdefined( level._id_8B5F ) )
        {
            foreach ( var_19 in level._id_8B5F )
            {
                if ( isdefined( var_19 ) && ( var_19.team != self.team || isdefined( var_19.owner ) && var_19.owner != self ) )
                    var_1[var_1.size] = var_19;
            }
        }

        if ( isdefined( var_0 ) && var_0 == 1 )
        {
            foreach ( var_22 in level._id_3CB5 )
            {
                if ( isdefined( var_22 ) && isalive( var_22 ) && ( var_22.team != self.team || isdefined( var_22.owner ) && var_22.owner != self ) )
                    var_1[var_1.size] = var_22;
            }
        }
    }
    else
    {
        if ( isdefined( level._id_12A83 ) )
        {
            foreach ( var_7 in level._id_12A83 )
            {
                if ( !isdefined( var_7 ) )
                    continue;

                var_1[var_1.size] = var_7;
            }
        }

        if ( isdefined( level._id_12AF3 ) )
        {
            foreach ( var_10 in level._id_12AF3 )
            {
                if ( !isdefined( var_10 ) )
                    continue;

                var_1[var_1.size] = var_10;
            }
        }

        if ( isdefined( level._id_3F14 ) )
            var_1[var_1.size] = level._id_3F14;

        if ( isdefined( level._id_AD8B ) )
        {
            foreach ( var_13 in level._id_AD8B )
            {
                if ( !isdefined( var_13 ) )
                    continue;

                var_1[var_1.size] = var_13;
            }
        }

        if ( isdefined( level._id_27EF ) )
        {
            foreach ( var_16 in level._id_27EF )
            {
                if ( !isdefined( var_16 ) )
                    continue;

                var_1[var_1.size] = var_16;
            }
        }

        if ( isdefined( level._id_8B5F ) )
        {
            foreach ( var_19 in level._id_8B5F )
            {
                if ( !isdefined( var_19 ) )
                    continue;

                var_1[var_1.size] = var_19;
            }
        }

        if ( isdefined( var_0 ) && var_0 == 1 )
        {
            foreach ( var_22 in level._id_3CB5 )
            {
                if ( !isdefined( var_22 ) || !isalive( var_22 ) )
                    continue;

                var_1[var_1.size] = var_22;
            }
        }
    }

    return var_1;
}
