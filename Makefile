MAGICS_BUNDLE_VERSION=4.2.0.6
ECBUILD_VERSION=2019.07.1

IMAGE_TAG = eduardrosert/magics:latest

all: image

.PHONY: clean image push run test

image:
	docker build \
	  --build-arg MAGICS_BUNDLE_VERSION=$(MAGICS_BUNDLE_VERSION) \
	  --build-arg ECBUILD_VERSION=$(ECBUILD_VERSION) \
	  --build-arg http_proxy=$(http_proxy) \
	  --build-arg https_proxy=$(https_proxy) \
	  --build-arg ftp_proxy=$(ftp_proxy) \
	  --build-arg no_proxy="$(no_proxy)" \
	  --file Dockerfile \
	  --tag $(IMAGE_TAG) \
	  .

push: image
	docker push $(IMAGE_TAG)

clean:
	-docker rmi $(IMAGE_TAG)
