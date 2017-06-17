oe-scap
===========

Security validation for OpenEmbedded (work in progress).

Security Content Automation Protocol (SCAP) is a set of standards for automated security auditing of computer systems. While SCAP tests exist for other platforms such as Red Hat Enterprise Linux, no comprehensive set of tests exists for OpenEmbedded. This project is an attempt to create a SCAP profile for OpenEmbedded.

This project contains:

* `openembedded-xccdf.xml`: An OpenEmbedded profile listing tests to run, in [XCCDF 1.2](http://scap.nist.gov/specifications/xccdf/xccdf_element_dictionary.html) format. This is the main file.
* `ssg-rhel6-oval.xml`: Test definitions from the [scap-security-guide](https://fedorahosted.org/scap-security-guide/) project for testing Red Hat Enterprise Linux 6, as of 2014-06-06, some of which also apply to OpenEmbedded.
* `run_tests.sh`: An example for calling [OpenSCAP](http://open-scap.org/page/Main_Page) to run the tests.
* `openembedded-cpe.xml` and `openembedded-cpe-oval.xml` which define "OpenEmbedded" for the purposes of the test profiles.
* `remediation.sh`: A shell script to perform basic tasks to make some tests pass. (Run as root. Be careful.)

Installing
----------

To install oe-scap on a  Linux machine:

	git clone https://github.com/akuster/oe-scap.git
	cd oe-scap

Running Tests
-------------

To run these tests on a machine:

	# Start in oe-scap directory
	cd /path/to/oe-scap
	./run_tests.sh

Reading Results
---------------

Results are generated in XML and optionally HTML reports.

Install the lynx browser to read HTML reports from the command line:

	sudo apt-get install lynx
	# read report
	lynx results.html

Project Development
-------------------

The `openembedded-xccdf.xml` file is compiled from other input files:

* `ssg-rhel6-xccdf-1.2.xml` from the [scap-security-guide](https://fedorahosted.org/scap-security-guide/) is placed iside the group named `xccdf_ubuntu_group_redhat`.
* that's all so far

To "compile" `openembedded-xccdf.xml`:

	# apt-get install some prerequisites needed by the scap-security-guide
	make prereqs

	# download the scap-security guide, compile its ssg-rhel6-xccdf-1.2.xml file, and copy its ssg-rhel6-oval.xml here
	make ssg

	# update openembedded-xccdf.xml with content from the scap-security-guide
	python import-ssg.py

TODO
----

* Vet the RHEL6 rules to see what we need and don't need.
* Update RHEL6 rules that could apply to Ubuntu but need tweeks.
* Compare to the United States Government Configuration Baseline (USGCB)

Acknowledgements
----------------

Thanks to Ubuntu
