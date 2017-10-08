TASKS += install
USAGE += .install-usage



install:
	ansible-playbook install.yml --ask-become-pass

.install-usage:
	$(call describe,"install","install configured software for this system")