NAME = sourceryinstitute/mpich-docker-image
WORKDIR = ${HOME}/Sandbox

default: build

build:
	@hooks/build 2>&1 | tee $(subst /,_,$(NAME))-build.log

push:
	docker push $(NAME)
	[[ -n "${SI_mpich_UBADGER_ENDPOINT}" ]] && curl -X POST ${SI_mpich_UBADGER_ENDPOINT}

run:
	docker run -v $(WORKDIR):/workdir -i -t $(NAME)
runclean:
	docker run --rm -v $(WORKDIR):/workdir -i -t $(NAME)
runroot:
	docker run --user root -v $(WORKDIR):/workdir -i -t $(NAME)

release: build push
