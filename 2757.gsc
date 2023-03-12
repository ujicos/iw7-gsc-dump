// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_9887()
{
    self._id_A444 = undefined;
    self._id_A443 = undefined;
    self._id_A442 = undefined;
    self._id_A43E = undefined;
    self._id_A447 = undefined;
    self._id_A446 = undefined;
    self._id_A43F = undefined;
}

_id_E254()
{
    if ( !isdefined( self._id_A449 ) )
        return;

    self._id_A449 = undefined;
    self notify( "stop_lockon_sound" );
    self _meth_8403();
    self _meth_8406( 0 );
    self _meth_8404( 0 );
    self._id_4BF3 = 0;
    self._id_4BF2 = 0;
    self._id_A445 = undefined;
    self stopolcalsound( "javelin_clu_lock" );
    self stopolcalsound( "javelin_clu_aquiring_lock" );
    _id_9887();
}

_id_6A61()
{
    var_0 = self geteye();
    var_1 = self getplayerangles();
    var_2 = anglestoforward( var_1 );
    var_3 = var_0 + var_2 * 15000;
    var_4 = bullettrace( var_0, var_3, 0, undefined );

    if ( var_4["surfacetype"] == "none" )
        return undefined;

    if ( var_4["surfacetype"] == "default" )
        return undefined;

    var_5 = var_4["entity"];

    if ( isdefined( var_5 ) )
    {
        if ( var_5 == level._id_1537._id_CC44 )
            return undefined;
    }

    var_6 = [];
    var_6[0] = var_4["position"];
    var_6[1] = var_4["normal"];
    return var_6;
}

_id_AF27()
{
    self._id_A43E = undefined;
}

_id_AF25()
{
    if ( !isdefined( self._id_A43E ) )
        self._id_A43E = 1;
    else
        self._id_A43E++;
}

_id_AF26()
{
    var_0 = 4;

    if ( isdefined( self._id_A43E ) && self._id_A43E >= var_0 )
        return 1;

    return 0;
}

_id_11579( var_0 )
{
    var_1 = 1100;
    var_2 = distance( self.origin, var_0 );

    if ( var_2 < var_1 )
        return 1;

    return 0;
}

_id_B061( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "stop_lockon_sound" );

    for (;;)
    {
        self playlocalsound( var_0 );
        wait( var_1 );
    }
}

_id_11A03( var_0, var_1 )
{
    var_2 = var_0 + var_1 * 10.0;
    var_3 = var_2 + ( 0, 0, 2000 );
    var_4 = bullettrace( var_2, var_3, 0, undefined );

    if ( sighttracepassed( var_2, var_3, 0, undefined ) )
        return 1;

    return 0;
}

_id_A448()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = 1150;
    var_1 = 25;
    var_2 = 100;
    var_3 = 400;
    var_4 = 12;
    var_5 = 0;
    var_6 = 0;
    self._id_A445 = undefined;
    _id_9887();

    for (;;)
    {
        wait 0.05;
        var_7 = self getcurrentweapon();

        if ( isbot( self ) && var_7 != "javelin_mp" || !issubstr( var_7, "javelin" ) || scripts\mp\killstreaks\emp_common::_id_9D29() )
        {
            if ( isdefined( self._id_A449 ) )
                _id_E254();

            continue;
        }

        if ( self playerads() < 0.95 )
        {
            var_6 = gettime();
            _id_E254();
            continue;
        }

        var_8 = 0;

        if ( getdvar( "missileDebugDraw" ) == "1" )
            var_8 = 1;

        var_9 = 0;

        if ( getdvar( "missileDebugText" ) == "1" )
            var_9 = 1;

        self._id_A449 = 1;

        if ( !isdefined( self._id_A444 ) )
            self._id_A444 = 1;

        if ( self._id_A444 == 1 )
        {
            var_10 = scripts\mp\weapons::_id_AF2B();

            if ( var_10.size != 0 )
            {
                var_11 = [];

                foreach ( var_13 in var_10 )
                {
                    var_14 = self _meth_8409( var_13.origin, 65, 40 );

                    if ( var_14 )
                        var_11[var_11.size] = var_13;
                }

                if ( var_11.size != 0 )
                {
                    var_16 = sortbydistance( var_11, self.origin );

                    if ( !_id_13263( var_16[0] ) )
                        continue;

                    if ( var_9 )
                    {

                    }

                    self._id_A445 = var_16[0];

                    if ( !isdefined( self._id_A43F ) )
                        self._id_A43F = gettime();

                    self._id_A444 = 2;
                    self._id_A441 = 0;
                    _id_A440( var_0 );
                    self._id_A444 = 1;
                    continue;
                }
            }

            if ( _id_AF26() )
            {
                _id_E254();
                continue;
            }

            var_17 = gettime() - var_6;

            if ( var_17 < var_2 )
                continue;

            var_17 = gettime() - var_5;

            if ( var_17 < var_1 )
                continue;

            var_5 = gettime();
            var_21 = _id_6A61();

            if ( !isdefined( var_21 ) )
            {
                _id_AF25();
                continue;
            }

            if ( _id_11579( var_21[0] ) )
            {
                self _meth_8406( 1 );
                continue;
            }
            else
                self _meth_8406( 0 );

            if ( isdefined( self._id_A443 ) )
            {
                var_22 = averagepoint( self._id_A443 );
                var_23 = distance( var_22, var_21[0] );

                if ( var_23 > var_3 )
                {
                    _id_AF25();
                    continue;
                }
            }
            else
            {
                self._id_A443 = [];
                self._id_A442 = [];
            }

            self._id_A443[self._id_A443.size] = var_21[0];
            self._id_A442[self._id_A442.size] = var_21[1];
            _id_AF27();

            if ( self._id_A443.size < var_4 )
                continue;

            self._id_A447 = averagepoint( self._id_A443 );
            self._id_A446 = averagenormal( self._id_A442 );
            self._id_A43E = undefined;
            self._id_A443 = undefined;
            self._id_A442 = undefined;
            self._id_A43F = gettime();
            self _meth_8405( self._id_A447 );
            thread _id_B061( "javelin_clu_aquiring_lock", 0.6 );
            self._id_A444 = 2;
        }

        if ( self._id_A444 == 2 )
        {
            var_14 = self _meth_8409( self._id_A447, 65, 45 );

            if ( !var_14 )
            {
                _id_E254();
                continue;
            }

            if ( _id_11579( self._id_A447 ) )
                self _meth_8406( 1 );
            else
                self _meth_8406( 0 );

            var_17 = gettime() - self._id_A43F;

            if ( var_17 < var_0 )
                continue;

            self _meth_8402( self._id_A447, ( 0, 0, 0 ), 1 );
            self notify( "stop_lockon_sound" );
            self playlocalsound( "javelin_clu_lock" );
            self._id_A444 = 3;
        }

        if ( self._id_A444 == 3 )
        {
            var_14 = self _meth_8409( self._id_A447, 65, 45 );

            if ( !var_14 )
            {
                _id_E254();
                continue;
            }

            if ( _id_11579( self._id_A447 ) )
                self _meth_8406( 1 );
            else
                self _meth_8406( 0 );

            continue;
        }
    }
}

