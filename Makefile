.PHONY: server tileserver

server:
	python -m SimpleHTTPServer

tileserver:
	tileserver-gl-light rome-italy.mbtiles

download: rome-italy.mbtiles

rome-italy.mbtiles:
	wget -N --no-if-modified-since https://osm2vectortiles-downloads.os.zhdk.cloud.switch.ch/v2.0/extracts/rome_italy.mbtiles
