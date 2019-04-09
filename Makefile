VERSION:=1.0

docker-image:
	docker build -t fpm .

rpm:
	docker run -it --rm -v $(CURDIR):/build fpm \
		fpm -C /build -s dir -t rpm -n yunion-dummy-gateway -v $(VERSION) --force -p /build \
			yunion-dummy-gateway=/opt/yunion/bin/ \
			yunion-dummy-gateway@.service=/usr/lib/systemd/system/ \


.PHONY: docker-image rpm
