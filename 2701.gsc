// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( level._id_BDCC )
    {
        foreach ( var_1 in level._id_115DA )
        {
            level._id_9F9F[var_1] = 0;
            level._id_1092F[var_1] = [];
        }
    }
    else
    {
        level._id_9F9F["allies"] = 0;
        level._id_9F9F["axis"] = 0;
        level._id_1092F["allies"] = [];
        level._id_1092F["axis"] = [];
    }

    _id_FAE9();
    level._id_29CB = [];
    level._id_29CB["reload"] = "inform_reloading_generic";
    level._id_29CB["frag_out"] = "inform_attack_grenade";
    level._id_29CB["flash_out"] = "inform_attack_flashbang";
    level._id_29CB["smoke_out"] = "inform_attack_smoke";
    level._id_29CB["conc_out"] = "inform_attack_stun";
    level._id_29CB["c4_plant"] = "inform_attack_thwc4";
    level._id_29CB["claymore_plant"] = "inform_plant_claymore";
    level._id_29CB["semtex_out"] = "semtex_use";
    level._id_29CB["kill"] = "inform_killfirm_infantry";
    level._id_29CB["casualty"] = "reaction_casualty_generic";
    level._id_29CB["suppressing_fire"] = "cmd_suppressfire";
    level._id_29CB["moving"] = "order_move_combat";
    level._id_29CB["callout_generic"] = "threat_infantry_generic";
    level._id_29CB["callout_response_generic"] = "response_ack_yes";
    level._id_29CB["damage"] = "inform_taking_fire";
    level._id_29CB["semtex_incoming"] = "semtex_incoming";
    level._id_29CB["c4_incoming"] = "c4_incoming";
    level._id_29CB["flash_incoming"] = "flash_incoming";
    level._id_29CB["stun_incoming"] = "stun_incoming";
    level._id_29CB["grenade_incoming"] = "grenade_incoming";
    level._id_29CB["rpg_incoming"] = "rpg_incoming";
    level._id_29AA = [];
    level._id_29AA["timeout"]["suppressing_fire"] = 5000;
    level._id_29AA["timeout"]["moving"] = 45000;
    level._id_29AA["timeout"]["callout_generic"] = 15000;
    level._id_29AA["timeout"]["callout_location"] = 3000;
    level._id_29AA["timeout_player"]["suppressing_fire"] = 10000;
    level._id_29AA["timeout_player"]["moving"] = 120000;
    level._id_29AA["timeout_player"]["callout_generic"] = 5000;
    level._id_29AA["timeout_player"]["callout_location"] = 5000;

    foreach ( var_5, var_4 in level._id_1092F )
    {
        level._id_29AA["last_say_time"][var_5]["suppressing_fire"] = -99999;
        level._id_29AA["last_say_time"][var_5]["moving"] = -99999;
        level._id_29AA["last_say_time"][var_5]["callout_generic"] = -99999;
        level._id_29AA["last_say_time"][var_5]["callout_location"] = -99999;
        level._id_29AA["last_say_pos"][var_5]["suppressing_fire"] = ( 0, 0, -9000 );
        level._id_29AA["last_say_pos"][var_5]["moving"] = ( 0, 0, -9000 );
        level._id_29AA["last_say_pos"][var_5]["callout_generic"] = ( 0, 0, -9000 );
        level._id_29AA["last_say_pos"][var_5]["callout_location"] = ( 0, 0, -9000 );
        level._id_13526[var_5][""] = 0;
        level._id_13526[var_5]["w"] = 0;
    }

    scripts\common\bcs_location_trigs::_id_29BB();
    scripts\mp\bcs_location_trigs::_id_29BB();
    var_6 = getdvar( "g_gametype" );
    level._id_9F92 = 1;

    if ( var_6 == "war" || var_6 == "kc" || var_6 == "dom" )
        level._id_9F92 = 0;

    level thread _id_C56E();
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_1 = var_0 getrankedplayerdata( "common", "gender" );

        if ( var_1 )
            var_0._id_7727 = "female";
        else
            var_0._id_7727 = "male";

        var_0 thread onplayerspawned();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        self._id_29AA = [];
        self._id_29AA["last_say_time"]["suppressing_fire"] = -99999;
        self._id_29AA["last_say_time"]["moving"] = -99999;
        self._id_29AA["last_say_time"]["callout_generic"] = -99999;
        self._id_29AA["last_say_time"]["callout_location"] = -99999;

        if ( scripts\mp\utility\game::_id_9D48( "archetype_heavy" ) )
            var_0 = "HV_";
        else if ( scripts\mp\utility\game::_id_9D48( "archetype_scout" ) )
            var_0 = "SN_";
        else if ( scripts\mp\utility\game::_id_9D48( "archetype_assassin" ) )
            var_0 = "FT_";
        else if ( scripts\mp\utility\game::_id_9D48( "archetype_engineer" ) )
            var_0 = "N6_";
        else if ( scripts\mp\utility\game::_id_9D48( "archetype_sniper" ) )
            var_0 = "GH_";
        else if ( scripts\mp\utility\game::_id_9D48( "archetype_assault" ) )
            var_0 = "AS_";
        else
            var_0 = "AS_";

        var_1 = scripts\mp\teams::_id_7E55();

        if ( isdefined( var_1 ) )
        {
            var_2 = var_1["body"];

            if ( isdefined( var_2 ) )
            {
                switch ( var_2 )
                {
                    case "mp_ftl_hero_valley_girl_body":
                        var_0 = "N6_";
                        break;
                    case "body_mp_ghost_zombies":
                        var_0 = "N6_";
                        break;
                }
            }
        }

        var_3 = !isagent( self ) && !scripts\mp\utility\game::isfemale();
        self.pers["voicePrefix"] = var_0 + var_3 + "_";

        if ( level._id_10A56 )
            continue;

        if ( !level.teambased )
            continue;

        if ( scripts\mp\utility\game::_id_9D46() )
        {
            self._id_29A4 = 1;
            continue;
        }

        thread _id_402C();
        thread _id_DF5F();
        thread _id_85E5();
        thread _id_85D1();
        thread _id_112CC();
        thread _id_3B20();
        thread _id_4D73();
        thread _id_10AC4();
        thread _id_117E1();
    }
}

