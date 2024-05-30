.PHONY: gen

run-dev-test:
	flutter run --flavor development --target lib/main_development.dart --dart-define=IS_TESTFLIGHT=true -v

run-internal-test:
	flutter run --flavor internal --target lib/main_production.dart --dart-define=IS_TESTFLIGHT=true -v

run-dev:
	flutter run --flavor development --target lib/main_development.dart --dart-define=SHOW_TEST_ACCOUNTS=true -v

fix-ios:
	cd ios && rm -f Podfile.lock && pod install --verbose

fix-code:
	dart fix --apply

run-fix-dev:
	$(MAKE) fix-ios
	flutter run --flavor development --target lib/main_development.dart --dart-define=SHOW_TEST_ACCOUNTS=true -v

run-stg:
	flutter run --flavor staging --target lib/main_staging.dart --dart-define=SHOW_TEST_ACCOUNTS=true


run-internal:
	flutter run --flavor internal --target lib/main_production.dart --dart-define=IS_PRODUCTION=true -v 

run-prod:
	flutter run --flavor production --target lib/main_production.dart --dart-define=IS_PRODUCTION=true

run-build-runner:
	flutter pub run build_runner build --delete-conflicting-outputs -v
# Other commands
view-coverage:
	open coverage/index.html

setup-coverage:
	brew install lcov

lint:
	dart analyze

pods:
	cd ./ios && pod install

# Clean everything possible for an IOS build when things are being really frustrating with cached build files
deep-clean-ios:
	rm -rf ios/Pods/*
	rm -f ios/Podfile.lock
	rm -rf ~/Library/Caches/CocoaPods/*
	rm -rf ~/Library/Developer/Xcode/DerivedData/*
	 flutter clean

# Ensures proper flutter channel is in use, runs pub get, and code generators.
# If on dev, checking for dev = 0, failed = 1
install:
	$(info Running flutter pub get and code generators)
	 install
	 flutter pub get
	$(MAKE) gen

# Generate dartdoc
doc:
	 flutter pub run dartdoc

# Run all code generators
gen:
	 flutter pub run build_runner build --delete-conflicting-outputs
	$(MAKE) langs

langs-extract-arb:
	@ flutter pub pub run intl_generator:extract_to_arb --output-dir=lib/l10n/arb/ --output-file=en_GB.arb --locale=en_GB $(shell find ./lib -name "*.dart" -type f ! -path "./lib/l10n/gen/*")

langs-gen-dart:
	@ flutter pub pub run intl_generator:generate_from_arb --output-dir=lib/l10n/gen/ --no-use-deferred-loading $(shell find ./lib -name "*.dart" -type f ! -path "./lib/l10n/gen/*") lib/l10n/arb/*.arb

langs:
	@$(MAKE) langs-extract-arb
	@$(MAKE) langs-gen-dart

test:
	 flutter test -j 10 lib/

test-update:
	 flutter test -j 10 --update-goldens lib/

# Clean the project out and remove all generated files
clean:
	$(info Cleaning project..)
	@find . -name "*.g.dart" -type f -delete
	@flutter clean
	$(info Done)

# Generate the coverage report from lcov.info file.
generate-coverage:
	lcov --remove coverage/lcov.info "*.g.dart" -o coverage/lcov.info
	@$(MAKE) cleanup-coverage
	genhtml -o coverage coverage/lcov.info

############################################################################
# Driver tests and SkSL caching
############################################################################
FLUTTER_VERSION=$(shell ./ci_scripts/get_flutter_version.sh)
