version ?= latest

build-docker:
	@echo Building Rusty Hogs $(version)
	docker build --tag rust-builder -f Dockerfile.build .
	docker build --tag wetfeet2000/ankamali_hog:$(version) --build-arg HOG=ankamali -f Dockerfile.hog .
	docker build --tag wetfeet2000/berkshire_hog:$(version) --build-arg HOG=berkshire -f Dockerfile.hog .
	docker build --tag wetfeet2000/choctaw_hog:$(version) --build-arg HOG=choctaw -f Dockerfile.hog .
	docker build --tag wetfeet2000/duroc_hog:$(version) --build-arg HOG=duroc -f Dockerfile.hog .
	docker build --tag wetfeet2000/essex_hog:$(version) --build-arg HOG=essex -f Dockerfile.hog .
	docker build --tag wetfeet2000/gottingen_hog:$(version) --build-arg HOG=gottingen -f Dockerfile.hog .

