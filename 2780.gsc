// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_D41B()
{
    level._effect["shoulder_cannon_charge"] = loadfx( "vfx/old/misc/shoulder_cannon_charge" );
    level._effect["shoulder_cannon_view_flash"] = loadfx( "vfx/core/muzflash/minigun_flash_view" );
}

_id_E89C()
{
    var_0 = self getcurrentweapon();
    scripts\engine\utility::_id_1C76( 0 );
    scripts\mp\utility\game::_id_12C6( "phaseshift_activation_mp" );
    scripts\mp\utility\game::_id_141B( "phaseshift_activation_mp" );
    scripts\engine\utility::waitframe();
    scripts\mp\utility\game::_id_141A( var_0 );
    wait 0.2;
    scripts\engine\utility::_id_1C76( 1 );
    scripts\mp\utility\game::_id_141E( "phaseshift_activation_mp" );
}

_id_E169()
{
    self notify( "remove_shoulder_cannon" );
}

_id_D41C()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "remove_shoulder_cannon" );
    _id_E89C();
    self playlocalsound( "trophy_turret_plant_plr" );
    self playsoundtoteam( "trophy_turret_plant_npc", "allies", self );
    self playsoundtoteam( "trophy_turret_plant_npc", "axis", self );
    var_0 = spawnturret( "misc_turret", self gettagorigin( "j_shoulder_ri" ), "ball_drone_gun_mp" );
    var_0 linkto( self, "j_shoulder_ri", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0 setmodel( "vehicle_drone_backup_buddy_gun" );
    var_0.angles = self.angles;
    var_0.owner = self;
    var_0.team = self.team;
    var_0 maketurretinoperable();
    var_0 makeunusable();
    self.vehicle = var_0;
    var_0._id_1E2D = 100;

    if ( level.teambased )
        var_0 _meth_835E( self.team );

    var_0 _meth_830F( "sentry" );
    var_0 _meth_8336( self );
    var_0 _meth_82FB( 180 );
    var_0 _meth_8330( 180 );
    var_0 _meth_82B6( 90 );
    var_0 _meth_8353( 30 );
    var_0 thread _id_27D4( self, 1 );
    var_0 _meth_835A( 1, "buddy_turret" );
    self setclientomnvar( "ui_shoulder_cannon_ammo", var_0._id_1E2D );
    self setclientomnvar( "ui_eng_drone_ammo_type", 1 );
    self setclientomnvar( "ui_shoulder_cannon_state", 0 );
    var_0 _meth_831F( self );
    var_0._id_11196 = 0;
    var_0 thread _id_139C8();
    thread _id_13A59( var_0 );
    thread _id_1000B( var_0 );
    self setclientomnvar( "ui_shoulder_cannon", 1 );
}

_id_13A59( var_0 )
{
    self notify( "cannon_deleted" );
    self endon( "cannon_deleted" );
    scripts\engine\utility::waittill_any( "death", "disconnect" );
    var_0 delete();

    if ( isdefined( self ) )
    {
        self setclientomnvar( "ui_shoulder_cannon_ammo", 0 );
        self setclientomnvar( "ui_shoulder_cannon", 0 );
        self setclientomnvar( "ui_shoulder_cannon_target_ent", -1 );
        self setclientomnvar( "ui_shoulder_cannon_hud_reticle", 0 );
    }
}

_id_139C8()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        _id_1000A( var_1 );
    }
}

