// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_218F()
{

}

_id_2197()
{
    self setscriptablepartstate( "armorUp", "active", 0 );
    self setscriptablepartstate( "armorUpMaterial", "on" );
    self.health = self.maxhealth;
    scripts\mp\heavyarmor::_id_17CE( getheavyarmorvalue() );
    thread _id_2196();
    thread _id_219C();
    thread _id_2199();

    if ( !scripts\mp\utility\game::_id_9D46() )
        thread scripts\mp\supers::watchobjuse( 75 );

    return 1;
}

_id_218E( var_0 )
{
    self notify( "armorUp_end" );
    self notify( "obj_drain_end" );

    if ( scripts\mp\utility\game::istrue( var_0 ) )
        self setscriptablepartstate( "armorUpMaterial", "offImmediate", 0 );
    else
        self setscriptablepartstate( "armorUpMaterial", "off", 0 );

    if ( self._id_AE62 == "archetype_heavy" )
        self setscriptablepartstate( "armorUp", "neutral", 0 );

    if ( scripts\mp\heavyarmor::_id_8BFA() && !scripts\mp\utility\game::istrue( self._id_8CFC._id_9B30 ) )
        scripts\mp\heavyarmor::_id_E12B();
}

_id_219C()
{
    self endon( "disconnect" );
    self endon( "armorUp_end" );
    level waittill( "game_ended" );
    scripts\mp\supers::_id_DE3B( 9999 );
}

_id_2199()
{
    self endon( "disconnect" );
    self endon( "armorUp_end" );
    self waittill( "heavyArmor_broken" );
    scripts\mp\supers::_id_DE3B( 9999 );
}

_id_2196()
{
    self endon( "disconnect" );
    self endon( "armorUp_end" );
    self._id_219F = [];

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( isdefined( var_1 ) )
            self._id_219F[self._id_219F.size] = var_1;
    }
}

_id_9FC0()
{
    var_0 = scripts\mp\supers::_id_7E4F();

    if ( !isdefined( var_0 ) || var_0 != "super_armorup" )
        return 0;

    return scripts\mp\supers::_id_9F88();
}

getheavyarmorvalue()
{
    var_0 = scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_9D46(), 100, 114 );
    return scripts\engine\utility::ter_op( scripts\mp\utility\game::istrue( level._id_8B38 ), 76, var_0 );
}
