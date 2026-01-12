#
# Started on 1/11/25
# Created by OxidizedToast
# Last Modified 1/11/25
# Description: WireGuard management script/tool
#

import os
import sys
import subprocess
import argparse


# Requires user to be root
def is_root():
    subprocess.run(["clear"])
    if os.getuid() != 0:
        print("Must run as sudo")
        sys.exit(1)


# If linux isn't running the script won't run; since other file paths haven't been added
def is_operating_system_supported():
    current_platform = sys.platform
    if current_platform != "linux":
        print(f"vpnc does not support {current_platform}")
        sys.exit(1)


# Lists which servers are downloaded
def list_servers():
    wireguard_files = os.listdir("/etc/wireguard")
    print("[==================]")
    print(" Servers avaliable: ")
    print("[==================]")
    print(wireguard_files)


# Gets status if connected to a server
def get_status() -> bool:
    result = subprocess.run(["wg", "show"], capture_output=True, text=True)
    return bool(result.stdout.strip())


# Quick status for user
def status():
    running = get_status()
    print("[=======]")
    print(" Status: ")
    print("[=======]")
    if running:
        # uses result from get_status() as connection variable
        connection = subprocess.run(["wg", "show"], capture_output=True, text=True)
        print(f"Connected to: {connection}")
    else:
        print("wireguard isn't running")


# Asks to toggle client status
def client_toggle() -> bool:
    wants_to_toggle = input("Do you want to toggle the status[Y/n] ")
    if wants_to_toggle == "N" or wants_to_toggle == "n":
        print("Exiting...")
        sys.exit(0)
    elif (
        wants_to_toggle != "Y"
        and wants_to_toggle != "y"
        and wants_to_toggle != "N"
        and wants_to_toggle != "n"
    ):
        print("Option not found")
        print("Exiting...")
        sys.exit(1)
    return True


def main():
    parser = argparse.ArgumentParser(description="WireGuard management script")
    parser.add_argument(
        "action",
        choices=["list", "status", "toggle"],
        help="Actions to perform: List servers, show status, toggle client",
    )

    args = parser.parse_args()
    is_root()
    is_operating_system_supported()
    if args.action == "list":
        list_servers()
    elif args.action == "status":
        status()
    elif args.action == "toggle":
        if client_toggle():
            if get_status():
                find_connected_server = subprocess.run(
                    ["wg", "show", "interfaces"], capture_output=True
                )
                current_server = find_connected_server.stdout.strip().split()
                subprocess.run(["wg-quick", "down", current_server[0]])
            else:
                list_servers()
                print("(Do not include .conf in your response)")
                server_to_join = input("Which server do you want to connect to? ")
                subprocess.run(["wg-quick", "up", server_to_join])


if __name__ == "__main__":
    main()
