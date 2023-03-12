// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{

}

_id_835C()
{
    self endon( "death" );
    self endon( "disconnect" );
    thread _id_C799();
    thread _id_2652();
    self playlocalsound( "synaptic_comm_on" );
    thread _id_13B7F();
}

_id_E0E0()
{
    self notify( "endComLink" );
}

_id_C799()
{
    if ( !level.teambased )
        return;

    foreach ( var_1 in level._id_C928 )
    {
        if ( !isdefined( var_1.team ) )
            continue;

        if ( var_1.team == self.team )
        {
            var_2 = scripts\mp\utility\game::_id_C794( var_1, "cyan", self, 0, 0, "killstreak" );
            thread _id_5604( var_2, var_1 );
        }
    }
}

_id_5604( var_0, var_1 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\engine\utility::_id_13737( 10, "death", "joined_team" );
    scripts\mp\utility\game::_id_C78F( var_0, var_1 );
}

_id_2652()
{
    self endon( "endComLink" );
    var_0 = 3;
    var_1 = 3;
    var_2 = 0.5;
    var_3 = 0;

    for (;;)
    {
        var_4 = sortbydistance( level._id_C928, self.origin );

        foreach ( var_6 in var_4 )
        {
            if ( !isdefined( var_6 ) )
                continue;

            if ( var_6 == self )
                continue;

            if ( level.teambased && var_6.team == self.team )
                continue;

            if ( var_6 scripts\mp\utility\game::_id_12D6( "specialty_gpsjammer" ) )
                continue;

            if ( !scripts\mp\utility\game::isreallyalive( var_6 ) )
            {
                if ( isdefined( var_6._id_2A3B ) )
                    var_6._id_2A3B delete();

                continue;
            }

            if ( isdefined( var_6._id_12AF1 ) )
            {
                if ( isdefined( var_6._id_2A3B ) )
                    var_6._id_2A3B delete();

                var_6._id_12AF1.origin = var_6.origin;
                var_6._id_12AF2.origin = var_6.origin;
                var_6._id_12AF2.alpha = 0.95;
                var_6._id_12AF2 thread _id_6AB8( var_1, var_3 );
            }
            else
            {
                var_7 = spawn( "script_model", var_6.origin );
                var_7 setmodel( "tag_origin" );
                var_7.owner = var_6;
                var_6._id_12AF1 = var_7;
                var_6._id_12AF2 = var_7 scripts\mp\entityheadicons::_id_F73D( self, "headicon_enemy", ( 0, 0, 48 ), 2, 2, 1, 0.01, 0, 1, 1, 0 );
                var_6._id_12AF2 _meth_8371();
                var_6._id_12AF2.alpha = 0.95;
                var_6._id_12AF2 thread _id_6AB8( var_1, var_3 );
            }

            wait( var_2 );
        }

        wait( var_1 );
    }
}

_id_B37E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "endComLink" );
    level endon( "game_ended" );
    var_0 = 3;
    var_1 = 3;
    var_2 = 0.5;

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self._id_12AF1 ) )
    {
        if ( isdefined( self._id_2A3B ) )
            self._id_2A3B delete();

        self._id_12AF1.origin = self.origin;
        self._id_12AF2.origin = self.origin;
        self._id_12AF2.alpha = 0.95;
        self._id_12AF2 thread _id_6AB8( var_1, var_2 );
    }
    else
    {
        var_3 = spawn( "script_model", self.origin );
        var_3 setmodel( "tag_origin" );
        var_3.owner = self;
        self._id_12AF1 = var_3;
        self._id_12AF2 = var_3 scripts\mp\entityheadicons::_id_F73D( scripts\mp\utility\game::_id_8027( self.team ), "headicon_enemy", ( 0, 0, 48 ), 14, 14, 1, 0.01, 0, 1, 1, 0 );
        self._id_12AF2.alpha = 0.95;
        self._id_12AF2 thread _id_6AB8( var_1, var_2 );
        self._id_12AF2 _meth_8371();
    }

    wait( var_1 );

    if ( isdefined( self._id_2A3B ) )
        self._id_2A3B delete();
}

_id_6AB8( var_0, var_1 )
{
    self notify( "fadeOut" );
    self endon( "fadeOut" );
    var_2 = var_0 - var_1;
    wait 0.05;

    if ( !isdefined( self ) )
        return;

    self fadeovertime( var_2 );
    self.alpha = 0.0;
}

_id_13B7F( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait 10;
    self notify( "endComLink" );
}

_id_13A10()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        scripts\engine\utility::waitframe();
        self notify( "endComLink" );
    }
}

_id_13A11()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "emp_update" );

        if ( scripts\mp\killstreaks\emp_common::_id_9D29() )
            self notify( "endComLink" );
    }
}
