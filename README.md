VecNet Digital Library Deploy
=============================

This repository contains the ansible scripts used to deploy
the VecNet digital library system.

## Testing

If you have vagrant installed, you can create VMs using it and run ansible with the local environment for testing.
For example

    $ vagrant up
    $ ansible-playbook playbook.yml -i env/local/inventory --ask-vault-pass

This can get tedious, so there is also a makefile to do this

    $ make local deploy

or

    $ make standalone deploy

## Deployment

To deploy to an environment you need to have your public ssh key installed on the appropriate hosts.

Then to provision the QA environment run the following

    $ make qa deploy

To deploy to production

    $ make production deploy

## Distinction between Provisioning and Deploying

By _provisioning_ we mean installing the necessary software and services needed to do a deploy.
This is only intended to be performed once, when setting up a VM.
Typical provisioning roles are to install RPMs, create users, and configure services.

Related to provisioning is _updating_, which runs an update process on items which are provisioned.

In contrast, _deploying_ means pulling new code from our local repositories, and updating our software. So deploying is for stuff we write, provisioning is for things we get from elsewhere.

At least, this is the idea. We'll see how it works out.

