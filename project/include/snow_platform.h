#ifndef _SNOW_PLATFORM_H_
#define _SNOW_PLATFORM_H_

#include <stdio.h>
#include <string>

namespace snow {
	namespace platform {
		std::string dialog_folder(const std::string &title);
		std::string dialog_open(const std::string &title);
		std::string dialog_save(const std::string &title);
	}
}


#endif //_SNOW_PLATFORM_H_