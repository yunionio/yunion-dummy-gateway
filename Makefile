VERSION:=1.0

docker-image:
	docker build -t fpm .

rpm:
	mkdir -p .empty/dummy-gateway
	docker run -it --rm -v $(CURDIR):/build fpm \
		fpm -C /build -s dir -t rpm -n yunion-dummy-gateway -v $(VERSION) --force -p /build \
			yunion-dummy-gateway=/opt/yunion/bin/ \
			yunion-dummy-gateway@.service=/usr/lib/systemd/system/ \
			.empty/dummy-gateway=/etc/yunion/ \

	rm -r .empty


.PHONY: docker-image rpm
