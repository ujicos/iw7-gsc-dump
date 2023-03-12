// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "ball_drone_radar", ::_id_128DB );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "ball_drone_backup", ::_id_128DB );
    level._effect["kamikaze_drone_explode"] = loadfx( "vfx/iw7/_requests/mp/killstreak/vfx_vulture_exp_vari.vfx" );
    level._id_27F0 = [];
    level._id_27F0["ball_drone_radar"] = spawnstruct();
    level._id_27F0["ball_drone_radar"]._id_11901 = 60.0;
    level._id_27F0["ball_drone_radar"].health = 999999;
    level._id_27F0["ball_drone_radar"].maxhealth = 500;
    level._id_27F0["ball_drone_radar"]._id_110EA = "ball_drone_radar";
    level._id_27F0["ball_drone_radar"]._id_13260 = "ball_drone_mp";
    level._id_27F0["ball_drone_radar"]._id_B91A = "veh_mil_air_un_pocketdrone_mp";
    level._id_27F0["ball_drone_radar"]._id_115EB = "used_ball_drone_radar";
    level._id_27F0["ball_drone_radar"]._id_7638 = loadfx( "vfx/core/mp/killstreaks/vfx_ims_sparks" );
    level._id_27F0["ball_drone_radar"]._id_7630 = loadfx( "vfx/core/expl/vehicle/ball/vfx_exp_ball_drone.vfx" );
    level._id_27F0["ball_drone_radar"]._id_1045F = "ball_drone_explode";
    level._id_27F0["ball_drone_radar"]._id_13523 = "nowl_destroyed";
    level._id_27F0["ball_drone_radar"]._id_13553 = "nowl_gone";
    level._id_27F0["ball_drone_radar"]._id_EC44 = "destroyed_ball_drone_radar";
    level._id_27F0["ball_drone_radar"]._id_D483 = ::_id_DBD4;
    level._id_27F0["ball_drone_radar"]._id_7632 = [];
    level._id_27F0["ball_drone_radar"]._id_7633 = [];
    level._id_27F0["ball_drone_radar"]._id_7634 = [];
    level._id_27F0["ball_drone_radar"]._id_7635 = [];
    level._id_27F0["ball_drone_radar"]._id_7632["enemy"] = loadfx( "vfx/core/mp/killstreaks/vfx_light_detonator_blink" );
    level._id_27F0["ball_drone_radar"]._id_7633["enemy"] = loadfx( "vfx/core/mp/killstreaks/vfx_light_detonator_blink" );
    level._id_27F0["ball_drone_radar"]._id_7634["enemy"] = loadfx( "vfx/core/mp/killstreaks/vfx_light_detonator_blink" );
    level._id_27F0["ball_drone_radar"]._id_7635["enemy"] = loadfx( "vfx/core/mp/killstreaks/vfx_light_detonator_blink" );
    level._id_27F0["ball_drone_radar"]._id_7632["friendly"] = loadfx( "vfx/misc/light_mine_blink_friendly" );
    level._id_27F0["ball_drone_radar"]._id_7633["friendly"] = loadfx( "vfx/misc/light_mine_blink_friendly" );
    level._id_27F0["ball_drone_radar"]._id_7634["friendly"] = loadfx( "vfx/misc/light_mine_blink_friendly" );
    level._id_27F0["ball_drone_radar"]._id_7635["friendly"] = loadfx( "vfx/misc/light_mine_blink_friendly" );
    level._id_27F0["ball_drone_radar"]._id_10B83 = 110;
    level._id_27F0["ball_drone_radar"]._id_4AB0 = 70;
    level._id_27F0["ball_drone_radar"]._id_DA90 = 36;
    level._id_27F0["ball_drone_radar"]._id_2732 = 124;
    level._id_27F0["ball_drone_radar"]._id_101BA = 55;
    level._id_27F0["ball_drone_backup"] = spawnstruct();
    level._id_27F0["ball_drone_backup"]._id_11901 = 60.0;
    level._id_27F0["ball_drone_backup"].health = 999999;
    level._id_27F0["ball_drone_backup"].maxhealth = 200;
    level._id_27F0["ball_drone_backup"]._id_110EA = "ball_drone_backup";
    level._id_27F0["ball_drone_backup"]._id_13260 = "backup_drone_mp";
    level._id_27F0["ball_drone_backup"]._id_B91A = "veh_mil_air_un_pocketdrone_mp";
    level._id_27F0["ball_drone_backup"]._id_115EB = "used_ball_drone_backup";
    level._id_27F0["ball_drone_backup"]._id_7630 = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_apex_dest_exp.vfx" );
    level._id_27F0["ball_drone_backup"]._id_1045F = "ball_drone_explode";
    level._id_27F0["ball_drone_backup"]._id_13523 = "ball_drone_backup_destroy";
    level._id_27F0["ball_drone_backup"]._id_13553 = "ball_drone_backup_timeout";
    level._id_27F0["ball_drone_backup"]._id_EC44 = "destroyed_ball_drone";
    level._id_27F0["ball_drone_backup"]._id_039B = "ball_drone_gun_mp";
    level._id_27F0["ball_drone_backup"]._id_13CA8 = "veh_mil_air_un_pocketdrone_gun_mp";
    level._id_27F0["ball_drone_backup"]._id_13CD8 = "tag_turret";
    level._id_27F0["ball_drone_backup"]._id_10474 = "weap_p99_fire_npc";
    level._id_27F0["ball_drone_backup"]._id_10472 = "ball_drone_targeting";
    level._id_27F0["ball_drone_backup"]._id_10465 = "ball_drone_lockon";
    level._id_27F0["ball_drone_backup"]._id_F267 = "sentry";
    level._id_27F0["ball_drone_backup"]._id_1349E = 1440000;
    level._id_27F0["ball_drone_backup"]._id_32C1 = 15;
    level._id_27F0["ball_drone_backup"]._id_32C0 = 9;
    level._id_27F0["ball_drone_backup"]._id_C9D3 = 0.3;
    level._id_27F0["ball_drone_backup"]._id_C9D1 = 1.3;
    level._id_27F0["ball_drone_backup"]._id_AF30 = 0.075;
    level._id_27F0["ball_drone_backup"]._id_D483 = ::_id_273C;
    level._id_27F0["ball_drone_backup"]._id_7632 = [];
    level._id_27F0["ball_drone_backup"]._id_7632["enemy"] = loadfx( "vfx/core/mp/killstreaks/vfx_light_detonator_blink" );
    level._id_27F0["ball_drone_backup"]._id_7632["friendly"] = loadfx( "vfx/misc/light_mine_blink_friendly" );
    level._id_27F0["ball_drone_backup"]._id_10B83 = 110;
    level._id_27F0["ball_drone_backup"]._id_4AB0 = 70;
    level._id_27F0["ball_drone_backup"]._id_DA90 = 36;
    level._id_27F0["ball_drone_backup"]._id_2732 = 124;
    level._id_27F0["ball_drone_backup"]._id_101BA = 55;
    level._id_27F0["ball_drone_ability_pet"] = spawnstruct();
    level._id_27F0["ball_drone_ability_pet"]._id_11901 = undefined;
    level._id_27F0["ball_drone_ability_pet"].health = 999999;
    level._id_27F0["ball_drone_ability_pet"].maxhealth = 500;
    level._id_27F0["ball_drone_ability_pet"]._id_110EA = undefined;
    level._id_27F0["ball_drone_ability_pet"]._id_13260 = "ball_drone_ability_pet_mp";
    level._id_27F0["ball_drone_ability_pet"]._id_B91A = "veh_mil_air_un_pocketdrone_mp";
    level._id_27F0["ball_drone_ability_pet"]._id_115EB = undefined;
    level._id_27F0["ball_drone_ability_pet"]._id_7638 = loadfx( "vfx/core/mp/killstreaks/vfx_ims_sparks" );
    level._id_27F0["ball_drone_ability_pet"]._id_7630 = loadfx( "vfx/core/expl/vehicle/ball/vfx_exp_ball_drone.vfx" );
    level._id_27F0["ball_drone_ability_pet"]._id_1045F = "ball_drone_explode";
    level._id_27F0["ball_drone_ability_pet"]._id_13523 = undefined;
    level._id_27F0["ball_drone_ability_pet"]._id_13553 = undefined;
    level._id_27F0["ball_drone_ability_pet"]._id_EC44 = undefined;
    level._id_27F0["ball_drone_ability_pet"]._id_54CE = 1;
    level._id_27F0["ball_drone_ability_pet"]._id_D483 = ::_id_151B;
    level._id_27F0["ball_drone_ability_pet"]._id_7632 = [];
    level._id_27F0["ball_drone_ability_pet"]._id_7633 = [];
    level._id_27F0["ball_drone_ability_pet"]._id_7634 = [];
    level._id_27F0["ball_drone_ability_pet"]._id_7635 = [];
    level._id_27F0["ball_drone_ability_pet"]._id_7632["enemy"] = loadfx( "vfx/core/mp/killstreaks/vfx_ball_drone_ability_1" );
    level._id_27F0["ball_drone_ability_pet"]._id_7633["enemy"] = loadfx( "vfx/core/mp/killstreaks/vfx_ball_drone_ability_2" );
    level._id_27F0["ball_drone_ability_pet"]._id_7634["enemy"] = loadfx( "vfx/core/mp/killstreaks/vfx_ball_drone_ability_3" );
    level._id_27F0["ball_drone_ability_pet"]._id_7635["enemy"] = loadfx( "vfx/core/mp/killstreaks/vfx_ball_drone_ability_4" );
    level._id_27F0["ball_drone_ability_pet"]._id_7632["friendly"] = loadfx( "vfx/core/mp/killstreaks/vfx_ball_drone_ability_1" );
    level._id_27F0["ball_drone_ability_pet"]._id_7633["friendly"] = loadfx( "vfx/core/mp/killstreaks/vfx_ball_drone_ability_2" );
    level._id_27F0["ball_drone_ability_pet"]._id_7634["friendly"] = loadfx( "vfx/core/mp/killstreaks/vfx_ball_drone_ability_3" );
    level._id_27F0["ball_drone_ability_pet"]._id_7635["friendly"] = loadfx( "vfx/core/mp/killstreaks/vfx_ball_drone_ability_4" );
    level._id_27F0["ball_drone_ability_pet"]._id_E192 = 1;
    level._id_27F0["ball_drone_ability_pet"]._id_10B83 = 95;
    level._id_27F0["ball_drone_ability_pet"]._id_4AB0 = 60;
    level._id_27F0["ball_drone_ability_pet"]._id_DA90 = 36;
    level._id_27F0["ball_drone_ability_pet"]._id_2732 = 124;
    level._id_27F0["ball_drone_ability_pet"]._id_101BA = 20;
    level._id_27EF = [];
    level.balldronepathnodes = getallnodes();
    var_0 = [ "passive_guard", "passive_no_radar", "passive_self_destruct", "passive_decreased_health", "passive_seeker", "passive_decreased_speed" ];
    _id_0AC7::_id_DF07( "ball_drone_backup", var_0 );
}

