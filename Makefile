null:
	@:

docker-build: check-version
	@echo Building Rusty Hogs version: $(VERSION)
	docker build --tag rust-builder -f Dockerfile.build .
	docker build --tag nmcgivern546/ankamali_hog:$(VERSION) --build-arg HOG=ankamali -f Dockerfile.hog .
	docker build --tag nmcgivern546/berkshire_hog:$(VERSION) --build-arg HOG=berkshire -f Dockerfile.hog .
	docker build --tag nmcgivern546/choctaw_hog:$(VERSION) --build-arg HOG=choctaw -f Dockerfile.hog .
	docker build --tag nmcgivern546/duroc_hog:$(VERSION) --build-arg HOG=duroc -f Dockerfile.hog .
	docker build --tag nmcgivern546/essex_hog:$(VERSION) --build-arg HOG=essex -f Dockerfile.hog .
	docker build --tag nmcgivern546/gottingen_hog:$(VERSION) --build-arg HOG=gottingen -f Dockerfile.hog .
	docker build --tag nmcgivern546/hante_hog:$(VERSION) --build-arg HOG=hante -f Dockerfile.hog .

docker-save: check-version
	docker image save -o images.tar \
	nmcgivern546/ankamali_hog:$(VERSION) \
	nmcgivern546/berkshire_hog:$(VERSION) \
	nmcgivern546/choctaw_hog:$(VERSION) \
	nmcgivern546/duroc_hog:$(VERSION) \
	nmcgivern546/essex_hog:$(VERSION) \
	nmcgivern546/gottingen_hog:$(VERSION) \
	nmcgivern546/hante_hog:$(VERSION)

docker-load:
	docker load -i images.tar

docker-publish: check-version
	docker push nmcgivern546/ankamali_hog:$(VERSION)
	docker push nmcgivern546/berkshire_hog:$(VERSION)
	docker push nmcgivern546/choctaw_hog:$(VERSION)
	docker push nmcgivern546/duroc_hog:$(VERSION)
	docker push nmcgivern546/essex_hog:$(VERSION)
	docker push nmcgivern546/gottingen_hog:$(VERSION)
	docker push nmcgivern546/hante_hog:$(VERSION)

check-version:
	@if test ! $(VERSION); then echo "VERSION is undefined"; exit 1; fi
