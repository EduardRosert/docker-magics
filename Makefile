# version tags
MAGICS_BUNDLE_VERSION := 4.2.0
ECBUILD_VERSION := 2019.07.1
ECCODES_VERSION := 2.14.0

# test
TEST_CMD := python -m Magics selfcheck

# META
DOCKER_REPO := eduardrosert/magics
GIT_HASH := $(shell git rev-parse --short HEAD)
GIT_TAG  := $(shell git tag)

# Find out if the working directory is clean
GIT_NOT_CLEAN_CHECK := $(shell git status --porcelain)
ifneq (x${GIT_NOT_CLEAN_CHECK}, x)
DOCKER_TAG_SUFFIX = "-dirty"
endif

GIT_URL := $$(git remote get-url --push origin)
LATEST  := ${DOCKER_REPO}:latest
DATE    := $$(date -u +”%Y-%m-%dT%H:%M:%SZ)

# If this is not a tagged version
# replace docker tag with 'latest'
ifeq ('${GIT_TAG}','')
IMAGE_NAME = ${DOCKER_REPO}:latest
else
IMAGE_NAME = ${DOCKER_REPO}:version-${GIT_TAG}
endif


# If this git repo has no remote
# url, set it to <unknown>
ifeq ('${GIT_URL}','')
GIT_URL = <unknown>
endif

all: build

.PHONY: build run run-interactive test login login-user-pass push clean

build:
	@echo "Building ${IMAGE_NAME} ..."
	@docker build \
		--build-arg MAGICS_BUNDLE_VERSION=${MAGICS_BUNDLE_VERSION} \
		--build-arg ECBUILD_VERSION=${ECBUILD_VERSION} \
        --build-arg ECCODES_VERSION=${ECCODES_VERSION} \
		--build-arg BUILD_DATE=${DATE} \
		--build-arg VCS_URL=${GIT_URL} \
		--build-arg VCS_REF=${GIT_HASH} \
		--build-arg VERSION=${GIT_TAG} \
		--build-arg http_proxy=${http_proxy} \
		--build-arg https_proxy=${https_proxy} \
		--build-arg ftp_proxy=${ftp_proxy} \
		--build-arg no_proxy="${no_proxy}" \
		--file Dockerfile \
		--tag ${IMAGE_NAME} \
		.
	@docker tag ${IMAGE_NAME} ${LATEST}

run:
	@docker run --rm ${IMAGE_NAME}

run-interactive:
	@docker run --rm -i -t ${IMAGE_NAME} sh

test:
	@docker run --rm ${IMAGE_NAME} ${TEST_CMD}

login:
	@docker login

login-user-pass:
	@docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}

push: login
	@docker push ${DOCKER_REPO}

clean:
	@docker rmi ${DOCKER_REPO}