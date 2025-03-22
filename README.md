Gaming Servers (Dockerized)
===========================

This project manages a collection of game servers using Docker and Docker Compose.
It is designed for easy deployment of both vanilla and modded servers, with persistent data,
modular configuration, and public access using Playit.gg tunneling. This ensures your actual server IP will not be exposed.

Project Structure
-----------------

gaming-servers/
├── assets/               # Extra resources (e.g. icons, maps)
├── config/               # Custom config files (e.g. server.properties)
├── docker/               # Shared Docker-related scripts/config
├── servers/              # Individual server folders (vanilla, modded, etc.)
│   └── vanilla/          # Vanilla Minecraft server files
├── docker-compose.yml    # Main compose file to launch everything

Quick Start
-----------

# Build and start the servers
docker-compose up -d

# Stop all servers
docker-compose down

Public Access with Playit.gg
----------------------------

This project uses the official Playit.gg agent container to expose the Minecraft server
to the public internet without needing to configure port forwarding or firewalls.

- Requires a Playit.gg account
- Set the `SECRET_KEY` environment variable in `docker-compose.yml`

Config Notes
------------

- Custom `server.properties` can be placed in `config/` and will be copied at startup.
- Volumes ensure persistent world data and configuration.
- All game servers are connected to a dedicated Docker bridge network (`mc-network`).

Requirements
------------

- Docker
- Docker Compose v2
- At least 4GB RAM per game server recommended
- Playit.gg account for tunneling

Services
--------

- vanilla: Vanilla Minecraft (version configurable via environment). Uses itzg/minecraft-server docker image
- playit: Tunneling agent for public server access (Playit.gg)

