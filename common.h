
#ifndef __COMMON_H__
#define __COMMON_H__

#include <stdint.h>

#define MAC_ADDR_LEN 6
#define SSID_LEN   64
#define MAC_MAX_STR  17
#define MAC_MIN_STR   12

#ifndef FREE
#define FREE(x) do { free(x); x = NULL; } while (0); 
#endif

char *tomac(const char *pszStr,char *pmac);
char *exe_shell(const char *cmd,char *resbuf,unsigned int size);
char *get_device_mac(char *buf);
uint8_t *get_device_sn();

#endif