_id_4F53( var_0, var_1, var_2 )
{

}

_id_13263( var_0 )
{
    var_1 = self geteye();
    var_2 = var_0 getpointinbounds( 0, 0, 0 );
    var_3 = sighttracepassed( var_1, var_2, 0, var_0 );
    _id_4F53( var_1, var_2, var_3 );

    if ( var_3 )
        return 1;

    var_4 = var_0 getpointinbounds( 1, 0, 0 );
    var_3 = sighttracepassed( var_1, var_4, 0, var_0 );
    _id_4F53( var_1, var_4, var_3 );

    if ( var_3 )
        return 1;

    var_5 = var_0 getpointinbounds( -1, 0, 0 );
    var_3 = sighttracepassed( var_1, var_5, 0, var_0 );
    _id_4F53( var_1, var_5, var_3 );

    if ( var_3 )
        return 1;

    return 0;
}

_id_A440( var_0 )
{
    if ( self._id_A444 == 2 )
    {
        self _meth_8405( self._id_A445 );

        if ( !_id_10F9B( self._id_A445 ) )
        {
            _id_E254();
            self._id_A43F = undefined;
            return;
        }

        var_1 = _id_103EC();

        if ( !var_1 )
        {
            self._id_A43F = undefined;
            return;
        }

        if ( !isdefined( self._id_4BF3 ) || !self._id_4BF3 )
        {
            thread _id_B061( "javelin_clu_aquiring_lock", 0.6 );
            self._id_4BF3 = 1;
        }

        var_2 = gettime() - self._id_A43F;

        if ( scripts\mp\utility\game::_id_12D6( "specialty_fasterlockon" ) )
        {
            if ( var_2 < var_0 * 0.5 )
                return;
        }
        else if ( var_2 < var_0 )
            return;

        if ( isplayer( self._id_A445 ) )
            self _meth_8402( self._id_A445, ( 0, 0, 64 ), 0 );
        else
            self _meth_8402( self._id_A445, ( 0, 0, 0 ), 0 );

        self notify( "stop_lockon_sound" );

        if ( !isdefined( self._id_4BF2 ) || !self._id_4BF2 )
        {
            self playlocalsound( "javelin_clu_lock" );
            self._id_4BF2 = 1;
        }

        self._id_A444 = 3;
    }

    if ( self._id_A444 == 3 )
    {
        var_1 = _id_103EC();

        if ( !var_1 )
            return;

        if ( !_id_10F9B( self._id_A445 ) )
        {
            _id_E254();
            return;
        }
    }
}

_id_10F9B( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !self _meth_8409( var_0.origin, 65, 85 ) )
        return 0;

    return 1;
}

_id_103EC()
{
    var_0 = 500;

    if ( _id_13263( self._id_A445 ) )
    {
        self._id_A441 = 0;
        return 1;
    }

    if ( self._id_A441 == 0 )
        self._id_A441 = gettime();

    var_1 = gettime() - self._id_A441;

    if ( var_1 >= var_0 )
    {
        _id_E254();
        return 0;
    }

    return 1;
}