_id_1000A( var_0 )
{
    self notify( "shoulderCannon_stunned" );
    self endon( "shoulderCannon_stunned" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    level endon( "game_ended" );
    self._id_11196 = 1;
    self notify( "turretstatechange" );
    wait( var_0 );
    self._id_11196 = 0;
    self notify( "turretstatechange" );
}

_id_F67C( var_0 )
{
    var_1 = 20;
    var_2 = var_1 * 1000 + gettime();
    self setclientomnvar( "ui_shoulder_cannon_timer_end_milliseconds", var_2 );
    self._id_38D5 = var_2;
    thread _id_139CA();
    thread _id_139CB( var_1, var_0 );
    thread _id_139C9();
}

_id_139CA()
{
    self notify( "watchCannonTimeoutHostMigration" );
    self endon( "watchCannonTimeoutHostMigration" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    level waittill( "host_migration_begin" );
    var_0 = scripts\mp\hostmigration::waittillhostmigrationdone();

    if ( var_0 > 0 )
        self setclientomnvar( "ui_shoulder_cannon_timer_end_milliseconds", self._id_38D5 + var_0 );
    else
        self setclientomnvar( "ui_shoulder_cannon_timer_end_milliseconds", self._id_38D5 );
}

_id_139CB( var_0, var_1 )
{
    self notify( "watchCannonTimer" );
    self endon( "watchCannonTimer" );
    self endon( "cannon_deleted" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_2 = 5;
    scripts\mp\hostmigration::_id_13707( var_0 - var_2 - 1 );

    while ( var_2 > 0 )
    {
        self playsoundtoplayer( "mp_cranked_countdown", self );
        scripts\mp\hostmigration::_id_13707( 1.0 );
        var_2--;
    }

    self setclientomnvar( "ui_shoulder_cannon_ammo", 0 );
    waittillframeend;
    self setclientomnvar( "ui_shoulder_cannon", 0 );
    var_1 delete();
}

_id_139C9()
{
    self notify( "watchCannonEndGame" );
    self endon( "watchCannonEndGame" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        if ( game["state"] == "postgame" || level._id_7669 )
        {
            self setclientomnvar( "ui_shoulder_cannon_timer_end_milliseconds", 0 );
            break;
        }

        wait 0.1;
    }
}

_id_27D4( var_0, var_1 )
{
    self notify( "turret_toggle" );
    self endon( "turret_toggle" );
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "turretstatechange" );

        if ( var_1 == 1 )
        {
            if ( self _meth_81A0() && self._id_1E2D > 0 && ( isdefined( self._id_11196 ) && !self._id_11196 ) )
            {
                self laseron();
                _id_58ED( 0.2, var_0 );
                thread _id_27D7( var_0 );
            }
            else
            {
                self laseroff();
                thread _id_27D8();
                var_0 setclientomnvar( "ui_shoulder_cannon_target_ent", -1 );
                var_0 setclientomnvar( "ui_shoulder_cannon_hud_reticle", 0 );
            }

            continue;
        }

        break;
    }
}

_id_27D7( var_0 )
{
    self endon( "turret_toggle" );
    self endon( "death" );
    self endon( "stop_shooting" );
    level endon( "game_ended" );
    var_1 = self;
    var_2 = level._effect["shoulder_cannon_view_flash"];
    var_3 = level._effect["shoulder_cannon_charge"];
    var_4 = weaponfiretime( "ball_drone_gun_mp" );
    var_5 = 0.01;
    self.owner waittill( "begin_firing" );

    while ( self._id_1E2D > 0 )
    {
        if ( self._id_1E2D <= 20 )
            var_6 = self._id_1E2D;
        else
            var_6 = randomintrange( 10, 20 );

        for ( var_7 = 0; var_7 < var_6; var_7++ )
        {
            if ( isdefined( var_1._id_93AF ) && var_1._id_93AF )
                break;

            var_8 = self getturrettarget( 0 );

            if ( isdefined( var_8 ) && _id_3874( var_8 ) )
            {
                var_0 setclientomnvar( "ui_shoulder_cannon_target_ent", var_8 getentitynumber() );
                var_0 setclientomnvar( "ui_shoulder_cannon_hud_reticle", 2 );
                self shootturret();
                var_0._id_38D8 = spawnfxforclient( var_2, var_0 geteye(), var_0 );
                triggerfx( var_0._id_38D8 );
                self.owner playrumbleonentity( "shoulder_turret_fire" );
                wait( var_4 );
                self._id_1E2D--;

                if ( self._id_1E2D < 0 )
                    self._id_1E2D = 0;

                var_0 setclientomnvar( "ui_shoulder_cannon_ammo", self._id_1E2D );
                var_0 setclientomnvar( "ui_shoulder_cannon_state", 2 );
                var_0 notify( "shoulder_cannon_update", self._id_1E2D * var_5 );

                if ( isdefined( var_0._id_38D8 ) )
                    var_0._id_38D8 delete();
            }
        }

        wait( randomfloatrange( 0.1, 0.2 ) );
    }

    var_0 setclientomnvar( "ui_shoulder_cannon_hud_reticle", 0 );

    if ( self._id_1E2D <= 0 )
    {
        var_0 setclientomnvar( "ui_shoulder_cannon_ammo", 0 );
        var_0 setclientomnvar( "ui_shoulder_cannon", 0 );
        waittillframeend;
        var_0 notify( "cannon_deleted" );
        self delete();
    }
}

_id_58ED( var_0, var_1 )
{
    var_2 = level._effect["shoulder_cannon_charge"];
    playfxontag( var_2, self, "tag_flash" );

    for ( var_3 = self getturrettarget( 0 ); var_0 > 0; var_0 -= 0.2 )
    {
        var_1 setclientomnvar( "ui_shoulder_cannon_target_ent", var_3 getentitynumber() );
        var_1 setclientomnvar( "ui_shoulder_cannon_hud_reticle", 1 );
        var_1 playlocalsound( "ball_drone_targeting" );

        if ( var_3._id_AE62 == "archetype_heavy" )
            break;

        wait 0.2;
    }

    var_1 setclientomnvar( "ui_shoulder_cannon_state", 1 );
    var_1 playlocalsound( "ball_drone_lockon" );
}

_id_27D8()
{
    self notify( "stop_shooting" );

    if ( isdefined( self._id_92FD ) )
        self setlookatent( self._id_92FD );

    self.owner setclientomnvar( "ui_shoulder_cannon_state", 0 );
}

_id_3874( var_0 )
{
    var_1 = 1;

    if ( isplayer( var_0 ) )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_0 ) || var_0.sessionstate != "playing" )
            return 0;
    }

    if ( level.teambased && isdefined( var_0.team ) && var_0.team == self.team )
        return 0;

    if ( isdefined( var_0.team ) && var_0.team == "spectator" )
        return 0;

    if ( isplayer( var_0 ) && var_0 == self.owner )
        return 0;

    if ( isplayer( var_0 ) && isdefined( var_0._id_10916 ) && ( gettime() - var_0._id_10916 ) / 1000 <= 5 )
        return 0;

    if ( isplayer( var_0 ) && var_0 scripts\mp\utility\game::_id_12D6( "specialty_blindeye" ) )
        return 0;

    if ( distancesquared( var_0.origin, self.origin ) > 810000 )
        return 0;

    if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_0 ) )
        return 0;

    return var_1;
}

_id_1000B( var_0 )
{
    self endon( "death" );
    self endon( "cannon_deleted" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_1 = 1;
    var_2 = _id_0AE2::_id_D735( "power_shoulderCannon" );

    for (;;)
    {
        if ( var_2 == "+frag" )
            self waittill( "power_primary_used" );
        else
            self waittill( "power_secondary_used" );

        if ( var_2 == "+frag" && self fragbuttonpressed() || var_2 == "+smoke" && self secondaryoffhandbuttonpressed() )
        {
            while ( var_2 == "+frag" && self fragbuttonpressed() || var_2 == "+smoke" && self secondaryoffhandbuttonpressed() )
            {
                if ( var_1 )
                {
                    var_1 = 0;
                    var_0 thread _id_27D4( self, var_1 );
                    self setclientomnvar( "ui_shoulder_cannon_state", 3 );
                    self setclientomnvar( "ui_shoulder_cannon_hud_reticle", 0 );
                }
                else
                {
                    var_1 = 1;
                    var_0 thread _id_27D4( self, var_1 );
                    var_0 notify( "turretstatechange" );
                    self setclientomnvar( "ui_shoulder_cannon_state", 0 );
                }

                break;
            }

            wait 0.05;
        }
    }
}
