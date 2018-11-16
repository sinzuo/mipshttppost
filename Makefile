.PHONY: build run kill enter push pull

all:
	gcc httppost-test.c -o httppost

mips:
#	export PATH=$PATH:/home/jiang/barrier_breaker/staging_dir/toolchain-mipsel_24kec+dsp_gcc-4.8-linaro_uClibc-0.9.33.2/bin
#	export  STAGING_DIR=/home/jiang/barrier_breaker/staging_dir
	mipsel-openwrt-linux-gcc udpTrClient.c b64.c httppost.c common.c -L./ -I./json/out/include/json/  -L./json/out/lib -lpthread -ljson -luci -lubox  -o httppost
run: kill
	sudo docker run -d --name ftpd_server -p 21:21 -p 30000-30009:30000-30009 -e "PUBLICHOST=localhost" -e "ADDED_FLAGS=-d -d" pure-ftp-demo

kill:
	-sudo docker kill ftpd_server
	-sudo docker rm ftpd_server

enter:
	sudo docker exec -it ftpd_server sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
