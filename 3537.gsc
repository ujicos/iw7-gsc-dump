// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_E814()
{
    if ( !isdefined( self._id_8C19 ) )
    {
        var_0 = self gettagorigin( "tag_shield_back" );
        var_1 = spawn( "script_origin", var_0 );
        var_1 linkto( self, "tag_shield_back" );
        self attachshieldmodel( "weapon_rearguard_shield_wm_mp", "tag_shield_back" );
        self._id_8C19 = 1;
        self.rearguardattackers = [];
        self setclientomnvar( "ui_dodge_charges", 6 );
        var_1 thread _id_D415( self );
        var_1 thread _id_D416( self );
        var_1 thread _id_13A34( self );
        var_1 _meth_831F( self );
        var_1 setcandamage( 1 );
    }
}

_id_13A34( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "remove_rearguard" );
    self endon( "death" );

    if ( level._id_8B38 )
        var_1 = 10;
    else
        var_1 = 30;

    while ( var_0._id_FC96 < var_1 )
        wait 0.05;

    _id_E168( "damaged", var_0 );
}

_id_D416( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    var_0 waittill( "death" );
    _id_E168( "died", var_0 );
}

_id_D415( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );
    _id_E168( "disconnect", var_0 );
}

_id_E168( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );

    if ( isdefined( var_1 ) && scripts\mp\utility\game::istrue( var_1._id_8C19 ) && var_0 == "damaged" )
        var_1 _meth_8098( "weapon_rearguard_shield_wm_mp", "tag_shield_back" );

    if ( var_0 != "disconnect" )
        var_1 setclientomnvar( "ui_dodge_charges", 0 );

    waittillframeend;
    self notify( "death" );
    self delete();
}
