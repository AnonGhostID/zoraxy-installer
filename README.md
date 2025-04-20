# Zoraxy Setup

This repository provides scripts and configuration for setting up the [Zoraxy](https://github.com/tobychui/zoraxy) reverse proxy and static web server.

## Structure

- `setupzoraxy.sh`: Bash script to download, install, and configure Zoraxy as a systemd service.
- `startproxy.sh`: Script to start Zoraxy on port 8000.
- `conf/`: Configuration files for Zoraxy.
- `log/`: Log files.
- `plugins/`: Plugins directory.
- `tmp/`: Temporary files (e.g., SSL keys).
- `www/html/`: Static web content (default index page at `www/html/index.html`).

## Usage

1. Run the setup script as root:
    ```sh
    sudo bash setupzoraxy.sh
    ```
2. Zoraxy will be installed to `/root/zoraxy` and started as a service on port 8000.
3. Access the web interface at [http://localhost:8000](http://localhost:8000).

## Customization

- Place your static HTML files in the `www/html/` directory.
- Edit configuration files in the `conf/` directory as needed.

## Documentation

- [Official Zoraxy Documentation](https://zoraxy.aroz.org)
- [Project Wiki](https://github.com/tobychui/zoraxy/wiki)