_id_85D1()
{
    self endon( "disconnect" );
    self endon( "death" );
    var_0 = self.origin;
    var_1 = 147456;

    for (;;)
    {
        var_2 = scripts\engine\utility::ter_op( isdefined( level._id_85D5 ), level._id_85D5, [] );
        var_3 = scripts\engine\utility::ter_op( isdefined( level._id_B898 ), level._id_B898, [] );

        if ( var_2.size + var_3.size < 1 || !scripts\mp\utility\game::isreallyalive( self ) )
        {
            wait 0.05;
            continue;
        }

        var_2 = scripts\engine\utility::_id_227F( var_2, var_3 );

        foreach ( var_5 in var_2 )
        {
            wait 0.05;

            if ( !isdefined( var_5 ) )
                continue;

            if ( isdefined( var_5._id_13C2E ) )
            {
                switch ( var_5._id_13C2E )
                {
                    case "mobile_radar_mp":
                    case "motion_sensor_mp":
                    case "proximity_explosive_mp":
                    case "throwingreaper_mp":
                    case "throwingknifesmokewall_mp":
                    case "throwingknifeteleport_mp":
                    case "trophy_mp":
                    case "smoke_grenade_mp":
                    case "throwingknife_mp":
                    case "blackhole_grenade_mp":
                    case "throwingknifec4_mp":
                        continue;
                }

                if ( weaponinventorytype( var_5._id_13C2E ) != "offhand" && weaponclass( var_5._id_13C2E ) == "grenade" )
                    continue;

                if ( !isdefined( var_5.owner ) )
                    var_5.owner = getmissileowner( var_5 );

                if ( isdefined( var_5.owner ) && level.teambased && var_5.owner.team == self.team )
                    continue;

                var_6 = distancesquared( var_5.origin, self.origin );

                if ( var_6 < var_1 )
                {
                    if ( scripts\engine\utility::_id_4347() )
                    {
                        wait 5;
                        continue;
                    }

                    if ( bullettracepassed( var_5.origin, self.origin, 0, self ) )
                    {
                        if ( var_5._id_13C2E == "concussion_grenade_mp" || var_5._id_13C2E == "sensor_grenade_mp" )
                        {
                            level thread _id_EB84( self, "stun_incoming" );
                            wait 5;
                            continue;
                        }

                        if ( var_5._id_13C2E == "flash_grenade_mp" )
                        {
                            level thread _id_EB84( self, "flash_incoming" );
                            wait 5;
                            continue;
                        }

                        if ( weaponclass( var_5._id_13C2E ) == "rocketlauncher" )
                        {
                            level thread _id_EB84( self, "rpg_incoming" );
                            wait 5;
                            continue;
                        }

                        if ( var_5._id_13C2E == "c4_mp" )
                        {
                            level thread _id_EB84( self, "c4_incoming" );
                            wait 5;
                            continue;
                        }

                        if ( var_5._id_13C2E == "semtex_mp" )
                        {
                            level thread _id_EB84( self, "semtex_incoming" );
                            wait 5;
                            continue;
                        }

                        level thread _id_EB84( self, "grenade_incoming" );
                        wait 5;
                    }
                }
            }
        }
    }
}

