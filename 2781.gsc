// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level thread _id_C56E();
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isai( var_0 ) )
        {
            var_0._id_0240 = var_0 getrankedplayerdata( level._id_AEA6, "squadMembers", "patch" );
            var_0._id_0241 = var_0 getrankedplayerdata( level._id_AEA6, "squadMembers", "patchbacking" );
            var_0._id_023F = var_0 getrankedplayerdata( level._id_AEA6, "squadMembers", "background" );
        }
    }
}
