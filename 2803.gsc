// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_98D5()
{
    self._id_10FA9 = undefined;
    self._id_10FAA = undefined;
    self._id_10FA6 = undefined;
    self._id_10FA7 = undefined;
    thread _id_E273();
    level._id_10FAB = [];
}

_id_E272()
{
    if ( !isdefined( self._id_10FAE ) )
        return;

    self._id_10FAE = undefined;
    self notify( "stop_javelin_locking_feedback" );
    self notify( "stop_javelin_locked_feedback" );
    self notify( "stinger_lock_lost" );
    self _meth_8403();
    self stopolcalsound( "maaws_reticle_tracking" );
    self stopolcalsound( "maaws_reticle_locked" );
    _id_E12E( self._id_10FAA );
    _id_98D5();
}

_id_E273()
{
    self endon( "disconnect" );
    self notify( "ResetStingerLockingOnDeath" );
    self endon( "ResetStingerLockingOnDeath" );

    for (;;)
    {
        self waittill( "death" );
        _id_E272();
    }
}

_id_B06A()
{
    self endon( "stop_javelin_locking_feedback" );

    for (;;)
    {
        if ( isdefined( level._id_3F14 ) && isdefined( level._id_3F14._id_8712 ) && isdefined( self._id_10FAA ) && self._id_10FAA == level._id_3F14._id_8712 )
            level._id_1541 playlocalsound( "maaws_incoming_lp" );

        if ( isdefined( level._id_1541 ) && isdefined( self._id_10FAA ) && self._id_10FAA == level._id_1537._id_CC44 )
            level._id_1541 playlocalsound( "maaws_incoming_lp" );

        self playlocalsound( "maaws_reticle_tracking" );
        self playrumbleonentity( "ac130_25mm_fire" );
        wait 0.6;
    }
}

_id_B069()
{
    self endon( "stop_javelin_locked_feedback" );

    for (;;)
    {
        if ( isdefined( level._id_3F14 ) && isdefined( level._id_3F14._id_8712 ) && isdefined( self._id_10FAA ) && self._id_10FAA == level._id_3F14._id_8712 )
            level._id_1541 playlocalsound( "maaws_incoming_lp" );

        if ( isdefined( level._id_1541 ) && isdefined( self._id_10FAA ) && self._id_10FAA == level._id_1537._id_CC44 )
            level._id_1541 playlocalsound( "maaws_incoming_lp" );

        self playlocalsound( "maaws_reticle_locked" );
        self playrumbleonentity( "ac130_25mm_fire" );
        wait 0.25;
    }
}

_id_103EC( var_0 )
{
    var_1 = 500;

    if ( var_0 stingtargstruct_isinlos() )
    {
        self._id_10FA7 = 0;
        return 1;
    }

    if ( self._id_10FA7 == 0 )
        self._id_10FA7 = gettime();

    var_2 = gettime() - self._id_10FA7;

    if ( var_2 >= var_1 )
    {
        _id_E272();
        return 0;
    }

    return 1;
}