_id_112CC()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = undefined;

    for (;;)
    {
        self waittill( "begin_firing" );
        thread _id_112D1();
        thread _id_112D0();
        self waittill( "stoppedFiring" );
    }
}

_id_112D0()
{
    thread _id_1371B();
    self endon( "begin_firing" );
    self waittill( "end_firing" );
    wait 0.3;
    self notify( "stoppedFiring" );
}

_id_1371B()
{
    self endon( "stoppedFiring" );
    self waittill( "begin_firing" );
    thread _id_112D0();
}

_id_112D1()
{
    self notify( "suppressWaiter" );
    self endon( "suppressWaiter" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "stoppedFiring" );
    wait 1;

    if ( _id_3902( "suppressing_fire" ) )
        level thread _id_EB84( self, "suppressing_fire" );
}

_id_402C()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "begin_firing" );
        var_0 = self getcurrentweapon();

        if ( var_0 == "claymore_mp" )
            level thread _id_EB84( self, "claymore_plant" );
    }
}

_id_DF5F()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "reload_start" );
        level thread _id_EB84( self, "reload" );
    }
}

_id_85E5()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "frag_grenade_mp" )
        {
            level thread _id_EB84( self, "frag_out" );
            continue;
        }

        if ( var_1 == "semtex_mp" )
        {
            level thread _id_EB84( self, "semtex_out" );
            continue;
        }

        if ( var_1 == "cluster_grenade_mp" )
        {
            level thread _id_EB84( self, "frag_out" );
            continue;
        }

        if ( var_1 == "flash_grenade_mp" )
        {
            level thread _id_EB84( self, "flash_out" );
            continue;
        }

        if ( var_1 == "concussion_grenade_mp" || var_1 == "sensor_grenade_mp" )
        {
            level thread _id_EB84( self, "conc_out" );
            continue;
        }

        if ( var_1 == "smoke_grenade_mp" || var_1 == "gas_grenade_mp" )
        {
            level thread _id_EB84( self, "smoke_out" );
            continue;
        }

        if ( var_1 == "c4_mp" )
            level thread _id_EB84( self, "c4_plant" );
    }
}

_id_10AC4()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "sprint_begin" );

        if ( _id_3902( "moving" ) )
            level thread _id_EB84( self, "moving", 0, 0 );
    }
}

_id_4D73()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( !isdefined( var_1.classname ) )
            continue;

        if ( var_1 != self && var_1.classname != "worldspawn" )
        {
            wait 1.5;
            level thread _id_EB84( self, "damage" );
            wait 3;
        }
    }
}

_id_3B20()
{
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self waittill( "death" );

    foreach ( var_1 in level._id_C928 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 == self )
            continue;

        if ( !scripts\mp\utility\game::isreallyalive( var_1 ) )
            continue;

        if ( !isdefined( self.team ) )
            continue;

        if ( var_1.team != self.team )
            continue;

        if ( isagent( var_1 ) )
            continue;

        if ( distancesquared( self.origin, var_1.origin ) <= 262144 )
        {
            level thread _id_EB85( var_1, "casualty", 0.75 );
            break;
        }
    }
}

