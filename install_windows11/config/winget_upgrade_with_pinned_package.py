# winget enhance to pin certain packages

import os
import sys
import json
import subprocess


# Get the list of packages to upgrade
def get_upgrade_packages():
    packages = []
    try:
        cmd = "winget upgrade"
        output = subprocess.check_output(cmd, shell=True)
        packages = output.decode("utf-8").splitlines()
        packages = packages[4:-1]  # remove the first 4 lines 表头 and last line  xx升级可用
        packages = [pkg.split()[-4] for pkg in packages]  # get the package id

    except Exception as e:
        print(e)
    return packages


# Get the list of packages to pin
# Customize your list of packages to pin here
# TODO: pin certain version
# TODO: get the list of pinned packages from file
def get_pin_packages():
    return [
        "appmakes.Typora",
        "Adobe.Acrobat.Reader.64-bit",
    ]


# upgrade package
def install_package(package):
    try:
        print("Upgrading package: {}".format(package))
        cmd = "winget install -e --accept-package-agreements --id " + package
        print(cmd)
        output = subprocess.check_output(cmd, shell=True)
        output = output.decode("utf-8")
        print(output)
    except Exception as e:
        print(e)


# upgrade packages
def upgrade_packages(packages, pin_packages):
    pkgs = list(set(packages) - set(pin_packages))
    print("Packages to upgrade: \n{}".format("\n".join(pkgs)))
    print("--------------------------------------------------")
    for pkg in pkgs:
        install_package(pkg)


if __name__ == "__main__":
    packages = get_upgrade_packages()
    pin_packages = get_pin_packages()
    upgrade_packages(packages, pin_packages)
    print("xwinget upgrade done")