_id_10FAD()
{
    if ( !isplayer( self ) )
        return;

    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    _id_98D5();

    for (;;)
    {
        wait 0.05;

        if ( self playerads() < 0.95 )
        {
            _id_E272();
            continue;
        }

        var_0 = scripts\mp\utility\game::_id_821D( self getcurrentweapon() );

        if ( var_0 != "iw7_lockon_mp" )
        {
            _id_E272();
            continue;
        }

        self._id_10FAE = 1;

        if ( !isdefined( self._id_10FA9 ) )
            self._id_10FA9 = 0;

        if ( self._id_10FA9 == 0 )
        {
            var_1 = scripts\mp\weapons::_id_AF2B( 0 );

            if ( var_1.size == 0 )
                continue;

            var_1 = sortbydistance( var_1, self.origin );
            var_2 = undefined;
            var_3 = 0;

            foreach ( var_5 in var_1 )
            {
                if ( !isdefined( var_5 ) )
                    continue;

                var_2 = stingtargstruct_create( self, var_5 );
                var_2 stingtargstruct_getoffsets();
                var_2 stingtargstruct_getorigins();
                var_2 stingtargstruct_getinreticle();

                if ( var_2 stingtargstruct_isinreticle() )
                {
                    var_3 = 1;
                    break;
                }
            }

            if ( !var_3 )
                continue;

            var_2 stingtargstruct_getinlos();

            if ( !var_2 stingtargstruct_isinlos() )
                continue;

            self._id_10FAA = var_2._id_0334;
            self._id_10FA6 = gettime();
            self._id_10FA9 = 1;
            self._id_10FA7 = 0;
            _id_17D0( self._id_10FAA );
            thread _id_B06A();
        }

        if ( self._id_10FA9 == 1 )
        {
            if ( !isdefined( self._id_10FAA ) )
            {
                _id_E272();
                continue;
            }

            var_2 = stingtargstruct_create( self, self._id_10FAA );
            var_2 stingtargstruct_getoffsets();
            var_2 stingtargstruct_getorigins();
            var_2 stingtargstruct_getinreticle();

            if ( !var_2 stingtargstruct_isinreticle() )
            {
                _id_E272();
                continue;
            }

            var_2 stingtargstruct_getinlos();

            if ( !_id_103EC( var_2 ) )
                continue;

            var_7 = gettime() - self._id_10FA6;

            if ( scripts\mp\utility\game::_id_12D6( "specialty_fasterlockon" ) )
            {
                if ( var_7 < 375.0 )
                    continue;
            }
            else if ( var_7 < 750 )
                continue;

            self notify( "stop_javelin_locking_feedback" );
            thread _id_B069();
            var_8 = undefined;
            stinger_finalizelock( var_2 );
            self._id_10FA9 = 2;
        }

        if ( self._id_10FA9 == 2 )
        {
            if ( !isdefined( self._id_10FAA ) )
            {
                _id_E272();
                continue;
            }

            var_2 = stingtargstruct_create( self, self._id_10FAA );
            var_2 stingtargstruct_getoffsets();
            var_2 stingtargstruct_getorigins();
            var_2 stingtargstruct_getinreticle();
            var_2 stingtargstruct_getinlos();

            if ( !_id_103EC( var_2 ) )
                continue;
            else
                stinger_finalizelock( var_2 );

            if ( !var_2 stingtargstruct_isinreticle() )
            {
                _id_E272();
                continue;
            }
        }
    }
}

stinger_finalizelock( var_0 )
{
    var_1 = undefined;

    if ( isdefined( var_0.inlosid ) )
    {
        var_1 = var_0._id_C370[var_0.inlosid];
        var_1 = ( var_1[1], -1 * var_1[0], var_1[2] );
    }
    else
        var_1 = ( 0, 0, 0 );

    self _meth_8402( self._id_10FAA, var_1 );
}

_id_17D0( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = var_0;

    if ( isdefined( var_0.owner ) && !scripts\mp\utility\game::_id_9EF0( var_0 ) )
        var_1 = var_0.owner;

    var_1 setclientomnvar( "ui_killstreak_missile_warn", 1 );
}

_id_E12E( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = var_0;

    if ( isdefined( var_0.owner ) && !scripts\mp\utility\game::_id_9EF0( var_0 ) )
        var_1 = var_0.owner;

    var_1 setclientomnvar( "ui_killstreak_missile_warn", 0 );
}

stingtargstruct_create( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2.player = var_0;
    var_2._id_0334 = var_1;
    var_2._id_C370 = [];
    var_2.origins = [];
    var_2.inreticledistssqr = [];
    var_2.inreticlesortedids = [];
    var_2.inlosid = undefined;
    var_2.useoldlosverification = 1;
    return var_2;
}

stingtargstruct_getoffsets()
{
    self._id_C370 = [];

    if ( scripts\mp\utility\game::isjackal( self._id_0334 ) )
    {
        self._id_C370[self._id_C370.size] = ( 0, 0, 125 );
        self._id_C370[self._id_C370.size] = ( 0, 250, 125 );
        self._id_C370[self._id_C370.size] = ( 0, -425, 125 );
        self._id_C370[self._id_C370.size] = ( -250, -215, 140 );
        self._id_C370[self._id_C370.size] = ( 250, -215, 140 );
        self.useoldlosverification = 0;
    }
    else if ( scripts\mp\utility\game::_id_9F8C( self._id_0334 ) )
    {
        self._id_C370[self._id_C370.size] = ( 0, 0, 30 );
        self._id_C370[self._id_C370.size] = ( 0, 0, 5 );
        self.useoldlosverification = 0;
    }
    else if ( scripts\mp\utility\game::ismicroturret( self._id_0334 ) )
    {
        self._id_C370[self._id_C370.size] = ( 0, 0, 15 );
        self.useoldlosverification = 0;
    }
    else if ( scripts\mp\utility\game::isturret( self._id_0334 ) )
    {
        self._id_C370[self._id_C370.size] = ( 0, 0, 42 );
        self._id_C370[self._id_C370.size] = ( 0, 0, 5 );
        self.useoldlosverification = 0;
    }
    else if ( scripts\mp\utility\game::_id_9F22( self._id_0334 ) )
    {
        self._id_C370[self._id_C370.size] = ( 0, 0, 70 );
        self._id_C370[self._id_C370.size] = ( 0, 0, 5 );
        self.useoldlosverification = 0;
    }
    else
        self._id_C370[self._id_C370.size] = ( 0, 0, 0 );
}

