// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{

}

_id_10DC6()
{
    thread _id_B9D9();
}

_id_1107E( var_0 )
{
    self notify( "stop_monitoring_flash" );
}

_id_6EDC( var_0 )
{
    self endon( "stop_monitoring_flash" );
    self endon( "flash_rumble_loop" );
    self notify( "flash_rumble_loop" );
    var_1 = gettime() + var_0 * 1000;

    while ( gettime() < var_1 )
    {
        self playrumbleonentity( "damage_heavy" );
        wait 0.05;
    }
}

_id_B9D9()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "monitorFlash" );
    self endon( "monitorFlash" );
    self._id_6ECA = 0;
    var_0 = 1;

    for (;;)
    {
        self waittill( "flashbang", var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isalive( self ) )
            break;

        if ( isdefined( self._id_13118 ) )
            continue;

        if ( isdefined( self.owner ) && isdefined( var_4 ) && var_4 == self.owner )
            continue;

        if ( !isdefined( var_6 ) )
            var_6 = 0;

        var_7 = 0;
        var_8 = 1;
        var_3 = 1;
        var_9 = var_2 * var_3 * var_0;
        var_9 += var_6;
        var_9 = scripts\mp\perks\perkfunctions::_id_20E0( var_4, self, var_9 );

        if ( var_9 < 0.25 )
            continue;

        var_10 = undefined;

        if ( var_9 > 2 )
            var_10 = 0.75;
        else
            var_10 = 0.25;

        if ( level.teambased && isdefined( var_4 ) && isdefined( var_4.team ) && var_4.team == self.team && var_4 != self )
        {
            if ( level._id_740A == 0 )
                continue;
            else if ( level._id_740A == 1 )
            {

            }
            else if ( level._id_740A == 2 )
            {
                var_9 *= 0.5;
                var_10 *= 0.5;
                var_8 = 0;
                var_7 = 1;
            }
            else if ( level._id_740A == 3 )
            {
                var_9 *= 0.5;
                var_10 *= 0.5;
                var_7 = 1;
            }
        }
        else if ( isdefined( var_4 ) )
        {
            var_4 notify( "flash_hit" );

            if ( var_4 != self )
                var_4 scripts\mp\missions::_id_D992( "ch_indecentexposure" );
        }

        if ( var_8 && isdefined( self ) )
        {
            thread _id_20CA( var_9, var_10 );

            if ( isdefined( var_4 ) && var_4 != self )
            {
                var_4 thread scripts\mp\damagefeedback::updatedamagefeedback( "flash" );
                var_11 = self;

                if ( isplayer( var_4 ) && var_4 _meth_81A7( "specialty_paint", "perk" ) && var_4 scripts\mp\utility\game::_id_12D6( "specialty_paint" ) )
                    var_11 thread scripts\mp\perks\perkfunctions::_id_F7D5( var_4 );
            }
        }

        if ( var_7 && isdefined( var_4 ) )
            var_4 thread _id_20CA( var_9, var_10 );
    }
}

_id_20CA( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( !isdefined( self._id_6EC8 ) || var_0 > self._id_6EC8 )
        self._id_6EC8 = var_0;

    if ( !isdefined( self._id_6EDB ) || var_1 > self._id_6EDB )
        self._id_6EDB = var_1;

    wait 0.05;
    self._id_6EC8 = undefined;
    self._id_6EDB = undefined;
}

_id_9DFA()
{
    return isdefined( self._id_6ECA ) && gettime() < self._id_6ECA;
}
