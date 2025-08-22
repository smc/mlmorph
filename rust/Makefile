init:
	@mkdir -p data
	cp ../malayalam.a data/malayalam.a
	@echo "Syncing version from ../VERSION..."
	@VERSION=$$(cat ../VERSION); \
	sed -i "s/^version = .*/version = \"$$VERSION\"/" Cargo.toml; \
	echo "Updated Cargo.toml version to $$VERSION"

test: init version-check
	cargo test

clean:
	@rm -f data/*.a

publish: test
	# --allow-dirty is required because we are not publishing that to git
	cargo publish --allow-dirty

# Add a version-check target to verify sync
version-check:
	@CARGO_VERSION=$$(grep "^version" Cargo.toml | cut -d'"' -f2); \
		FILE_VERSION=$$(cat ../VERSION); \
		if [ "$$CARGO_VERSION" = "$$FILE_VERSION" ]; then \
		echo "✓ Versions are in sync: $$CARGO_VERSION"; \
		else \
		echo "✗ Version mismatch: Cargo.toml=$$CARGO_VERSION, VERSION=$$FILE_VERSION"; \
		exit 1; \
		fi