_id_117E1()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "enemy_sighted" );

        if ( getomnvar( "ui_prematch_period" ) )
        {
            level waittill( "prematch_over" );
            continue;
        }

        if ( !_id_3902( "callout_location" ) && !_id_3902( "callout_generic" ) )
            continue;

        var_0 = self getsightedplayers();

        if ( !isdefined( var_0 ) )
            continue;

        var_1 = 0;
        var_2 = 4000000;

        if ( self playerads() > 0.7 )
            var_2 = 6250000;

        foreach ( var_4 in var_0 )
        {
            if ( isdefined( var_4 ) && scripts\mp\utility\game::isreallyalive( var_4 ) && !var_4 scripts\mp\utility\game::_id_12D6( "specialty_coldblooded" ) && distancesquared( self.origin, var_4.origin ) < var_2 )
            {
                var_5 = var_4 _id_81F7( self );
                var_1 = 1;

                if ( isdefined( var_5 ) && _id_3902( "callout_location" ) && _id_73DC( 4840000 ) )
                {
                    if ( scripts\mp\utility\game::_id_12D6( "specialty_quieter" ) || !_id_73DC( 262144 ) )
                        level thread _id_EB84( self, var_5._id_AECB[0], 0 );
                    else
                        level thread _id_EB84( self, var_5._id_AECB[0], 1 );

                    break;
                }
            }
        }

        if ( var_1 && _id_3902( "callout_generic" ) )
        {
            level thread _id_EB84( self, "callout_generic" );
            level thread _id_EB87( self, "plr_target_generic", undefined, 0.75 );
        }
    }
}

_id_EB85( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    wait( var_2 );
    _id_EB84( var_0, var_1, var_3, var_4 );
}

_id_EB84( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    if ( scripts\mp\utility\game::istrue( var_0._id_29A4 ) )
        return;

    if ( _id_9F6A( var_0 ) )
        return;

    if ( var_0.team != "spectator" )
    {
        var_4 = var_0.pers["voicePrefix"];

        if ( isdefined( level._id_29CB[var_1] ) )
            var_5 = var_4 + level._id_29CB[var_1];
        else
        {
            _id_AEC5( var_1 );
            var_5 = var_4 + "co_loc_" + var_1;
            var_0 thread _id_5ABF( var_5, var_1 );
            var_1 = "callout_location";
        }

        var_0 _id_12E72( var_1 );
        var_0 thread _id_5AB0( var_5, var_2, var_3 );
    }
}

_id_5AB0( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_3 = self.pers["team"];
    level _id_182A( self, var_3 );
    var_4 = !level._id_9F92 || !scripts\mp\utility\game::_id_12D6( "specialty_coldblooded" ) && ( isagent( self ) || self issighted() );

    if ( var_2 && var_4 )
    {
        if ( isagent( self ) || level._id_1BE6[var_3] > 3 )
            thread _id_5AB1( var_0, var_3 );
    }

    if ( isagent( self ) || isdefined( var_1 ) && var_1 )
        self playsoundtoteam( var_0, var_3 );
    else
        self playsoundtoteam( var_0, var_3, self );

    thread _id_118EF( var_0 );
    scripts\engine\utility::waittill_any( var_0, "death", "disconnect" );
    level _id_E173( self, var_3 );
}

_id_5AB1( var_0, var_1 )
{
    var_2 = spawn( "script_origin", self.origin + ( 0, 0, 256 ) );
    var_3 = var_0 + "_n";

    if ( soundexists( var_3 ) )
    {
        foreach ( var_5 in level._id_115DA )
        {
            if ( var_5 != var_1 )
                var_2 playsoundtoteam( var_3, var_5 );
        }
    }

    wait 3;
    var_2 delete();
}

