#!/bin/bash
set -eux
downLoad() {
    # Extracting URI from URL
    uri='/wps/download/ep/Linux2023/17900/wps-office-12.1.0.17900-1.x86_64.rpm'
    
    # Generating timestamp and MD5 hash
    secrityKey="7f8faaaa468174dc1c9cd62e5f218a5b"
    timestamp10=$(date +%s)
    md5hash=$(echo -n "$secrityKey$uri$timestamp10" | md5sum | awk '{print $1}')
    
    # Appending parameters to the URL
    url="https://wps-linux-personal.wpscdn.cn/wps/download/ep/Linux2023/17900/wps-office-12.1.0.17900-1.x86_64.rpm?t=${timestamp10}&k=${md5hash}"

    # Downloading the file
    wget $url
}

# Example usage:
downLoad

