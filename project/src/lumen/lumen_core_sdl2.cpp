
#include "lumen_core.h"

#include <SDL.h>

namespace lumen {

        //forward
    int init_core_sdl();
    int shutdown_core_sdl();


    static bool core_sdl_inited = false;


        //general handler for lumen auxiliary 
        //stuff, like SDL core systems
    int init_core_aux() {

        init_core_sdl();

        return 0;

    }    

    int shutdown_core_aux() {

        shutdown_core_sdl();

        return 0;

    } //shutdown_core_aux

//Helpers

    int init_core_sdl() {
        
        if(core_sdl_inited) {
            return 0;
        }

        core_sdl_inited = true;

        return SDL_Init(SDL_INIT_TIMER);

    } //init_core_sdl   

    int shutdown_core_sdl() {

        core_sdl_inited = false;
        SDL_Quit();

        return 0;
    }

} //namespace lumen