_id_128DB( var_0 )
{
    return _id_13047( var_0._id_110EA, var_0 );
}

_id_13047( var_0, var_1 )
{
    var_2 = 1;

    if ( scripts\mp\utility\game::isusingremote() )
        return 0;
    else if ( _id_68C0() )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + var_2 >= scripts\mp\utility\game::_id_B4D2() )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_TOO_MANY_VEHICLES" );
        return 0;
    }
    else if ( isdefined( self._id_27D3 ) )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_COMPANION_ALREADY_EXISTS" );
        return 0;
    }
    else if ( isdefined( self._id_5CC4 ) )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_UNAVAILABLE" );
        return 0;
    }

    scripts\mp\utility\game::_id_93FA();
    var_3 = _id_4986( var_0, var_1 );

    if ( !isdefined( var_3 ) )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_UNAVAILABLE" );
        scripts\mp\utility\game::_id_4FC1();
        return 0;
    }

    self._id_27D3 = var_3;
    thread _id_10D6E( var_3 );
    self._id_27D3 thread _id_CA50();
    var_4 = level._id_27F0[var_0]._id_115EB;
    var_5 = _id_0AC7::getrarityforlootitem( var_1._id_1318B );

    if ( var_5 != "" )
        var_4 = var_4 + "_" + var_5;

    level thread scripts\mp\utility\game::_id_115DE( var_4, self );

    if ( var_0 == "ball_drone_backup" && scripts\mp\agents\agent_utility::_id_8011( self, "dog" ) > 0 )
        scripts\mp\missions::_id_D992( "ch_twiceasdeadly" );

    return 1;
}