stingtargstruct_getorigins()
{
    var_0 = self._id_0334.origin;
    var_1 = self._id_0334.angles;
    var_2 = anglestoforward( var_1 );
    var_3 = anglestoright( var_1 );
    var_4 = anglestoup( var_1 );

    for ( var_5 = 0; var_5 < self._id_C370.size; var_5++ )
    {
        var_6 = self._id_C370[var_5];
        self.origins[var_5] = var_0 + var_3 * var_6[0] + var_2 * var_6[1] + var_4 * var_6[2];
    }
}

stingtargstruct_getinreticle()
{
    foreach ( var_5, var_1 in self.origins )
    {
        for ( var_2 = 0; var_2 < self.origins.size; var_2++ )
        {
            var_3 = self.player _meth_840B( self.origins[var_2], 65 );

            if ( isdefined( var_3 ) )
            {
                var_4 = length2dsquared( var_3 );

                if ( var_4 <= 7225 )
                {
                    self.inreticlesortedids[self.inreticlesortedids.size] = var_2;
                    self.inreticledistssqr[var_2] = var_4;
                }
            }
        }
    }

    if ( self.inreticlesortedids.size > 1 )
    {
        for ( var_2 = 0; var_2 < self.inreticlesortedids.size; var_2++ )
        {
            for ( var_6 = var_2 + 1; var_6 < self.inreticlesortedids.size; var_6++ )
            {
                var_7 = self.inreticlesortedids[var_2];
                var_8 = self.inreticlesortedids[var_6];
                var_9 = self.inreticledistssqr[var_7];
                var_10 = self.inreticledistssqr[var_8];

                if ( var_10 < var_9 )
                {
                    var_11 = var_7;
                    self.inreticlesortedids[var_2] = var_8;
                    self.inreticlesortedids[var_6] = var_11;
                }
            }
        }
    }
}

stingtargstruct_getinlos()
{
    var_0 = self.player geteye();
    var_1 = physics_createcontents( [ "physicscontents_solid", "physicscontents_glass", "physicscontents_sky", "physicscontents_water", "physicscontents_vehicle", "physicscontents_item" ] );
    var_2 = [ self.player, self._id_0334 ];
    var_3 = self._id_0334 _meth_8137();

    if ( isdefined( var_3 ) && var_3.size > 0 )
        var_2 = scripts\engine\utility::_id_227F( var_2, var_3 );

    if ( !self.useoldlosverification )
    {
        for ( var_4 = 0; var_4 < self.inreticlesortedids.size; var_4++ )
        {
            var_5 = self.inreticlesortedids[var_4];
            var_6 = self.origins[var_5];
            var_7 = physics_raycast( var_0, var_6, var_1, var_2, 0, "physicsquery_closest", 1 );

            if ( !isdefined( var_7 ) || var_7.size == 0 )
            {
                self.inlosid = var_5;
                return;
            }
        }
    }
    else
    {
        var_8 = scripts\engine\trace::_id_DCED( var_0, self.origins[0], var_2, var_1, 0 );

        if ( var_8["fraction"] == 1 )
        {
            self.inlosid = 0;
            return;
        }

        var_9 = self._id_0334 getpointinbounds( 1, 0, 0 );
        var_8 = scripts\engine\trace::_id_DCED( var_0, var_9, var_2, var_1, 0 );

        if ( var_8["fraction"] == 1 )
        {
            self.inlosid = 0;
            return;
        }

        var_10 = self._id_0334 getpointinbounds( -1, 0, 0 );
        var_8 = scripts\engine\trace::_id_DCED( var_0, var_10, var_2, var_1, 0 );

        if ( var_8["fraction"] == 1 )
        {
            self.inlosid = 0;
            return;
        }
    }
}

stingtargstruct_isinreticle()
{
    return self.inreticlesortedids.size > 0;
}

stingtargstruct_isinlos()
{
    return isdefined( self.inlosid );
}
