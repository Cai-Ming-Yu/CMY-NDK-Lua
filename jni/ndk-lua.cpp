#include <main.h>

#include <iostream>
#include <lua.hpp>

using namespace std;

signed main()
{
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);

    if (luaL_loadbuffer(L, reinterpret_cast<const char *>(main_lua), main_lua_len, "main_lua") || lua_pcall(L, 0, 0, 0))
    {
        cerr << "Error: " << lua_tostring(L, -1) << endl;
        lua_pop(L, 1);
    }

    lua_close(L);
    return 0;
}