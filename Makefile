.PHONY: get
get: # get deps
	mix deps.get

.PHONY: release-create
release-create: # create release
	mix release.init

.PHONY: compile
compile: # get deps and compile
	mix do deps.get, deps.compile

.PHONY: build
build:
	cd assets && npm install && \
	./node_modules/brunch/bin/brunch build -p && \
	cd .. && mix phx.digest

.PHONY: release-build
release-build:
	MIX_ENV=prod mix release --env=prod

.PHONY: release-run
release-run:
	PORT=8080 _build/prod/rel/appengine_example/bin/appengine_example foreground

.PHONY: release-deploy
release-deploy:
	gcloud app deploy

.PHONY: release
release:
	$(MAKE) build && $(MAKE) release-build && \
	$(MAKE) release-deploy

.PHONY: release-logs
release-logs:
	gcloud app logs tail -s elixir-example

.PHONY: release-browse
release-browse:
	gcloud app browse -s elixir-example