_id_4986( var_0, var_1 )
{
    var_2 = self.angles;
    var_3 = anglestoforward( self.angles );
    var_4 = self.origin + var_3 * 100 + ( 0, 0, 90 );
    var_5 = self.origin + ( 0, 0, 90 );
    var_6 = bullettrace( var_5, var_4, 0 );
    var_7 = 3;

    while ( var_6["surfacetype"] != "none" && var_7 > 0 )
    {
        var_4 = self.origin + vectornormalize( var_5 - var_6["position"] ) * 5;
        var_6 = bullettrace( var_5, var_4, 0 );
        var_7--;
        wait 0.05;
    }

    if ( var_7 <= 0 )
        return;

    var_8 = anglestoright( self.angles );
    var_9 = self.origin + var_8 * 20 + ( 0, 0, 90 );
    var_6 = bullettrace( var_4, var_9, 0 );
    var_7 = 3;

    while ( var_6["surfacetype"] != "none" && var_7 > 0 )
    {
        var_9 = var_4 + vectornormalize( var_4 - var_6["position"] ) * 5;
        var_6 = bullettrace( var_4, var_9, 0 );
        var_7--;
        wait 0.05;
    }

    if ( var_7 <= 0 )
        return;

    var_10 = level._id_27F0[var_0]._id_B91A;
    var_11 = level._id_27F0[var_0].maxhealth;
    var_12 = &"KILLSTREAKS_HINTS_VULTURE_SUPPORT";
    var_13 = _id_0AC7::getrarityforlootitem( var_1._id_1318B );

    if ( var_13 != "" )
        var_10 = var_10 + "_" + var_13;

    if ( _id_0DC9::_id_A69F( var_1, "passive_self_destruct" ) )
        var_11 = int( var_11 / 1.1 );

    if ( _id_0DC9::_id_A69F( var_1, "passive_guard" ) )
        var_12 = &"KILLSTREAKS_HINTS_VULTURE_GUARD";

    var_14 = spawnhelicopter( self, var_4, var_2, level._id_27F0[var_0]._id_13260, var_10 );

    if ( !isdefined( var_14 ) )
        return;

    var_14 _meth_80C7();
    var_14 _meth_8317( 1 );
    var_14 _meth_81FA( 1 );
    var_14.health = level._id_27F0[var_0].health;
    var_14.maxhealth = var_11;
    var_14._id_00E1 = 0;
    var_14._id_02B3 = 140;
    var_14._id_7247 = 140;
    var_14.owner = self;
    var_14.team = self.team;
    var_14._id_27F1 = var_0;
    var_14._id_00BC = "ASSAULT";
    var_14._id_4C08 = var_12;
    var_14._id_110E8 = var_1;
    var_14 vehicle_setspeed( var_14._id_02B3, 16, 16 );
    var_14 setyawspeed( 120, 90 );
    var_14 setneargoalnotifydist( 16 );
    var_14 sethoverparams( 30, 10, 5 );
    var_14 _meth_856A( 50, 1.3, 30, 20 );
    var_14 _meth_831F( self );
    var_14 _meth_84E1( 1 );
    var_14 _meth_84E0( 1 );
    var_14._id_130AC = spawn( "script_model", var_14.origin );
    var_14._id_130AC linkto( var_14, "tag_origin" );
    var_14 _id_0DC9::_id_1843( var_14._id_27F1, "Killstreak_Ground", var_14.owner, 1 );

    if ( level.teambased )
        var_14 scripts\mp\entityheadicons::_id_F877( var_14.team, ( 0, 0, 25 ) );
    else
        var_14 scripts\mp\entityheadicons::_id_F7F2( var_14.owner, ( 0, 0, 25 ) );

    var_15 = 45;
    var_16 = 45;

    switch ( var_0 )
    {
        case "ball_drone_radar":
            var_15 = 90;
            var_16 = 90;
            var_17 = spawn( "script_model", self.origin );
            var_17.team = self.team;
            var_17 _meth_81F3( self );
            var_14._id_DBBF = var_17;
            var_14 thread _id_DBD6();
            var_14._id_1E2D = 99999;
            var_14._id_37C5 = distance( var_14.origin, var_14 gettagorigin( "camera_jnt" ) );
            var_14 thread scripts\mp\trophy_system::_id_1282B();
            var_14 thread _id_27DD();
            break;
        case "ball_drone_backup":
            var_14 setyawspeed( 150, 90 );
            var_14 _meth_856A( 100, 1.3, 30, 20 );
            var_14._id_7247 = 140;
            var_18 = spawnturret( "misc_turret", var_14 gettagorigin( level._id_27F0[var_0]._id_13CD8 ), level._id_27F0[var_0]._id_039B );
            var_18 linkto( var_14, level._id_27F0[var_0]._id_13CD8 );
            var_18 setmodel( level._id_27F0[var_0]._id_13CA8 );
            var_18.angles = var_14.angles;
            var_18.owner = var_14.owner;
            var_18.team = self.team;
            var_18 maketurretinoperable();
            var_18 makeunusable();
            var_18.vehicle = var_14;
            var_18._id_110E8 = var_1;
            var_18.health = level._id_27F0[var_0].health;
            var_18.maxhealth = level._id_27F0[var_0].maxhealth;
            var_18._id_00E1 = 0;
            var_19 = self.origin + var_3 * -100 + ( 0, 0, 40 );
            var_18._id_92FD = spawn( "script_origin", var_19 );
            var_18._id_92FD._id_0336 = "test";
            thread _id_92FE( var_18._id_92FD );

            if ( level.teambased )
                var_18 _meth_835E( self.team );

            var_18 _meth_830F( level._id_27F0[var_0]._id_F267 );
            var_18 _meth_8336( self );
            var_18 _meth_82FB( 180 );
            var_18 _meth_8330( 180 );
            var_18 _meth_82B6( 50 );
            var_18 thread _id_27D4();
            var_18 _meth_835A( 1, "buddy_turret" );
            var_18 _meth_82C8( 0.8 );
            var_20 = var_14.origin + ( anglestoforward( var_14.angles ) * -10 + anglestoright( var_14.angles ) * -10 ) + ( 0, 0, 6 );
            var_18._id_A63A = spawn( "script_model", var_20 );
            var_18._id_A63A setscriptmoverkillcam( "explosive" );
            var_18._id_A63A linkto( var_14 );
            var_14._id_129B9 = var_18;
            var_18._id_C8F2 = var_14;
            var_14 thread _id_27D5();
            var_14._id_129B9 thread _id_27D6();
            break;
        case "alien_ball_drone_4":
        case "alien_ball_drone_3":
        case "alien_ball_drone_2":
        case "alien_ball_drone_1":
        case "alien_ball_drone":
        case "ball_drone_eng_lethal":
            var_18 = spawnturret( "misc_turret", var_14 gettagorigin( level._id_27F0[var_0]._id_13CD8 ), level._id_27F0[var_0]._id_039B );
            var_18 linkto( var_14, level._id_27F0[var_0]._id_13CD8 );
            var_18 setmodel( level._id_27F0[var_0]._id_13CA8 );
            var_18.angles = var_14.angles;
            var_18.owner = var_14.owner;
            var_18.team = self.team;
            var_18 maketurretinoperable();
            var_18 makeunusable();
            var_18.vehicle = var_14;
            var_18.health = level._id_27F0[var_0].health;
            var_18.maxhealth = level._id_27F0[var_0].maxhealth;
            var_18._id_00E1 = 0;
            var_19 = self.origin + var_3 * -100 + ( 0, 0, 40 );
            var_18._id_92FD = spawn( "script_origin", var_19 );
            var_18._id_92FD._id_0336 = "test";
            thread _id_92FE( var_18._id_92FD );

            if ( level.teambased )
                var_18 _meth_835E( self.team );

            var_18 _meth_830F( level._id_27F0[var_0]._id_F267 );
            var_18 _meth_8336( self );
            var_18 _meth_82FB( 180 );
            var_18 _meth_8330( 180 );
            var_18 _meth_82B6( 50 );
            var_18 thread _id_27D4();
            var_18 _meth_835A( 1, "buddy_turret" );
            var_18 _meth_82C8( 0.8 );
            var_20 = var_14.origin + ( anglestoforward( var_14.angles ) * -10 + anglestoright( var_14.angles ) * -10 ) + ( 0, 0, 10 );
            var_18._id_A63A = spawn( "script_model", var_20 );
            var_18._id_A63A setscriptmoverkillcam( "explosive" );
            var_18._id_A63A linkto( var_14 );
            var_14._id_129B9 = var_18;
            var_18._id_C8F2 = var_14;
            var_14 thread _id_27D5();
            var_14._id_129B9 thread _id_27D6();
            break;
        case "ball_drone_ability_pet":
            var_15 = 90;
            var_16 = 90;
            break;
        default:
            break;
    }

    var_14 setmaxpitchroll( var_15, var_16 );
    var_14._id_1157A = var_9;
    var_14._id_254D = 10000;
    var_14._id_254C = 150;
    var_14._id_2550 = missile_createattractorent( var_14, var_14._id_254D, var_14._id_254C );
    var_14._id_8BE5 = 0;
    var_14._id_11196 = 0;
    var_14._id_93AF = 0;
    var_14 thread _id_13A10();
    var_14 thread _id_27E3();
    var_14 thread _id_27EB();
    var_14 thread _id_27E6();
    var_14 thread _id_27E5();
    var_14 thread _id_27E9();
    var_14 thread _id_27E1();
    var_21 = spawnstruct();
    var_21._id_13139 = 1;
    var_21._id_4E53 = ::_id_27E0;
    var_14 thread scripts\mp\movers::_id_892F( var_21 );

    if ( isdefined( level._id_27F0[var_14._id_27F1]._id_110EA ) )
        var_14.owner scripts\mp\matchdata::_id_AFC9( level._id_27F0[var_14._id_27F1]._id_110EA, var_14._id_1157A );

    var_14 thread balldrone_destroyongameend();
    return var_14;
}

