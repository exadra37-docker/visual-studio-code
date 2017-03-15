#!/bin/bash
# @package exadra37-dockerized/visual-studio-code
# @link    https://gitlab.com/u/exadra37-docker/visual-studio-code
# @since   12 March 2017
# @license GPL-3.0
# @author  Exadra37(Paulo Silva) <exadra37ingmailpointcom>
#
# Social Links:
# @link    Auhthor:  https://exadra37.com
# @link    Gitlab:   https://gitlab.com/Exadra37
# @link    Github:   https://github.com/Exadra37
# @link    Linkedin: https://uk.linkedin.com/in/exadra37
# @link    Twitter:  https://twitter.com/Exadra37


########################################################################################################################
# Parameters
########################################################################################################################

    git_user="${1}"
    git_user_email="${2}"


########################################################################################################################
# Execution
########################################################################################################################

    printf "\nUpdate Installed Extensions From Docker Image...\n"

    # Copy back all extensions installed by Docker build command, as per Dockerfile instructions.
    # We need this trick because when the Container is started we map the Container .vscode dir to a Host one,
    #  so that when the Container is removed, we don't loose any installed extensions during the use of Visual Studio Code.
    cp -uR ~/.container/.vscode ~/

    # Setup Git
    git config --global user.name "${git_user}" && \
    git config --global user.email "${git_user_email}" && \

    printf "\nStarting Visual Studio Code...\n"

    code -w ~/Developer
