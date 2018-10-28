WORKDIR		= 	$(realpath .)
APP_NAME 	?=	$(shell basename $(WORKDIR))
MIX_ENV		?= 	dev

ELIXIR_DOCKER_IMAGE ?= elixir:1.6.6-otp-21
DOCKER_IMAGE_TAG 	?= $(APP_NAME)

.PHONY: start stop build release

build:: clean
@echo "Installing local hex and rebar for $(APP_NAME)..."
	@mix local.hex --force
	@mix local.rebar --force
	@echo "Building release..."
	@mix deps.get
	MIX_ENV=$(MIX_ENV) mix release

release:: clean
	@echo "Installing to /opt/$(APP_NAME)..."
	docker build -t $(APP_NAME):latest .

clean::
	@echo "Cleaning $(APP_NAME)..."
	@mix clean