_id_5ABF( var_0, var_1 )
{
    var_2 = scripts\engine\utility::_id_13734( var_0, "death", "disconnect" );

    if ( var_2 == var_0 )
    {
        var_3 = self.team;
        var_4 = self.pers["voicePrefix"];
        var_5 = self.origin;
        wait 0.5;

        foreach ( var_7 in level._id_C928 )
        {
            if ( !isdefined( var_7 ) )
                continue;

            if ( var_7 == self )
                continue;

            if ( !scripts\mp\utility\game::isreallyalive( var_7 ) )
                continue;

            if ( var_7.team != var_3 )
                continue;

            var_8 = var_7.pers["voicePrefix"];

            if ( !isdefined( var_8 ) )
                continue;

            if ( var_8 != var_4 && distancesquared( var_5, var_7.origin ) <= 262144 && !_id_9F6A( var_7 ) )
            {
                var_9 = var_8 + "co_loc_" + var_1 + "_echo";

                if ( soundexists( var_9 ) && scripts\engine\utility::_id_4347() )
                    var_10 = var_9;
                else
                    var_10 = var_8 + level._id_29CB["callout_response_generic"];

                var_7 thread _id_5AB0( var_10, 0, 1 );
                break;
            }
        }
    }
}

_id_118EF( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 2.0;
    self notify( var_0 );
}

_id_9F6A( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    if ( !isdefined( var_1 ) )
        var_1 = 1000;

    var_2 = var_1 * var_1;

    if ( isdefined( var_0 ) && isdefined( var_0.team ) && var_0.team != "spectator" )
    {
        for ( var_3 = 0; var_3 < level._id_1092F[var_0.team].size; var_3++ )
        {
            var_4 = level._id_1092F[var_0.team][var_3];

            if ( var_4 == var_0 )
                return 1;

            if ( !isdefined( var_4 ) )
                continue;

            if ( distancesquared( var_4.origin, var_0.origin ) < var_2 )
                return 1;
        }
    }

    return 0;
}

_id_182A( var_0, var_1 )
{
    level._id_1092F[var_1][level._id_1092F[var_1].size] = var_0;
}

_id_E173( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < level._id_1092F[var_1].size; var_3++ )
    {
        if ( level._id_1092F[var_1][var_3] == var_0 )
            continue;

        var_2[var_2.size] = level._id_1092F[var_1][var_3];
    }

    level._id_1092F[var_1] = var_2;
}

_id_55B4( var_0 )
{
    var_0._id_29A4 = 1;
}

_id_6260( var_0 )
{
    var_0._id_29A4 = undefined;
}

_id_3902( var_0 )
{
    var_1 = self.pers["team"];

    if ( var_1 == "spectator" )
        return 0;

    var_2 = level._id_29AA["timeout_player"][var_0];
    var_3 = gettime() - self._id_29AA["last_say_time"][var_0];

    if ( var_2 > var_3 )
        return 0;

    var_2 = level._id_29AA["timeout"][var_0];
    var_3 = gettime() - level._id_29AA["last_say_time"][var_1][var_0];

    if ( var_2 < var_3 )
        return 1;

    return 0;
}

_id_12E72( var_0 )
{
    var_1 = self.pers["team"];
    self._id_29AA["last_say_time"][var_0] = gettime();
    level._id_29AA["last_say_time"][var_1][var_0] = gettime();
    level._id_29AA["last_say_pos"][var_1][var_0] = self.origin;
}

_id_12EC1( var_0 )
{

}

_id_7F7E()
{
    var_0 = _id_7803();
    var_0 = scripts\engine\utility::_id_22A7( var_0 );

    if ( var_0.size )
    {
        foreach ( var_2 in var_0 )
        {
            if ( !_id_AEC6( var_2 ) )
                return var_2;
        }

        foreach ( var_2 in var_0 )
        {
            if ( !_id_AEC7( var_2 ) )
                return var_2;
        }
    }

    return undefined;
}

_id_81F7( var_0 )
{
    var_1 = _id_7803();
    var_1 = scripts\engine\utility::_id_22A7( var_1 );

    if ( var_1.size )
    {
        foreach ( var_3 in var_1 )
        {
            if ( !_id_AEC6( var_3 ) && var_0 _id_3878( var_3 ) )
                return var_3;
        }

        foreach ( var_3 in var_1 )
        {
            if ( !_id_AEC7( var_3 ) && var_0 _id_3878( var_3 ) )
                return var_3;
        }
    }

    return undefined;
}