_id_27E0( var_0 )
{
    if ( !isdefined( var_0._id_AA33._id_52CF ) || var_0._id_AA33._id_52CF )
        self notify( "death" );
}

_id_92FE( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_1 = anglestoforward( self.angles );

    for (;;)
    {
        if ( scripts\mp\utility\game::isreallyalive( self ) && !scripts\mp\utility\game::isusingremote() && anglestoforward( self.angles ) != var_1 )
        {
            var_1 = anglestoforward( self.angles );
            var_2 = self.origin + var_1 * -100 + ( 0, 0, 40 );
            var_0 moveto( var_2, 0.5 );
        }

        wait 0.5;
    }
}

_id_27D9()
{
    self endon( "death" );
    var_0 = level._id_27F0[self._id_27F1];

    for (;;)
    {
        foreach ( var_2 in level.players )
        {
            if ( isdefined( var_2 ) )
            {
                if ( level.teambased )
                {
                    if ( var_2.team != self.team )
                        self [[ var_0._id_D483 ]]( "enemy", var_2 );

                    continue;
                }

                if ( var_2 != self.owner )
                    self [[ var_0._id_D483 ]]( "enemy", var_2 );
            }
        }

        wait 1.0;
    }
}

_id_27DB()
{
    self endon( "death" );
    var_0 = level._id_27F0[self._id_27F1];

    foreach ( var_2 in level.players )
    {
        if ( isdefined( var_2 ) )
        {
            if ( level.teambased )
            {
                if ( var_2.team == self.team )
                    self [[ var_0._id_D483 ]]( "friendly", var_2 );

                continue;
            }

            if ( var_2 == self.owner )
                self [[ var_0._id_D483 ]]( "friendly", var_2 );
        }
    }

    thread _id_139D6();
    thread _id_13AAD();
}

_id_27E1()
{
    var_0 = level._id_27F0[self._id_27F1];
    self [[ var_0._id_D483 ]]();
}

_id_273C( var_0, var_1 )
{
    self setscriptablepartstate( "lights", "idle", 0 );
    self setscriptablepartstate( "dust", "active", 0 );
}

_id_151B( var_0, var_1 )
{
    self setscriptablepartstate( "lights", "idle", 0 );
}

_id_DBD4( var_0, var_1 )
{
    self setscriptablepartstate( "lights", "idle", 0 );
}

_id_139D6()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 waittill( "spawned_player" );
        var_1 = level._id_27F0[self._id_27F1];

        if ( isdefined( var_0 ) )
        {
            if ( level.teambased )
            {
                if ( var_0.team == self.team )
                    self [[ var_1._id_D483 ]]( "friendly", var_0 );
                else
                    self [[ var_1._id_D483 ]]( "enemy", var_0 );

                continue;
            }

            if ( var_0 == self.owner )
            {
                self [[ var_1._id_D483 ]]( "friendly", var_0 );
                continue;
            }

            self [[ var_1._id_D483 ]]( "enemy", var_0 );
        }
    }
}

_id_13AAD()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "joined_team", var_0 );
        var_0 waittill( "spawned_player" );
        var_1 = level._id_27F0[self._id_27F1];

        if ( isdefined( var_0 ) )
        {
            if ( level.teambased )
            {
                if ( var_0.team == self.team )
                    self [[ var_1._id_D483 ]]( "friendly", var_0 );
                else
                    self [[ var_1._id_D483 ]]( "enemy", var_0 );

                continue;
            }

            if ( var_0 == self.owner )
            {
                self [[ var_1._id_D483 ]]( "friendly", var_0 );
                continue;
            }

            self [[ var_1._id_D483 ]]( "enemy", var_0 );
        }
    }
}

_id_10D6E( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );

    switch ( var_0._id_27F1 )
    {
        case "alien_ball_drone_4":
        case "alien_ball_drone_3":
        case "alien_ball_drone_2":
        case "alien_ball_drone_1":
        case "alien_ball_drone":
        case "ball_drone_eng_lethal":
        case "ball_drone_backup":
            if ( isdefined( var_0._id_129B9 ) && isdefined( var_0._id_129B9._id_92FD ) )
                var_0 setlookatent( var_0._id_129B9._id_92FD );
            else
                var_0 setlookatent( self );

            break;
        default:
            var_0 setlookatent( self );
            break;
    }

    var_1 = balldrone_gettargetoffset( var_0, self );
    var_0 _meth_85C6( self, var_1, 16, 10 );
    var_0 vehicle_setspeed( var_0._id_02B3, 10, 10 );

    if ( var_0._id_27F1 == "ball_drone_backup" )
    {
        if ( _id_0DC9::_id_A69F( var_0._id_110E8, "passive_seeker" ) )
        {
            var_0 thread balldrone_patrollevel();
            var_0 thread balldrone_watchfornearbytargets();
        }
        else
        {
            var_0 thread _id_27DA();
            var_0 thread _id_27E7();
            var_0 thread _id_27EA();
            var_0 thread _id_27E8();
            var_0 thread balldrone_watchmodeswitch();
        }
    }
}

_id_27DA()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self endon( "target_assist" );
    self endon( "player_defend" );
    self endon( "switch_modes" );

    if ( !isdefined( self.owner ) )
    {
        thread _id_27DE();
        return;
    }

    self.owner endon( "disconnect" );
    self endon( "owner_gone" );

    if ( self._id_27F1 != "ball_drone_eng_lethal" )
        self vehicle_setspeed( self._id_7247, 20, 20 );
    else
        self vehicle_setspeed( self._id_7247, 25, 50 );

    for (;;)
    {
        var_0 = self.owner getstance();

        if ( !isdefined( self._id_A8F2 ) || var_0 != self._id_A8F2 || scripts\mp\utility\game::istrue( self.stoppedatlocation ) )
        {
            if ( scripts\mp\utility\game::istrue( self.stoppedatlocation ) )
                self.stoppedatlocation = undefined;

            self._id_A8F2 = var_0;
            var_1 = balldrone_gettargetoffset( self, self.owner );
            self _meth_85C6( self.owner, var_1, 16, 10 );
        }

        wait 0.5;
    }
}

