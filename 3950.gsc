// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_DF0C()
{
    scripts\aitypes\bt_util::init();
    _id_03B1::_id_DEE8();
    _id_0F39::_id_2371();

    if ( !isdefined( level._id_10970 ) )
        level._id_10970 = [];

    level._id_10970["seeker"] = [];
    level._id_18EE["seeker"]["setup_func"] = ::_id_FA8A;
    level._effect["seeker_warning_beacon"] = loadfx( "vfx/iw7/_requests/mp/vfx_light_blink_red.vfx" );
    level._effect["seeker_sparks"] = loadfx( "vfx/misc/sparks/vfx_transformer_sparks_b_nolight" );
    level._effect["seeker_explosion"] = loadfx( "vfx/iw7/_requests/mp/power/vfx_spider_gren_exp.vfx" );
}

setupcallbacks()
{
    level.agent_funcs["seeker"]["on_killed"] = ::_id_C58D;
    level.agent_funcs["seeker"]["on_damaged"] = ::_id_C58B;
}

_id_FA8A()
{
    self._id_0010 = 0.5;
    self._id_0202 = 0;
    self._id_0293 = 48;
    self._id_A8BA = 0;
    self._id_5277 = 360;
    self._id_5278 = 340;
    self._id_B4CD = 3000;
    self._id_110D7 = self._id_5277 + 100;
    self._id_6B97 = 12;
    self._id_72C5 = 340;
    self._id_6B98 = 40;
    self._id_565E = 2500;
    self._id_69EF = 75;
    self._id_69EE = 30;
    self._id_69ED = 50;
    self._id_B632 = 9216;
    self._id_B5F1 = 160;
    self._id_B5F4 = 250;
    self._id_B5F2 = 1.2;
    self._id_B4D9 = 50;
    self._id_B5D9 = 32;
    self._id_B628 = 30;
    self._id_B626 = 45;
    self._id_C026 = 1;
    thread _id_FAEF();
}

_id_FAEF()
{
    self endon( "death" );
    wait 0.1;
    self _meth_8504( 1, "bot_move_forward", "bot_jump", "bot_double_jump" );
}

_id_1090C( var_0, var_1, var_2 )
{
    scripts\mp\utility\game::_id_D915( "spider grenade spawn", var_2 );
    var_3 = scripts\mp\mp_agent::_id_108E8( "seeker", var_2.team, var_0, var_1 );

    if ( !isdefined( var_3 ) )
        return undefined;

    scripts\mp\equipment\spider_grenade::spidergrenade_addtoactiveagentarray( var_3 );
    var_3.owner = var_2;
    var_3._id_9F72 = 1;
    var_3._id_9F46 = 1;

    if ( var_3.owner scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" ) )
    {
        var_3.hasruggedeqp = 1;
        var_3 scripts\mp\mp_agent::set_agent_health( 30 );
    }

    var_3 _meth_831F( var_2 );
    var_3 _meth_8500( 0 );
    return var_3;
}

_id_C58B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = self.owner;
    var_13 = var_1;

    if ( isdefined( var_1 ) && isdefined( var_1.owner ) )
        var_13 = var_1.owner;

    if ( isdefined( level._id_13CA6 ) )
        var_5 = [[ level._id_13CA6 ]]( var_5, var_0 );

    if ( var_4 == "MOD_FALLING" )
        var_2 = 0;
    else if ( var_4 == "MOD_MELEE" )
        var_2 = 0;
    else if ( scripts\mp\weapons::_id_66AA( var_5, var_4 ) )
        var_2 = 0;
    else if ( isdefined( var_0 ) && !scripts\mp\equipment\phase_shift::_id_213D( self, var_0 ) )
        var_2 = 0;
    else if ( isdefined( var_1 ) )
    {
        if ( !isdefined( var_0 ) && !scripts\mp\equipment\phase_shift::_id_213D( self, var_13 ) )
            var_2 = 0;
        else if ( !level._id_740A && var_12 != var_13 && !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( var_12, var_13 ) ) )
            var_2 = 0;
    }

    if ( var_2 )
    {
        var_14 = getseekermaxhealth();
        var_15 = 1;

        if ( scripts\mp\utility\game::_id_9DFF( var_5, var_4 ) )
            var_15 = 2;
        else if ( var_2 >= scripts\mp\weapons::minegettwohitthreshold() )
            var_15 = 2;

        var_2 = var_15 * var_14;

        if ( isplayer( var_13 ) )
        {
            var_16 = scripts\engine\utility::ter_op( scripts\mp\utility\game::istrue( self.hasruggedeqp ), "hitequip", "" );
            var_13 scripts\mp\damagefeedback::updatedamagefeedback( var_16, var_2 >= self.maxhealth );
        }

        _id_0AE2::equipmenthit( var_12, var_13, var_5, var_4 );

        if ( var_2 >= self.health )
        {
            if ( isdefined( var_13 ) && isdefined( var_12 ) && scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( var_13, var_12 ) ) )
                var_13 thread scripts\mp\utility\game::_id_83B4( "destroyed_equipment" );

            if ( isdefined( self.owner ) )
            {
                thread scripts\mp\equipment\spider_grenade::spidergrenade_explode();
                return;
            }
        }
    }

    self finishagentdamage( var_0, var_1, int( var_2 ), var_3, var_4, var_5, var_6, var_7, var_8, var_9, 0.0, var_10, var_11 );
}

_id_C58D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    scripts\mp\equipment\spider_grenade::spidergrenade_removefromactiveagentarray( self );
    scripts\mp\mp_agent::deactivateagent();
}

getseekermaxhealth()
{
    return 15;
}

getseekermaxhealthrugged()
{
    return 30;
}