_id_7803()
{
    var_0 = anim._id_29BC;
    var_1 = self getistouchingentities( var_0 );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( isdefined( var_4._id_AECB ) )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_12D96()
{
    if ( isdefined( anim._id_29BC ) )
        anim._id_29BC = scripts\engine\utility::_id_22BC( anim._id_29BC );
}

_id_9C15()
{
    var_0 = _id_7803();

    foreach ( var_2 in var_0 )
    {
        if ( !_id_AEC7( var_2 ) )
            return 1;
    }

    return 0;
}

_id_AEC6( var_0 )
{
    var_1 = _id_AEC9( var_0._id_AECB[0] );

    if ( !isdefined( var_1 ) )
        return 0;

    return 1;
}

_id_AEC7( var_0 )
{
    var_1 = _id_AEC9( var_0._id_AECB[0] );

    if ( !isdefined( var_1 ) )
        return 0;

    var_2 = var_1 + 25000;

    if ( gettime() < var_2 )
        return 1;

    return 0;
}

_id_AEC5( var_0 )
{
    anim._id_AECC[var_0] = gettime();
}

_id_AEC9( var_0 )
{
    if ( isdefined( anim._id_AECC[var_0] ) )
        return anim._id_AECC[var_0];

    return undefined;
}

_id_3878( var_0 )
{
    foreach ( var_2 in var_0._id_AECB )
    {
        var_3 = _id_7F7F( "co_loc_" + var_2 );
        var_4 = _id_80A3( var_2, 0 );
        var_5 = _id_7F7F( "concat_loc_" + var_2 );
        var_6 = soundexists( var_3 ) || soundexists( var_4 ) || soundexists( var_5 );

        if ( var_6 )
            return var_6;
    }

    return 0;
}

_id_3896( var_0 )
{
    var_1 = var_0._id_AECB;

    foreach ( var_3 in var_1 )
    {
        if ( _id_9D7A( var_3, self ) )
            return 1;
    }

    return 0;
}

_id_7E18( var_0 )
{
    var_1 = undefined;
    var_2 = self._id_AECB;

    foreach ( var_4 in var_2 )
    {
        if ( _id_9D7B( var_4, var_0 ) && !isdefined( self._id_DB40 ) )
        {
            var_1 = var_4;
            break;
        }

        if ( _id_9D7C( var_4 ) )
            var_1 = var_4;
    }

    return var_1;
}

_id_9D7C( var_0 )
{
    return issubstr( var_0, "_report" );
}

_id_9D7A( var_0, var_1 )
{
    var_2 = var_1 _id_7F7F( "concat_loc_" + var_0 );

    if ( soundexists( var_2 ) )
        return 1;

    return 0;
}

_id_9D7B( var_0, var_1 )
{
    if ( issubstr( var_0, "_qa" ) && soundexists( var_0 ) )
        return 1;

    var_2 = var_1 _id_80A3( var_0, 0 );

    if ( soundexists( var_2 ) )
        return 1;

    return 0;
}

_id_7F7F( var_0 )
{
    var_1 = self.pers["voicePrefix"] + var_0;
    return var_1;
}

_id_80A3( var_0, var_1 )
{
    var_2 = _id_7F7F( var_0 );
    var_2 += ( "_qa" + var_1 );
    return var_2;
}

_id_28D2()
{
    return 0;
}

_id_28D3()
{
    return 0;
}

_id_28DA( var_0 )
{

}

_id_28DB( var_0 )
{

}

_id_28D4( var_0 )
{

}

_id_7DAD( var_0 )
{

}

_id_28DC( var_0, var_1, var_2 )
{

}

_id_73DC( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 262144;

    foreach ( var_2 in level.players )
    {
        if ( var_2.team == self.pers["team"] )
        {
            if ( var_2 != self && distancesquared( var_2.origin, self.origin ) <= var_0 )
                return 1;
        }
    }

    return 0;
}

_id_FAE9()
{
    level._id_F215 = [];
    level._id_F215["plr_killfirm_c6"] = "kill_rig";
    level._id_F215["plr_killfirm_ftl"] = "kill_rig";
    level._id_F215["plr_killfirm_ghost"] = "kill_rig";
    level._id_F215["plr_killfirm_merc"] = "kill_rig";
    level._id_F215["plr_killfirm_stryker"] = "kill_rig";
    level._id_F215["plr_killfirm_warfighter"] = "kill_rig";
    level._id_F215["plr_killfirm_generic"] = "kill_gen";
    level._id_F215["plr_killfirm_amf"] = "kill_amf";
    level._id_F215["plr_killfirm_headshot"] = "kill_headshot";
    level._id_F215["plr_killfirm_grenade"] = "kill_grenade";
    level._id_F215["plr_killfirm_rival"] = "kill_rival";
    level._id_F215["plr_killfirm_semtex"] = "kill_semtex";
    level._id_F215["plr_killfirm_multi"] = "kill_multi";
    level._id_F215["plr_killfirm_twofer"] = "kill_twofer";
    level._id_F215["plr_killfirm_threefer"] = "kill_threefer";
    level._id_F215["plr_killfirm_killstreak"] = "kill_ss";
    level._id_F215["plr_killstreak_destroy"] = "kill_other_ss";
    level._id_F215["plr_killstreak_target"] = "targeted_by_ss";
    level._id_F215["plr_hit_back"] = "dmg_back";
    level._id_F215["plr_damaged_light"] = "dmg_light";
    level._id_F215["plr_damaged_heavy"] = "dmg_heavy";
    level._id_F215["plr_damaged_emp"] = "dmg_emp";
    level._id_F215["plr_healing"] = "healing";
    level._id_F215["plr_kd_high"] = "kd_high";
    level._id_F215["plr_firefight"] = "firefight";
    level._id_F215["plr_target_generic"] = "enemy_sighted";
    level._id_F215["plr_perk_super"] = "super_activate";
    level._id_F215["plr_perk_trophy"] = "super_activate";
    level._id_F215["plr_perk_turret"] = "super_activate";
    level._id_F215["plr_perk_amplify"] = "super_activate";
    level._id_F215["plr_perk_overdrive"] = "super_activate";
    level._id_F215["plr_perk_ftl"] = "super_activate";
    level._id_F215["plr_perk_pulse"] = "super_activate";
    level._id_F215["plr_perk_rewind"] = "super_activate";
    level._id_F215["plr_perk_super_kill"] = "super_kill";
    level._id_F215["plr_perk_trophy_block"] = "super_kill";
    level._id_F215["plr_perk_turret_kill"] = "super_kill";
    level._id_F215["plr_killfirm_shift"] = "super_kill";
    level._id_F215["plr_perk_railgun"] = "super_kill";
    level._id_F215["plr_perk_stealth"] = "super_kill";
    level._id_F215["plr_perk_armor"] = "super_kill";
    level._id_F215["plr_perk_charge"] = "super_kill";
    level._id_F215["plr_perk_dragon"] = "super_kill";
    level._id_F215["plr_perk_pound"] = "super_kill";
    level._id_F215["plr_perk_reaper"] = "super_kill";
    level._id_F214 = [];
    _id_F839( "kill_rig", 15, 0.3, 0.25 );
    _id_F839( "kill_gen", 30, 0.1, 0.25 );
    _id_F839( "kill_amf", 15, 0.5, 0.5 );
    _id_F839( "kill_headshot", 15, 0.7, 0.25 );
    _id_F839( "kill_grenade", 15, 0.5, 0.25 );
    _id_F839( "kill_rival", 15, 0.7, 0.25 );
    _id_F839( "kill_semtex", 15, 0.5, 0.25 );
    _id_F839( "kill_multi", 20, 0.6, 0.25 );
    _id_F839( "kill_twofer", 10, 0.7, 0.75 );
    _id_F839( "kill_threefer", 10, 0.8, 0.75 );
    _id_F839( "kill_ss", 10, 0.5, 0.2 );
    _id_F839( "kill_other_ss", 10, 0.7, 0.75 );
    _id_F839( "targeted_by_ss", 10, 0.4, 0.33 );
    _id_F839( "dmg_back", 20, 0.5, 0.5 );
    _id_F839( "dmg_light", 20, 0.4, 0.1 );
    _id_F839( "dmg_heavy", 20, 0.5, 0.2 );
    _id_F839( "healing", 10, 0.3, 0.1 );
    _id_F839( "kd_high", 20, 0.7, 0.8 );
    _id_F839( "enemy_sighted", 20, 0.2, 0.25 );
    _id_F839( "firefight", 10, 0.4, 0.33 );
    _id_F839( "super_activate", 10, 1.0, 1.0 );
    _id_F839( "super_kill", 10, 0.9, 0.66 );
}

_id_F839( var_0, var_1, var_2, var_3 )
{
    level._id_F214[var_0]["timeout"] = var_1;
    level._id_F214[var_0]["priority"] = var_2;
    level._id_F214[var_0]["chance"] = var_3;
}

_id_EB87( var_0, var_1, var_2, var_3 )
{
    if ( isagent( var_0 ) || !isplayer( var_0 ) )
        return;

    if ( scripts\mp\utility\game::istrue( var_0._id_29A4 ) )
        return;

    var_4 = var_0.pers["voicePrefix"] + var_1;

    if ( !isdefined( var_1 ) || !soundexists( var_4 ) )
    {
        if ( !isdefined( var_2 ) )
            return;

        var_1 = var_2;
        var_4 = var_0.pers["voicePrefix"] + var_1;

        if ( !soundexists( var_4 ) )
            return;
    }

    if ( !isdefined( var_0._id_F213 ) )
    {
        var_0._id_F213 = [];
        var_0._id_D4B0 = 0;
        var_0._id_DB91 = "none";
    }

    if ( isdefined( var_0._id_F213[level._id_F215[var_1]] ) && var_0._id_F213[level._id_F215[var_1]] > 0 )
        return;

    if ( !isdefined( var_0.pers["selfVOBonusChance"] ) )
        var_0 thread _id_12F14();

    if ( randomfloat( 1.0 ) > level._id_F214[level._id_F215[var_1]]["chance"] + var_0.pers["selfVOBonusChance"] )
        return;

    var_0 thread _id_128AC( var_1, var_3 );
}

_id_12F14()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self.pers["selfVOBonusChance"] = 0;

    for (;;)
    {
        self.pers["selfVOBonusChance"] += 0.1;
        wait 3.0;
    }
}