_id_27DC( var_0 )
{
    var_1 = var_0._id_10B83;
    var_2 = self.owner getstance();

    switch ( var_2 )
    {
        case "stand":
            var_1 = var_0._id_10B83;
            break;
        case "crouch":
            var_1 = var_0._id_4AB0;
            break;
        case "prone":
            var_1 = var_0._id_DA90;
            break;
    }

    return var_1;
}

balldrone_watchfornearbytargets()
{
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "disconnect" );
    self._id_2525 = undefined;

    for (;;)
    {
        self._id_129B9 waittill( "turret_on_target" );
        self notify( "chase_nearby_target" );
        var_0 = self._id_129B9 getturrettarget( 1 );
        balldrone_guardlocation();
        var_1 = balldrone_gettargetoffset( self, var_0 );
        self _meth_85C6( var_0, var_1, 16, 10 );
        self._id_2525 = 1;
        thread _id_13B79( var_0, self.origin, 1 );
        self waittill( "disengage_target" );
        self._id_2525 = undefined;
        thread balldrone_patrollevel();
        scripts\engine\utility::waitframe();
    }
}

getvalidenemylist()
{
    var_0 = [];

    foreach ( var_2 in level.players )
    {
        if ( !self.owner scripts\mp\utility\game::isenemy( var_2 ) )
            continue;

        if ( !scripts\mp\utility\game::isreallyalive( var_2 ) )
            continue;

        if ( var_2 _meth_8181( "specialty_blindeye" ) )
            continue;

        var_0[var_0.size] = var_2;
    }

    return var_0;
}

vulturecanseeenemy( var_0 )
{
    var_1 = 0;
    var_2 = scripts\engine\trace::_id_48BC( 0, 1, 0, 1, 1, 0 );
    var_3 = [ var_0 gettagorigin( "j_head" ), var_0 gettagorigin( "j_mainroot" ), var_0 gettagorigin( "tag_origin" ) ];

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( !scripts\engine\trace::_id_DCF1( self.origin, var_3[var_4], self, var_2 ) )
            continue;

        var_1 = 1;
        break;
    }

    return var_1;
}

balldrone_patrollevel()
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "chase_nearby_target" );
    self.owner endon( "disconnect" );
    balldrone_guardlocation();
    self vehicle_setspeed( 15, 5, 5 );
    self setneargoalnotifydist( 30 );
    self._id_129B9 cleartargetentity();
    self _meth_8076();
    var_0 = self;
    var_1 = ( 0, 0, 50 );

    for (;;)
    {
        var_2 = findnewpatrolpoint( level.balldronepathnodes );
        self _meth_82D9( var_2 );
        self waittill( "near_goal" );
    }
}

findnewpatrolpoint( var_0 )
{
    var_1 = undefined;
    var_2 = 0;
    var_3 = sortbydistance( var_0, self.origin );
    var_3 = scripts\engine\utility::_id_22BD( var_3 );
    var_4 = [];

    foreach ( var_10, var_6 in var_3 )
    {
        if ( isdefined( self._id_4BF7 ) && var_6 == self._id_4BF7 )
            continue;

        if ( scripts\mp\utility\game::istrue( var_6._id_1305B ) && var_10 == var_3.size - 1 )
        {
            foreach ( var_8 in var_3 )
                var_8._id_1305B = undefined;

            var_2 = 1;
        }
        else if ( scripts\mp\utility\game::istrue( var_6._id_1305B ) )
            continue;

        var_4[var_4.size] = var_6;

        if ( var_4.size == 200 )
            break;
    }

    var_11 = randomintrange( 0, var_4.size );
    var_12 = var_4[var_11];

    if ( !isdefined( self.initialvalidnode ) )
        self.initialvalidnode = var_12;

    if ( scripts\mp\utility\game::istrue( var_2 ) )
    {
        self._id_4BF7 = self.initialvalidnode;
        var_2 = 0;
    }
    else
        self._id_4BF7 = var_12;

    self._id_4BF7._id_1305B = 1;
    return self._id_4BF7.origin + ( 0, 0, 80 );
}

_id_27E7()
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "switch_modes" );
    self.owner endon( "disconnect" );

    for (;;)
    {
        self.owner waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        var_9 = scripts\mp\utility\game::_id_13CA1( var_9, var_13 );

        if ( scripts\mp\utility\game::istrue( self._id_2525 ) )
            continue;

        if ( !_id_A00F( var_1 ) )
            continue;

        if ( scripts\mp\utility\game::istrue( self._id_11196 ) )
            continue;

        if ( !isplayer( var_1 ) )
            continue;

        if ( !self._id_129B9 _id_3874( var_1 ) )
            continue;

        self notify( "player_defend" );
        self._id_A8F2 = undefined;
        var_14 = balldrone_gettargetoffset( self, var_1 );
        self _meth_85C6( var_1, var_14, 16, 10 );
        self._id_2525 = 1;
        thread _id_13B79( var_1, undefined, 1 );
        break;
    }
}

_id_27EA()
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "switch_modes" );
    self.owner endon( "disconnect" );

    for (;;)
    {
        self.owner waittill( "victim_damaged", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( scripts\mp\utility\game::istrue( self._id_2525 ) )
            continue;

        if ( !_id_A00F( var_0 ) )
            continue;

        if ( scripts\mp\utility\game::istrue( self._id_11196 ) )
            continue;

        if ( !isplayer( var_0 ) )
            continue;

        if ( !self._id_129B9 _id_3874( var_0 ) )
            continue;

        self notify( "target_assist" );
        self._id_A8F2 = undefined;
        var_10 = balldrone_gettargetoffset( self, var_0 );
        self _meth_85C6( var_0, var_10, 16, 10 );
        self._id_2525 = 1;
        thread _id_13B79( var_0, undefined, 1 );
        break;
    }
}

_id_A00F( var_0, var_1, var_2 )
{
    var_3 = 0;
    var_4 = self.owner.origin;

    if ( isdefined( var_1 ) )
        var_4 = var_1;

    var_5 = 1000000;

    if ( isdefined( var_2 ) )
        var_5 = var_2;

    if ( distance2dsquared( var_4, var_0.origin ) < var_5 )
        var_3 = 1;

    return var_3;
}

_id_13B79( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "switch_modes" );
    self endon( "player_defend" );
    self endon( "target_assist" );
    self.owner endon( "disconnect" );

    for (;;)
    {
        if ( isdefined( var_0 ) && self._id_129B9 _id_3874( var_0 ) )
        {
            if ( scripts\mp\utility\game::istrue( var_2 ) && !_id_A00F( var_0, var_1 ) )
                break;
            else
                scripts\engine\utility::waitframe();

            continue;
        }

        break;
    }

    self notify( "disengage_target" );
}

