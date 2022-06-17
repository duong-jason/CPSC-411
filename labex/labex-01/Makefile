MIN_INSERTIONS		:= 10
COMMITS			:= $(shell git rev-list --count HEAD)
FIRST_COMMIT_REV	:= $(shell git rev-list --max-parents=0 HEAD)
LAST_COMMIT_REV		:= $(shell git rev-list HEAD | head -n1)
INSERTIONS		:= $(shell git diff $(FIRST_COMMIT_REV) $(LAST_COMMIT_REV) --shortstat | sed -E 's/.* ([0-9]+) insertion.*/\1/')


.PHONY: verify_implementation test stylecheck

verify_implementation:
	@ if [ $(COMMITS) -lt 1 ] ; then \
		echo "No changes commited."; \
		exit 1; \
	fi
	@ if [ $(INSERTIONS) -lt $(MIN_INSERTIONS) ] ; then \
		echo "Implementation does not seem to solve the problem."; \
		exit 1; \
	fi
		@echo "Implemented a solution to the problem"

stylecheck:
	@swiftformat --lint --swiftversion 5.6 .	

test:
	@xcodebuild test -project SafeWalkVolunteer.xcodeproj -scheme SafeWalkVolunteer -sdk iphonesimulator -destination 'name=iPhone 12,OS=15.5'
