#!/bin/bash
oscap xccdf eval \
	--profile xccdf_openembedded_profile_default \
	--cpe openembedded-cpe.xml \
	--check-engine-results --oval-results --results results.xml \
	--report results.html \
	openembedded-xccdf.xml