_id_27E8()
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "switch_modes" );
    self.owner endon( "disconnect" );
    self waittill( "disengage_target" );
    self._id_2525 = undefined;
    thread _id_27DA();
    thread _id_27E7();
    thread _id_27EA();
    thread _id_27E8();
}

balldrone_guardlocation()
{
    self.stoppedatlocation = 1;
    self _meth_82D9( self.origin );
}

balldrone_seekclosesttarget()
{
    self endon( "drone_shot_down" );
    level endon( "game_ended" );
    thread balldrone_watchkamikazeinterrupt();
    self vehicle_setspeed( self._id_7247 + 25, 20, 20 );
    var_0 = getvalidenemylist();
    var_1 = undefined;

    if ( var_0.size > 0 )
        var_1 = sortbydistance( var_0, self.origin );

    if ( isdefined( var_1 ) && var_1.size > 0 )
    {
        var_2 = balldrone_gettargetoffset( self, var_1[0] );
        self _meth_85C6( var_1[0], var_2, 16, 10 );
        thread _id_13B79( var_1[0] );
        self waittill( "disengage_target" );
        balldrone_guardlocation();
    }
}

balldrone_watchkamikazeinterrupt()
{
    level endon( "game_ended" );
    self.owner endon( "disconnect" );
    var_0 = 100;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14 );
        var_10 = scripts\mp\utility\game::_id_13CA1( var_10, var_14 );

        if ( isdefined( var_2 ) )
        {
            if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_2 ) )
                continue;

            if ( var_2.team == self.team && var_2 != self.owner )
                continue;

            var_2 scripts\mp\damagefeedback::updatedamagefeedback( "" );
        }

        var_0 -= var_1;

        if ( var_0 <= 0 )
            self notify( "drone_shot_down" );
    }
}

balldrone_watchradarpulse()
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "switch_modes" );
    self.owner endon( "disconnect" );

    for (;;)
    {
        triggerportableradarping( self.origin, self.owner );
        self.owner playsound( "oracle_radar_pulse_npc" );
        wait 3;
    }
}

_id_27DF()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "death" );
    self.owner endon( "disconnect" );
    self endon( "owner_gone" );
    self notify( "ballDrone_moveToPlayer" );
    self endon( "ballDrone_moveToPlayer" );
    var_0 = balldrone_gettargetoffset( self, self.owner );
    self _meth_85C6( self.owner, var_0, 16, 10 );
    self._id_9A95 = 1;
    thread _id_27E4();
}

balldrone_watchmodeswitch()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "disconnect" );
    self endon( "owner_gone" );
    self._id_130AC _id_0DC9::_id_F774( self.owner, self._id_4C08, 360, 360, 30000, 30000, 3 );

    for (;;)
    {
        self._id_130AC waittill( "trigger", var_0 );

        if ( var_0 != self.owner )
            continue;

        if ( self.owner scripts\mp\utility\game::isusingremote() )
            continue;

        if ( isdefined( self.owner._id_55E4 ) && self.owner._id_55E4 > 0 )
            continue;

        if ( scripts\mp\utility\game::_id_9FAE( self.owner ) )
            continue;

        var_1 = 0;

        while ( self.owner usebuttonpressed() )
        {
            var_1 += 0.05;

            if ( var_1 > 0.1 )
            {
                self notify( "switch_modes" );
                self.owner playlocalsound( "mp_killstreak_warden_switch_mode" );
                self._id_00BC = _id_8026( self._id_00BC, self._id_110E8 );
                self notify( self._id_00BC );

                if ( self._id_00BC == "ASSAULT" )
                {
                    var_2 = &"KILLSTREAKS_HINTS_VULTURE_SUPPORT";

                    if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_guard" ) )
                        var_2 = &"KILLSTREAKS_HINTS_VULTURE_GUARD";

                    self _meth_8076();
                    self._id_93AF = 0;
                    self._id_129B9 notify( "turretstatechange" );
                    thread _id_27DA();
                    thread _id_27E7();
                    thread _id_27EA();
                    thread _id_27E8();
                }
                else
                {
                    var_2 = &"KILLSTREAKS_HINTS_VULTURE_ASSAULT";

                    if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_guard" ) )
                    {
                        self _meth_8076();
                        self._id_2525 = undefined;
                        balldrone_guardlocation();
                    }
                    else
                    {
                        self _meth_8076();
                        self._id_2525 = undefined;
                        self._id_93AF = 1;
                        self._id_129B9 notify( "turretstatechange" );
                        self._id_129B9 laseroff();
                        thread _id_27DA();
                        thread balldrone_watchradarpulse();
                    }
                }

                self._id_130AC makeunusable();
                scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1 );
                self._id_4C08 = var_2;
                self._id_130AC _id_0DC9::_id_F774( self.owner, self._id_4C08, 360, 360, 30000, 30000, 3 );
                break;
            }

            wait 0.05;
        }

        wait 0.05;
    }
}

_id_8026( var_0, var_1 )
{
    if ( var_0 == "ASSAULT" )
    {
        var_0 = "SUPPORT";

        if ( _id_0DC9::_id_A69F( var_1, "passive_guard" ) )
            var_0 = "GUARD";
    }
    else
        var_0 = "ASSAULT";

    return var_0;
}

_id_27E4()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "death" );
    self.owner endon( "disconnect" );
    self endon( "owner_gone" );
    self notify( "ballDrone_watchForGoal" );
    self endon( "ballDrone_watchForGoal" );
    var_0 = scripts\engine\utility::_id_13734( "goal", "near_goal", "hit_goal" );
    self._id_9A95 = 0;
    self._id_93AF = 0;
    self notify( "hit_goal" );
}

_id_DBD6()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "drone_toggle" );

    for (;;)
    {
        if ( isdefined( self._id_11196 ) && self._id_11196 )
        {
            wait 0.5;
            continue;
        }

        if ( isdefined( self._id_93AF ) && self._id_93AF )
        {
            wait 0.5;
            continue;
        }

        if ( isdefined( self._id_DBBF ) )
            self._id_DBBF moveto( self.origin, 0.5 );

        wait 0.5;
    }
}

_id_B0C8()
{
    level endon( "game_ended" );
    self endon( "drone_toggle" );
    self endon( "gone" );
    self endon( "death" );
    var_0 = getentarray( "low_entry", "targetname" );

    while ( var_0.size > 0 )
    {
        foreach ( var_2 in var_0 )
        {
            while ( self istouching( var_2 ) || self.owner istouching( var_2 ) )
            {
                if ( isdefined( var_2._id_EE79 ) )
                    self._id_B0C9 = float( var_2._id_EE79 );
                else
                    self._id_B0C9 = 0.5;

                wait 0.1;
            }

            self._id_B0C9 = undefined;
        }

        wait 0.1;
    }
}

_id_27E3()
{
    level endon( "game_ended" );
    self endon( "gone" );
    self waittill( "death" );
    thread _id_27ED();
}

_id_27EB()
{
    level endon( "game_ended" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    self endon( "owner_gone" );
    var_0 = level._id_27F0[self._id_27F1];
    var_1 = var_0._id_11901;

    if ( !isdefined( var_1 ) )
        return;

    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_1 );

    if ( isdefined( self.owner ) && isdefined( var_0._id_13553 ) )
        self.owner scripts\mp\utility\game::_id_D4B6( var_0._id_13553, undefined, undefined, self.owner.origin );

    thread _id_27DE();
}

