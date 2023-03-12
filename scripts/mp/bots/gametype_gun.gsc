// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{
    level.bot_funcs["gametype_think"] = ::bot_gun_think;
}

bot_gun_think()
{
    var_0 = self botgetdifficultysetting( "throwKnifeChance" );

    if ( var_0 < 0.25 )
        self botsetdifficultysetting( "throwKnifeChance", 0.25 );

    self botsetdifficultysetting( "allowGrenades", 1 );
}
