TASKS += install
USAGE += .install-usage

install:
	ansible-playbook install.yml --ask-become-pass --ask-vault-pass

install-verbose:
	ansible-playbook install.yml --ask-become-pass --ask-vault-pass -vvv

.install-usage:
	$(call describe,"install","install everything")
