// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_377C = spawnstruct();
    level._id_377C._id_3780 = "mp/map_callouts/" + level._id_B335 + "_callouts.csv";
    _id_498F();
    level._id_377C._id_213C = getentarray( "callout_area", "targetname" );

    foreach ( var_1 in level._id_377C._id_213C )
        var_1 thread _id_377A();

    thread _id_BA04();
}

_id_498F()
{
    var_0 = level._id_377C;
    var_0._id_2138 = [];
    var_0._id_2138["none"] = -1;
    var_1 = 0;

    for (;;)
    {
        var_2 = tablelookupbyrow( level._id_377C._id_3780, var_1, 0 );

        if ( !isdefined( var_2 ) || var_2 == "" )
            break;

        var_2 = int( var_2 );
        var_3 = tablelookupbyrow( level._id_377C._id_3780, var_1, 3 );

        if ( var_3 != "area" )
        {

        }
        else
        {
            var_4 = tablelookupbyrow( level._id_377C._id_3780, var_1, 1 );
            var_0._id_2138[var_4] = var_2;
        }

        var_1++;
    }
}

_id_BA04()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 _id_F7EF( "none" );
    }
}

_id_377A()
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isplayer( var_0 ) )
            continue;

        var_0 _id_F7EF( self.script_noteworthy, self );
    }
}

_id_F7EF( var_0, var_1 )
{
    if ( isdefined( self._id_3779 ) && self._id_3779 == var_0 )
        return;

    if ( isdefined( self._id_3779 ) && var_0 != "none" && self._id_3779 != "none" )
        return;

    self._id_3779 = var_0;

    if ( isdefined( var_1 ) )
        thread _id_13B08( var_1, var_1.script_noteworthy );

    var_2 = level._id_377C._id_2138[var_0];

    if ( isdefined( var_2 ) )
    {
        self setclientomnvar( "ui_callout_area_id", var_2 );
        var_3 = scripts\mp\utility\game::_id_7BC3( 1, 0 );

        foreach ( var_5 in var_3 )
        {
            if ( var_5 ismlgspectator() )
                var_5 setclientomnvar( "ui_callout_area_id", var_2 );
        }
    }
    else if ( var_0 != "none" )
        return;
}

_id_13B08( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    thread _id_419F();

    for (;;)
    {
        if ( self._id_3779 != var_1 )
            return;

        if ( !self istouching( var_0 ) )
        {
            _id_F7EF( "none" );
            return;
        }

        wait 0.5;
    }
}

_id_419F()
{
    self endon( "disconnect" );
    self waittill( "death" );
    _id_F7EF( "none" );
}
