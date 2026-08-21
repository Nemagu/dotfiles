.PHONY: all config languages

all: config languages

config:
	@for f in ./config/*.toml; do \
		printf '# --- %s ---\n\n' "$$(basename "$$f")"; \
		cat "$$f"; \
		printf '\n'; \
	done > ./config.toml

languages:
	@for f in ./languages/*.toml; do \
		printf '# --- %s ---\n\n' "$$(basename "$$f")"; \
		cat "$$f"; \
		printf '\n'; \
	done > ./languages.toml
