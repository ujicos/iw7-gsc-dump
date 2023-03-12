// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_5223()
{
    level._effect["deployableCover_explode"] = loadfx( "vfx/iw7/core/equipment/coverwall/vfx_coverwall_foam_expand_mp.vfx" );
    level._effect["deployableCover_explode_mist"] = loadfx( "vfx/iw7/core/equipment/coverwall/vfx_coverwall_mist_hang_mp.vfx" );
}

_id_5224( var_0 )
{
    var_0 endon( "death" );
    var_0 waittill( "missile_stuck", var_1 );
    self notify( "powers_deployableCover_used", 1 );
    var_0.angles *= ( 0, 1, 1 );
    _id_10842( var_0 );
    var_0 delete();
}

_id_10842( var_0 )
{
    var_1 = self._id_4759;

    if ( isdefined( var_1 ) )
        var_1 _id_5285();

    scripts\mp\utility\game::_id_D915( "deployable cover spawned", var_0.owner );
    var_2 = anglestoforward( var_0.angles );
    var_2 = rotatepointaroundvector( anglestoup( var_0.angles ), var_2, 90 );
    var_3 = anglestoup( var_0.angles );
    var_4 = vectorcross( var_2, var_3 );
    var_3 = vectorcross( var_4, var_2 );
    var_5 = _func_017( var_2, var_4, var_3 );
    var_1 = _func_2D6( var_0.origin + anglestoup( var_5 ) * 2, var_5 );
    var_1.owner = self;
    var_1.team = self.team;
    var_1 _meth_8318( 1 );
    var_1 _meth_8317( 1 );
    var_1 setcandamage( 1 );
    var_1.health = 9999;
    playfx( scripts\engine\utility::_id_7ECB( "deployableCover_explode" ), var_0.origin, anglestoforward( var_5 ), anglestoup( var_5 ) );
    playfx( scripts\engine\utility::_id_7ECB( "deployableCover_explode_mist" ), var_0.origin, anglestoforward( var_5 ), anglestoup( var_5 ) );
    playloopsound( var_0.origin, "deployable_cover_expand" );
    var_1 thread _id_40EB();
    var_1 thread _id_40ED();
    var_1 thread _id_40EC();
    var_1 thread _id_40EE();
    var_1 thread _id_139DE();
    var_1 thread _id_139DF( self );
    var_1 thread scripts\mp\perks\perk_equipmentping::_id_E84B();
    var_1 thread createcovernavobstacle();
    self._id_4759 = var_1;
}

createcovernavobstacle()
{
    self endon( "death" );
    self endon( "entitydeleted" );
    self endon( "despawnCover" );
    self waittill( "coverwall_expand_finish" );
    self._id_BE64 = _func_314( self );
}

_id_5285( var_0 )
{
    self notify( "despawnCover" );

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !var_0 )
        playloopsound( self.origin, "deployable_cover_contract" );

    if ( isdefined( self._id_BE64 ) )
    {
        _func_27C( self._id_BE64 );
        self._id_BE64 = undefined;
    }

    self _meth_8514( var_0 );
    scripts\mp\utility\game::_id_D915( "deployable cover removed", self.owner );
}

_id_139DF( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );
    self waittill( "coverwall_expand_finish" );
    wait 0.25;
    thread scripts\mp\weapons::_id_C798( self, var_0 );
    self waittill( "coverwall_contract_start" );
    self notify( "death" );
}

_id_139DE()
{
    self endon( "death" );
    self endon( "despawnCover" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3 );
        self.health = 9999;
        var_1 scripts\mp\damagefeedback::updatedamagefeedback( "hitequip" );
    }
}

_id_40EE()
{
    self endon( "death" );
    self endon( "despawnCover" );
    wait 15;
    thread _id_5285();
}

_id_40EB()
{
    self endon( "death" );
    self endon( "despawnCover" );
    self.owner waittill( "death" );
    thread _id_5285();
}

_id_40ED()
{
    self endon( "death" );
    self endon( "despawnCover" );
    level scripts\engine\utility::waittill_any( "game_ended", "bro_shot_start" );
    thread _id_5285();
}

_id_40EC()
{
    self endon( "death" );
    self endon( "despawnCover" );
    self.owner waittill( "disconnect" );
    thread _id_5285( 1 );
}

_id_CC21( var_0 )
{
    self notify( "powers_deployableCover_used", 0 );
    scripts\mp\utility\game::_id_CC16( var_0._id_13C2E, 1, var_0.origin );
    var_0 delete();
}