_id_128AC( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( self._id_DB91 == var_0 )
        return;

    if ( self._id_DB91 == "none" || level._id_F214[level._id_F215[self._id_DB91]]["priority"] < level._id_F214[level._id_F215[var_0]]["priority"] || level._id_F214[level._id_F215[self._id_DB91]]["priority"] == level._id_F214[level._id_F215[var_0]]["priority"] && scripts\engine\utility::_id_4347() )
        self._id_DB91 = var_0;
    else
        return;

    self notify( "addToSelfVOQueue" );
    self endon( "addToSelfVOQueue" );
    self._id_F212 = 1;

    if ( isdefined( var_1 ) )
        thread _id_F211( var_1 );

    var_2 = _id_809D( var_0 );
    var_3 = gettime();

    while ( self._id_D4B0 || !self._id_F212 || var_2 > gettime() )
    {
        if ( gettime() > var_3 + 2000 )
        {
            self._id_DB91 = "none";
            return;
        }

        wait 0.05;
    }

    scripts\engine\utility::waitframe();
    thread _id_D510( var_0 );
}

_id_809D( var_0 )
{
    if ( !isdefined( self._id_A9EC ) )
        self._id_A9EC = 0;

    return self._id_A9EC + 2000 + 10000 * ( 1.0 - level._id_F214[level._id_F215[var_0]]["priority"] );
}

_id_F211( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "addToSelfVOQueue" );
    self._id_F212 = 0;
    wait( var_0 );
    self._id_F212 = 1;
}

_id_D510( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_1 = self.pers["voicePrefix"] + var_0;
    self.pers["selfVOBonusChance"] = 0;
    self._id_DB91 = "none";
    var_2 = lookupsoundlength( var_1 ) / 1000;
    self._id_A9EC = gettime();
    thread _id_D4B1( var_2 );
    thread _id_12F15( var_0 );
    self playsoundtoplayer( var_1, self );
}

_id_D4B1( var_0 )
{
    self endon( "disconnect" );
    self._id_D4B0 = 1;
    wait( var_0 );
    self._id_D4B0 = 0;
}

_id_12F15( var_0 )
{
    self endon( "disconnect" );
    self._id_F213[level._id_F215[var_0]] = gettime();
    wait( level._id_F214[level._id_F215[var_0]]["timeout"] );
    self._id_F213[level._id_F215[var_0]] = 0;
}
