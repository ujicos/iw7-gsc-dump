// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( isdefined( level._id_9801 ) )
        return;

    level._id_9801 = 1;

    if ( level._id_BDCC )
    {
        foreach ( var_1 in level._id_115DA )
        {
            var_2 = "entity_headicon_" + var_1;
            game[var_2] = scripts\mp\teams::_id_BD71( var_1 );
            precacheshader( game[var_2] );
        }
    }
    else
    {
        game["entity_headicon_allies"] = scripts\mp\teams::_id_81B0( "allies" );
        game["entity_headicon_axis"] = scripts\mp\teams::_id_81B0( "axis" );
        precacheshader( game["entity_headicon_allies"] );
        precacheshader( game["entity_headicon_axis"] );
    }
}

_id_F73D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( scripts\mp\utility\game::_id_9E0E( var_0 ) && !isplayer( var_0 ) )
        return;

    if ( !isdefined( self._id_6647 ) )
        self._id_6647 = [];

    if ( !isdefined( var_5 ) )
        var_5 = 1;

    if ( !isdefined( var_6 ) )
        var_6 = 0.05;

    if ( !isdefined( var_7 ) )
        var_7 = 1;

    if ( !isdefined( var_8 ) )
        var_8 = 1;

    if ( !isdefined( var_9 ) )
        var_9 = 0;

    if ( !isdefined( var_10 ) )
        var_10 = 1;

    if ( !isplayer( var_0 ) && var_0 == "none" )
    {
        foreach ( var_13, var_12 in self._id_6647 )
        {
            if ( isdefined( var_12 ) )
                var_12 destroy();

            self._id_6647[var_13] = undefined;
        }
    }
    else
    {
        if ( isplayer( var_0 ) )
        {
            if ( isdefined( self._id_6647[var_0.guid] ) )
            {
                self._id_6647[var_0.guid] destroy();
                self._id_6647[var_0.guid] = undefined;
            }

            if ( var_1 == "" )
                return;

            if ( isdefined( var_0.team ) )
            {
                if ( isdefined( self._id_6647[var_0.team] ) )
                {
                    self._id_6647[var_0.team] destroy();
                    self._id_6647[var_0.team] = undefined;
                }
            }

            var_12 = newclienthudelem( var_0 );
            self._id_6647[var_0.guid] = var_12;
        }
        else
        {
            if ( isdefined( self._id_6647[var_0] ) )
            {
                self._id_6647[var_0] destroy();
                self._id_6647[var_0] = undefined;
            }

            if ( var_1 == "" )
                return;

            foreach ( var_13, var_15 in self._id_6647 )
            {
                if ( var_13 == "axis" || var_13 == "allies" )
                    continue;

                var_16 = scripts\mp\utility\game::_id_8071( var_13 );

                if ( var_16.team == var_0 )
                {
                    self._id_6647[var_13] destroy();
                    self._id_6647[var_13] = undefined;
                }
            }

            var_12 = newteamhudelem( var_0 );
            self._id_6647[var_0] = var_12;
        }

        if ( !isdefined( var_3 ) || !isdefined( var_4 ) )
        {
            var_3 = 10;
            var_4 = 10;
        }

        var_12._id_0049 = var_5;
        var_12.x = self.origin[0] + var_2[0];
        var_12.y = self.origin[1] + var_2[1];
        var_12.z = self.origin[2] + var_2[2];
        var_12.alpha = 0.85;
        var_12 setshader( var_1, var_3, var_4 );
        var_12 setwaypoint( var_7, var_8, var_9, var_10 );
        var_12 thread _id_A57C( self, var_2, var_6 );
        thread _id_531F();

        if ( isplayer( var_0 ) )
            var_12 thread _id_5320( var_0 );

        if ( isplayer( self ) )
            var_12 thread _id_5320( self );
    }
}

_id_5320( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );
    self destroy();
}

