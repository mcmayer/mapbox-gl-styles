server:
	python -m SimpleHTTPServer

download:
	wget https://osm2vectortiles-downloads.os.zhdk.cloud.switch.ch/v2.0/extracts/rome_italy.mbtiles

tileserver:
	tileserver-gl-light rome-italy.mbtiles