_id_27E6()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner waittill( "killstreak_disowned" );
    self notify( "owner_gone" );
    thread _id_27DE();
}

_id_27E5()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );

    for (;;)
    {
        self.owner waittill( "death" );
        var_0 = level._id_27F0[self._id_27F1];

        if ( isdefined( var_0._id_54CE ) || scripts\mp\utility\game::getgametypenumlives() && self.owner.pers["deaths"] == scripts\mp\utility\game::getgametypenumlives() )
            thread _id_27DE();
    }
}

_id_27E9()
{
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "disconnect" );
    self endon( "owner_gone" );
    level scripts\engine\utility::waittill_any( "round_end_finished", "game_ended" );
    thread _id_27DE();
}

_id_27DE()
{
    self endon( "death" );
    self notify( "leaving" );
    _id_27EE();
}

_id_CA50()
{
    var_0 = "icon_minimap_vulture_enemy";
    self._id_6569 = _id_49F8( var_0, 1, 1 );

    foreach ( var_2 in level.players )
    {
        if ( !isplayer( var_2 ) )
            continue;

        if ( var_2 scripts\mp\utility\game::_id_12D6( "specialty_engineer" ) && var_2.team != self.team )
        {
            if ( self._id_6569 != -1 )
                scripts\mp\objidpoolmanager::minimap_objective_playermask_showto( self._id_6569, var_2 getentitynumber() );
        }
    }
}

_id_49F8( var_0, var_1, var_2 )
{
    var_3 = scripts\mp\objidpoolmanager::requestminimapid( 10 );

    if ( var_3 == -1 )
        return -1;

    scripts\mp\objidpoolmanager::minimap_objective_add( var_3, "invisible", ( 0, 0, 0 ) );

    if ( !isdefined( self _meth_8138() ) && !scripts\mp\utility\game::istrue( var_1 ) )
        scripts\mp\objidpoolmanager::minimap_objective_position( var_3, self.origin );
    else if ( scripts\mp\utility\game::istrue( var_1 ) && scripts\mp\utility\game::istrue( var_2 ) )
        scripts\mp\objidpoolmanager::minimap_objective_onentitywithrotation( var_3, self );
    else
        scripts\mp\objidpoolmanager::minimap_objective_onentity( var_3, self );

    scripts\mp\objidpoolmanager::minimap_objective_state( var_3, "active" );
    scripts\mp\objidpoolmanager::minimap_objective_icon( var_3, var_0 );
    scripts\mp\objidpoolmanager::minimap_objective_playermask_hidefromall( var_3 );
    return var_3;
}

_id_27DD()
{
    scripts\mp\damage::monitordamage( self.maxhealth, "ball_drone", ::_id_898F, ::_id_B938, 1 );
}

_id_27D5()
{
    self endon( "death" );
    self endon( "stop_monitor_damage" );
    level endon( "game_ended" );
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        var_9 = scripts\mp\utility\game::_id_13CA1( var_9, var_13 );

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_1 ) )
            continue;

        scripts\mp\damage::monitordamageoneshot( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, "ball_drone", ::_id_898F, ::_id_B938, 1 );
    }
}

_id_27D6()
{
    self endon( "death" );
    self._id_C8F2 endon( "stop_monitor_damage" );
    level endon( "game_ended" );
    self _meth_81F7();
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        var_9 = scripts\mp\utility\game::_id_13CA1( var_9, var_13 );

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_1 ) )
            continue;

        if ( isdefined( self._id_C8F2 ) )
            self._id_C8F2 scripts\mp\damage::monitordamageoneshot( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, "ball_drone", ::_id_898F, ::_id_B938, 1 );
    }
}

_id_B938( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;
    var_5 = _id_0DC9::_id_7FBD( var_0, var_1, var_2, var_5, self.maxhealth, 1, 1, 2 );
    return var_5;
}

_id_898F( var_0, var_1, var_2, var_3 )
{
    if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_self_destruct" ) )
    {
        self notify( "stop_monitor_damage" );
        var_4 = 2.5;
        self._id_93AF = 1;
        self notify( "switch_modes" );
        balldrone_guardlocation();
        thread balldrone_seekclosesttarget();
        var_5 = self.owner scripts\mp\utility\game::_id_1302( "dummy_spike_mp", self.origin, self.origin, var_4 );

        if ( !isdefined( var_5._id_13C2E ) )
            var_5._id_13C2E = "dummy_spike_mp";

        var_5 linkto( self );
        self setscriptablepartstate( "shortout", "active", 0 );
        self playsound( "vulture_destruct_initiate" );
        thread watchselfdestructfx();
        scripts\engine\utility::_id_13736( var_4, "drone_shot_down" );
        self playsound( "vulture_destruct_warning" );
        self setscriptablepartstate( "shortout", "neutral", 0 );
        playfx( scripts\engine\utility::_id_7ECB( "kamikaze_drone_explode" ), self.origin );
        playloopsound( self.origin, "vulture_destruct" );
        scripts\mp\shellshock::_id_22FF( 1.0, 0.7, 800 );

        if ( isdefined( self.owner ) )
            self _meth_8253( self.origin, 256, 200, 100, self.owner, "MOD_EXPLOSIVE", "ball_drone_gun_mp" );
    }

    var_6 = level._id_27F0[self._id_27F1];
    var_7 = "callout_destroyed_ball_drone";
    var_8 = _id_0AC7::getrarityforlootitem( self._id_110E8._id_1318B );

    if ( var_8 != "" )
        var_7 = var_7 + "_" + var_8;

    scripts\mp\damage::onkillstreakkilled( var_6._id_110EA, var_0, var_1, var_2, var_3, var_6._id_EC44, var_6._id_13523, var_7 );

    if ( self._id_27F1 == "ball_drone_backup" )
        var_0 scripts\mp\missions::_id_D992( "ch_vulturekiller" );

    if ( isdefined( var_1 ) && var_1 == "concussion_grenade_mp" )
    {
        if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
            var_0 scripts\mp\missions::_id_D991( "ch_tactical_emp_eqp" );
    }
}

watchselfdestructfx()
{
    self endon( "death" );
    wait 0.4;
    self playsoundonmovingent( "vulture_destruct_build_up" );
}

_id_13A10()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1, var_2, var_3, var_4 );
        _id_0DC9::dodamagetokillstreak( 100, var_0, var_0, self.team, var_2, var_4, var_3 );

        if ( !scripts\mp\utility\game::istrue( self._id_11196 ) )
            thread _id_27E2( var_1 );
    }
}