_id_531F()
{
    self notify( "destroyIconsOnDeath" );
    self endon( "destroyIconsOnDeath" );
    self waittill( "death" );

    if ( !isdefined( self._id_6647 ) )
        return;

    foreach ( var_2, var_1 in self._id_6647 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1 destroy();
    }
}

_id_A57C( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_3 = isdefined( var_0.classname ) && !_id_9ED0( var_0 );

    if ( var_3 )
        self _meth_81E5( var_0, var_1 );

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            return;

        if ( !var_3 )
        {
            var_4 = var_0.origin;
            self.x = var_4[0] + var_1[0];
            self.y = var_4[1] + var_1[1];
            self.z = var_4[2] + var_1[2];
        }

        if ( var_2 > 0.05 )
        {
            self.alpha = 0.85;
            self fadeovertime( var_2 );
            self.alpha = 0;
        }

        wait( var_2 );
    }
}

_id_9ED0( var_0 )
{
    return isdefined( var_0._id_0336 ) && var_0._id_0336 == "care_package";
}

_id_F73E( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );
    wait( var_2 );

    if ( level.teambased )
        _id_F877( var_0.team, var_1 );
    else
        _id_F7F2( var_0, var_1 );
}

_id_F877( var_0, var_1 )
{
    if ( !level.teambased )
        return;

    if ( !isdefined( self._id_6648 ) )
    {
        self._id_6648 = "none";
        self._id_6644 = undefined;
    }

    var_2 = game["entity_headicon_" + var_0];
    self._id_6648 = var_0;

    if ( isdefined( var_1 ) )
        self._id_6645 = var_1;
    else
        self._id_6645 = ( 0, 0, 0 );

    self notify( "kill_entity_headicon_thread" );

    if ( var_0 == "none" )
    {
        if ( isdefined( self._id_6644 ) )
            self._id_6644 destroy();

        return;
    }

    var_3 = newteamhudelem( var_0 );
    var_3._id_0049 = 1;
    var_3.x = self.origin[0] + self._id_6645[0];
    var_3.y = self.origin[1] + self._id_6645[1];
    var_3.z = self.origin[2] + self._id_6645[2];
    var_3.origin = ( var_3.x, var_3.y, var_3.z );
    var_3.alpha = 1.0;
    var_3 setshader( var_2, 10, 10 );
    var_3 setwaypoint( 0, 0, 0, 1 );
    self._id_6644 = var_3;
    thread _id_A578();
    thread _id_531E();
}

_id_F7F2( var_0, var_1 )
{
    if ( level.teambased )
        return;

    if ( !isdefined( self._id_6648 ) )
    {
        self._id_6648 = "none";
        self._id_6644 = undefined;
    }

    self notify( "kill_entity_headicon_thread" );

    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self._id_6644 ) )
            self._id_6644 destroy();

        return;
    }

    var_2 = var_0.team;
    self._id_6648 = var_2;

    if ( isdefined( var_1 ) )
        self._id_6645 = var_1;
    else
        self._id_6645 = ( 0, 0, 0 );

    var_3 = game["entity_headicon_" + var_2];
    var_4 = newclienthudelem( var_0 );
    var_4._id_0049 = 1;
    var_4.x = self.origin[0] + self._id_6645[0];
    var_4.y = self.origin[1] + self._id_6645[1];
    var_4.z = self.origin[2] + self._id_6645[2];
    var_4.alpha = 0.8;
    var_4 setshader( var_3, 10, 10 );
    var_4 setwaypoint( 0, 0, 0, 1 );
    self._id_6644 = var_4;
    thread _id_A578();
    thread _id_531E();
}

_id_A578()
{
    self._id_6644 _meth_81E5( self, self._id_6645 );
}

_id_531E()
{
    self endon( "kill_entity_headicon_thread" );
    self waittill( "death" );

    if ( !isdefined( self._id_6644 ) )
        return;

    self._id_6644 destroy();
}
