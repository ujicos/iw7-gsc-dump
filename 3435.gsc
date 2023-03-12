// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_20BB()
{
    _id_6692();
}

_id_97D0()
{

}

_id_E0D0()
{
    self setclientomnvar( "ui_dodge_charges", 0 );
    self notify( "removeArchetype" );
}

_id_6692()
{

}

_id_F6E6( var_0 )
{
    thread _id_13A1A( var_0 );
}

_id_13A1A( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );

    for (;;)
    {
        self waittill( "got_a_kill", var_1, var_2, var_3 );

        if ( var_0 == "equipment" && !scripts\engine\utility::_id_9D74( var_3 ) )
            continue;
        else
            _id_49AD( self, var_1, var_0 );
    }
}

_id_49AD( var_0, var_1, var_2 )
{
    var_3 = 20;
    var_4 = 20;
    var_5 = spawn( "script_model", var_1.origin + ( 0, 0, 10 ) );
    var_6 = _id_7E95( var_2 );
    var_5 _meth_8594();
    var_5 setmodel( var_6 );
    var_5.owner = var_0;
    var_5.team = var_0.team;
    var_5.type = var_2;
    var_5 _meth_8429( var_0 );
    var_7 = spawn( "trigger_radius", var_1.origin, 0, var_3, var_4 );
    var_7 thread _id_13A1C( var_5 );
    var_7 thread _id_13A19( var_5 );

    if ( var_2 != "equipment" && var_2 != "super" )
    {
        var_5 thread _id_90DE();
        var_5 _meth_8271( 1000, 30, 0.2, 0.2 );
    }
    else
        var_5 thread _id_11A17( var_7 );

    var_5 thread _id_13A1B( 30, var_7 );

    if ( var_5.type == "equipment" )
    {
        var_5 _id_F6E8( var_0 );

        foreach ( var_9 in level.players )
        {
            if ( var_9 != var_0 )
                var_5 _meth_8429( var_9 );
        }
    }
    else
    {
        foreach ( var_9 in level.players )
        {
            if ( !level.teambased )
            {
                if ( var_9 == var_0 )
                    var_5 _id_F6E8( var_9 );
                else
                    var_5 _meth_8429( var_9 );

                continue;
            }

            if ( var_9.team != var_0.team )
            {
                var_5 _meth_8429( var_9 );
                continue;
            }

            var_5 _id_F6E8( var_9 );
        }
    }
}

_id_7E95( var_0 )
{
    switch ( var_0 )
    {
        case "battery":
            var_1 = "mp_battery_drop";
            break;
        case "scorestreak":
            var_1 = "mp_battery_drop";
            break;
        case "super":
            var_1 = "mp_battery_drop";
            break;
        case "equipment":
            var_1 = "equipment_resupply_bag";
            break;
        default:
            var_1 = "mp_battery_drop";
            break;
    }

    return var_1;
}

_id_13A18( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    wait( var_0 );
}

_id_F6E8( var_0 )
{
    self _meth_8388( var_0 );
}

_id_F6E7( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );
    var_1 = scripts\mp\utility\game::_id_C794( self, "cyan", var_0, 1, 0, "equipment" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 30 );
    scripts\mp\utility\game::_id_C78F( var_1, self );
}

_id_90DE()
{
    self endon( "death" );
    var_0 = self.origin;

    for (;;)
    {
        self moveto( var_0 + ( 0, 0, 15 ), 1, 0.2, 0.2 );
        wait 1;
        self moveto( var_0, 1, 0.2, 0.2 );
        wait 1;
    }
}

_id_11A17( var_0 )
{
    var_1 = scripts\engine\utility::_id_5D14( self.origin, 32 );
    self.origin = var_1;

    if ( isdefined( var_0 ) )
        var_0.origin = var_1;
}

_id_13A1C( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !isplayer( var_1 ) )
            continue;

        if ( level.teambased )
        {
            if ( var_1.team != var_0.team )
                continue;
        }
        else if ( var_1 != var_0.owner )
            continue;

        if ( var_0.type == "equipment" && var_1 != var_0.owner )
            continue;

        if ( var_0.type == "super" && ( var_1 scripts\mp\supers::_id_9F8A() || var_1 scripts\mp\supers::_id_9F88() ) )
            continue;

        if ( var_0.type == "equipment" && var_1._id_D782.size == 0 )
            continue;

        var_1 _id_8363( var_0 );
        var_1 playlocalsound( "scavenger_pack_pickup" );

        if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_superpack" ) )
            var_1 scripts\mp\missions::_id_D991( "ch_trait_super_pack" );

        var_0 delete();
    }
}

_id_8363( var_0 )
{
    if ( var_0.type == "battery" )
    {
        thread scripts\mp\rank::scoreeventpopup( "battery_pack" );
        _id_0DD8::_id_E83B( var_0.owner );
    }
    else if ( var_0.type == "scorestreak" )
    {
        thread scripts\mp\rank::scoreeventpopup( "scorestreak_pack" );
        var_1 = scripts\mp\rank::getscoreinfovalue( "scorestreak_pack" );
        thread scripts\mp\rank::_id_EC42( var_1 );
        scripts\mp\killstreaks\killstreaks::_id_83A7( "scorestreak_pack", var_1 );
    }
    else if ( var_0.type == "super" )
    {
        thread scripts\mp\rank::scoreeventpopup( "super_pack" );
        scripts\mp\supers::_id_83AA( 125 );
    }
    else if ( var_0.type == "equipment" )
    {
        scripts\mp\weapons::_id_EBD3( self );
        scripts\mp\hud_message::_id_1013D( "scavenger_eqp" );
    }
}

_id_9DDC( var_0 )
{
    switch ( var_0 )
    {
        case "super_pack":
        case "scorestreak_pack":
        case "battery_pack":
            return 1;
        default:
            return 0;
    }
}

_id_13A19( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );

    if ( isdefined( self ) )
        self delete();
}

_id_13A1B( var_0, var_1 )
{
    self endon( "death" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    var_1 delete();
    self delete();
}
