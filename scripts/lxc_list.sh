#!/bin/bash

# Run the "pct list" command and filter for running containers
running_containers=$(pct list | grep -E '^[0-9]+.*running' | awk '{print $1, $3}')

# Display the list of running LXC containers with IDs and Names
echo "List of running LXC containers:"
echo "$running_containers"

# Iterate over each running container and get its IP address
for container_id in $running_containers; do
    echo "Container ID: $container_id"
    
    # Run the "lxc-info" command to get the IP address
    container_ip=$(lxc-info -n "$container_id" | grep "IP:" | awk '{print $2}')
    
    # Check if the IP address starts with "fd82:" before displaying it
    if [[ $container_ip != "fd82:"* ]]; then
        echo "IP Address: $container_ip"
    else
        echo "IP Address starts with 'fd82:', not displaying."
    fi    

    echo "-----------------------------"
done