_id_27E2( var_0 )
{
    self notify( "ballDrone_stunned" );
    self endon( "ballDrone_stunned" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    level endon( "game_ended" );

    if ( scripts\mp\utility\game::istrue( self._id_2525 ) )
        self notify( "disengage_target" );

    self._id_11196 = 1;

    if ( isdefined( level._id_27F0[self._id_27F1]._id_7638 ) )
        playfxontag( level._id_27F0[self._id_27F1]._id_7638, self, "tag_origin" );

    if ( self._id_27F1 == "ball_drone_radar" )
    {
        if ( isdefined( self._id_DBBF ) )
            self._id_DBBF delete();
    }

    if ( isdefined( self._id_129B9 ) )
        self._id_129B9 notify( "turretstatechange" );

    playfxontag( scripts\engine\utility::_id_7ECB( "emp_stun" ), self, "tag_origin" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    stopfxontag( scripts\engine\utility::_id_7ECB( "emp_stun" ), self, "tag_origin" );
    self._id_11196 = 0;

    if ( self._id_27F1 == "ball_drone_radar" )
    {
        var_1 = spawn( "script_model", self.origin );
        var_1.team = self.team;
        var_1 _meth_81F3( self.owner );
        self._id_DBBF = var_1;
    }

    if ( isdefined( self._id_129B9 ) )
        self._id_129B9 notify( "turretstatechange" );
}

_id_27ED()
{
    if ( !isdefined( self ) )
        return;

    _id_27EE();
}

_id_27EE()
{
    if ( isdefined( level._id_27F0[self._id_27F1]._id_7630 ) )
        playfx( level._id_27F0[self._id_27F1]._id_7630, self.origin );

    if ( isdefined( level._id_27F0[self._id_27F1]._id_1045F ) )
        self playsound( level._id_27F0[self._id_27F1]._id_1045F );

    self notify( "explode" );
    _id_E0D2();
    scripts\mp\utility\game::_id_D915( "killstreak ended - ball_drone_backup", self.owner );
}

_id_E0D2()
{
    scripts\mp\utility\game::_id_4FC1();

    if ( isdefined( self._id_DBBF ) )
        self._id_DBBF delete();

    if ( isdefined( self._id_130AC ) )
        self._id_130AC delete();

    if ( isdefined( self._id_129B9 ) )
    {
        self._id_129B9 _meth_835A( 0 );

        if ( isdefined( self._id_129B9._id_92FD ) )
            self._id_129B9._id_92FD delete();

        if ( isdefined( self._id_129B9._id_A63A ) )
            self._id_129B9._id_A63A delete();

        self._id_129B9 delete();
    }

    if ( isdefined( self._id_6569 ) )
        scripts\mp\objidpoolmanager::returnminimapid( self._id_6569 );

    if ( isdefined( self.owner ) && isdefined( self.owner._id_27D3 ) )
        self.owner._id_27D3 = undefined;

    self.owner notify( "eng_drone_update", -1 );
    self delete();
}

_id_68C0()
{
    if ( level._id_27EF.size >= scripts\mp\utility\game::_id_B4D2() )
        return 1;
    else
        return 0;
}

_id_27D4()
{
    self.vehicle endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "turretstatechange" );

        if ( self _meth_81A0() && ( isdefined( self.vehicle._id_11196 ) && !self.vehicle._id_11196 ) && ( isdefined( self.vehicle._id_93AF ) && !self.vehicle._id_93AF ) )
        {
            self laseron();
            _id_58ED( level._id_27F0[self.vehicle._id_27F1]._id_AF30 );
            thread _id_27D7();
            continue;
        }

        self laseroff();
        thread _id_27D8();
    }
}

_id_27D7()
{
    self.vehicle endon( "death" );
    self endon( "stop_shooting" );
    level endon( "game_ended" );
    var_0 = self.vehicle;
    var_1 = weaponfiretime( level._id_27F0[var_0._id_27F1]._id_039B );
    var_2 = level._id_27F0[var_0._id_27F1]._id_32C1;
    var_3 = level._id_27F0[var_0._id_27F1]._id_C9D3;

    for (;;)
    {
        var_4 = var_2;

        for ( var_5 = 0; var_5 < var_4; var_5++ )
        {
            if ( isdefined( var_0._id_93AF ) && var_0._id_93AF )
                break;

            var_6 = self getturrettarget( 0 );

            if ( isdefined( var_6 ) && _id_3874( var_6 ) )
            {
                var_0 setlookatent( var_6 );
                level thread scripts\mp\battlechatter_mp::_id_EB87( var_6, "plr_killstreak_target" );
                self shootturret();
            }

            wait( var_1 );
        }

        wait( var_3 );
    }
}

_id_6D21()
{
    for (;;)
    {
        var_0 = self getturrettarget( 0 );

        if ( isdefined( var_0 ) && _id_3874( var_0 ) )
            scripts\mp\utility\game::_id_1309( "alienvulture_mp", self gettagorigin( "tag_flash" ), var_0.origin, self.owner );

        var_1 = weaponfiretime( "alienvulture_mp" );

        if ( isdefined( level._id_2787 ) && isdefined( self.owner ) )
            var_1 = self [[ level._id_2787 ]]( var_1, self.owner );

        wait( weaponfiretime( "alienvulture_mp" ) );
    }
}

_id_58ED( var_0 )
{
    while ( var_0 > 0 )
    {
        self playsound( level._id_27F0[self.vehicle._id_27F1]._id_10472 );
        wait 0.5;
        var_0 -= 0.5;
    }

    self playsound( level._id_27F0[self.vehicle._id_27F1]._id_10465 );
}

_id_27D8()
{
    self notify( "stop_shooting" );

    if ( isdefined( self._id_92FD ) )
        self.vehicle setlookatent( self._id_92FD );
}

_id_3874( var_0 )
{
    var_1 = 1;

    if ( isplayer( var_0 ) )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_0 ) || var_0.sessionstate != "playing" )
            return 0;

        if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_blindeye" ) )
            return 0;
    }

    if ( level.teambased && isdefined( var_0.team ) && var_0.team == self.team )
        return 0;

    if ( isdefined( var_0.team ) && var_0.team == "spectator" )
        return 0;

    if ( isplayer( var_0 ) && var_0 == self.owner )
        return 0;

    if ( isplayer( var_0 ) && isdefined( var_0._id_10916 ) && ( gettime() - var_0._id_10916 ) / 1000 <= 4 )
        return 0;

    if ( distancesquared( var_0.origin, self.origin ) > level._id_27F0[self.vehicle._id_27F1]._id_1349E )
        return 0;

    if ( isplayer( var_0 ) && scripts\mp\utility\game::_id_C7A0( self gettagorigin( "tag_flash" ), var_0 geteye() ) )
        return 0;

    if ( !isplayer( var_0 ) && scripts\mp\utility\game::_id_C7A0( self gettagorigin( "tag_flash" ), var_0.origin ) )
        return 0;

    return var_1;
}

balldrone_destroyongameend()
{
    self endon( "death" );
    level scripts\engine\utility::waittill_any( "bro_shot_start", "game_ended" );
    _id_27ED();
}

balldrone_gettargetoffset( var_0, var_1 )
{
    var_2 = level._id_27F0[var_0._id_27F1];
    var_3 = var_2._id_2732;
    var_4 = var_2._id_101BA;
    var_5 = var_0 _id_27DC( var_2 );

    if ( isdefined( var_0._id_B0C9 ) )
        var_5 *= var_0._id_B0C9;

    var_6 = ( var_4, var_3, var_5 );
    return var_6;
}
