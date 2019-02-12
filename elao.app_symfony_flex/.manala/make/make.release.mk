########
# Diff #
########

# Build and publish a release for a given environment target.
#
# @param $1 The environment target, eg production, preprod, staging
#
# Examples:
#
# Example #1: make a release for the production environment
#
#   $(call release,production)

define release
        docker run \
        --rm \
        --tty \
        --mount type=bind,source=$(PWD),target=/srv \
        --mount type=bind,source=$(HOME)/.ssh/id_rsa,target=/home/app/.ssh/id_rsa \
        --mount type=bind,source=$(HOME)/.gitconfig,target=/home/app/.gitconfig \
        $(DOCKER_IMAGE) \
        ansible-playbook .manala/ansible/release.yaml --inventory .manala/ansible/release.inventory.yaml --limit $(1)
endef
