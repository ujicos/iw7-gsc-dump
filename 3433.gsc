// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    _id_0D67::_id_97D0();
    _id_0D70::_id_97D0();
    _id_0D6B::_id_97D0();
    _id_0D6F::_id_97D0();
    _id_0D6C::_id_97D0();
    level._id_2128 = [];
    level._id_2127 = [];
    var_0 = 0;

    for (;;)
    {
        var_1 = tablelookupbyrow( "mp/battleRigTable.csv", var_0, 0 );

        if ( !isdefined( var_1 ) || var_1 == "" )
            break;

        var_1 = int( var_1 );
        var_2 = tablelookupbyrow( "mp/battleRigTable.csv", var_0, 1 );
        level._id_2128[var_1] = var_2;
        level._id_2127[var_2] = var_1;
        var_0++;
    }
}

_id_E0D0( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = undefined;

    switch ( var_0 )
    {
        case "archetype_assault":
            var_1 = scripts\mp\archetypes\archassault::_id_E0D0;
            break;
        case "archetype_heavy":
            var_1 = _id_0D6C::_id_E0D0;
            break;
        case "archetype_scout":
            var_1 = _id_0D6F::_id_E0D0;
            break;
        case "archetype_assassin":
            var_1 = _id_0D67::_id_E0D0;
            break;
        case "archetype_engineer":
            var_1 = _id_0D6B::_id_E0D0;
            break;
        case "archetype_sniper":
            var_1 = _id_0D70::_id_E0D0;
            break;
        default:
            return;
    }

    if ( isdefined( var_1 ) )
        self [[ var_1 ]]();
}

_id_116E( var_0 )
{
    if ( var_0 )
        scripts\mp\utility\game::giveperk( "specialty_battleslide" );
    else
        self notify( "battleslide_unset" );
}

_id_1170( var_0 )
{
    if ( var_0 )
        scripts\mp\equipment\ground_pound::_id_8659();
    else
        scripts\mp\equipment\ground_pound::_id_865A();
}

_id_EF38()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "scriptableBoostFxManager" );
    self endon( "scriptableBoostFxManager" );
    thread _id_139CE();
    self setscriptablepartstate( "jet_pack", "neutral", 0 );

    for (;;)
    {
        self waittill( "doubleJumpBoostBegin" );

        if ( scripts\mp\equipment\cloak::_id_9FC1() == 0 )
            self setscriptablepartstate( "jet_pack", "boost_on", 0 );

        self waittill( "doubleJumpBoostEnd" );

        if ( scripts\mp\equipment\cloak::_id_9FC1() == 0 )
            self setscriptablepartstate( "jet_pack", "neutral", 0 );
    }
}

_id_139CE()
{
    self endon( "scriptableBoostFxManager" );
    self waittill( "death" );
    self setscriptablepartstate( "jet_pack", "off", 0 );
    self setscriptablepartstate( "teamColorPins", "off", 0 );
}

_id_EF41()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "scriptableSlideBoostFxManager" );
    self endon( "scriptableSlideBoostFxManager" );
    self setscriptablepartstate( "jet_pack", "neutral", 0 );
    thread _id_139CF();

    for (;;)
    {
        self waittill( "sprint_slide_begin" );

        if ( scripts\mp\equipment\cloak::_id_9FC1() == 0 )
            self setscriptablepartstate( "jet_pack", "boost_slide_on", 0 );

        self waittill( "sprint_slide_end" );

        if ( scripts\mp\equipment\cloak::_id_9FC1() == 0 )
            self setscriptablepartstate( "jet_pack", "neutral", 0 );
    }
}

_id_139CF()
{
    self endon( "scriptableSlideBoostFxManager" );
    self waittill( "death" );
    self setscriptablepartstate( "jet_pack", "off", 0 );
    self setscriptablepartstate( "teamColorPins", "off", 0 );
}

_id_80F3( var_0 )
{
    if ( !isdefined( var_0 ) || var_0 == "none" )
        return 0;

    for ( var_1 = 0; var_1 < level._id_2128.size; var_1++ )
    {
        if ( level._id_2128[var_1] == var_0 )
            return var_1;
    }

    return 0;
}
