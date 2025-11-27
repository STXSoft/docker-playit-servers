Gaming Servers (Dockerized)
===========================
This project manages a collection of game servers using Docker and Docker Compose.
It is designed for easy deployment of both vanilla and modded servers, with persistent data,
modular configuration, and public access using Playit.gg tunneling. This ensures your actual server IP will not be exposed.

Requirements
------------
- [Docker Compose](https://docs.docker.com/get-started/get-docker)
- [Playit.gg](https://playit.gg) account for tunneling (Optional but recommended)

Installation
------------
1. Install [Docker Compose](https://docs.docker.com/get-started/get-docker)
2. Download the latest Release and unpack it.
3. Create a copy of the `.env.example` file and rename it to `.env`
4. (Optionally) Create a [Playit.gg](https://playit.gg) account.  
4.1. On their website create a new `Docker based Agent` and copy the `Secret Key`  
4.2. Open the `.env` file with a text editor and paste you `Secret Key` to the  `AGENT_SECRET` variable. It should look like this:
    ```
    AGENT_SECRET="YOURSUPERDUPERUNGUESSABLEANDVERYSECRETKEY"
    ```
5. Open the [docker-compose.yml](./docker-compose.yml) with the editor of your choice and change values as deemed necessary.
6. Build and start the docker-services:  
6.1. Build with: `sudo docker compose build`  
6.2. Run with: `sudo docker compose up -d`  
6.3. Verify the containers are running with: `sudo docker ps`. It should list the services as running.
7. If you're using the `Playit.gg` Agent, go back to their website. The Agent should have connected successfully.
8. Go the the `Tunnels` Section and add a new tunnel.  
8.1 Select `Tunnel Type TCP` with `port count 1` and `Local Port 25565`
8.2 Once created, update the `Loacl Address` field with the value of the `ipv4` field of your minecraft server, as configured in the `docker-compose.yml`file.

You should now be able to connect to your minecraft server by using the public address of your Playit.gg tunnel.

Public Access with Playit.gg
----------------------------
This project uses the official Playit.gg agent container to expose the Minecraft server
to the public internet without needing to configure port forwarding or firewalls.

- Requires a Playit.gg account
- Set the `SECRET_KEY` environment variable in `.env` file

Config Notes
------------
- Custom `server.properties` can be placed in `config/` and will be copied at startup.
- Volumes ensure persistent world data and configuration.
- All game servers are connected to a dedicated Docker bridge network (`mc-network`).

Project Structure
-----------------
```
gaming-servers/
├── assets/               # Extra resources (e.g. icons, maps, ...)
├── config/               # Custom config files (e.g. server.properties)
├── docker/               # Contains the files needed for building the images.
├── servers/              # Individual server folders (vanilla, modded, etc.)
│   └── vanilla/          # Vanilla Minecraft server files
├── docker-compose.yml    # Main compose file to launch everything
```

Roadmap
-------
- Server creation with initial white- and blacklist files (same as configs are copied right now)
- Add other games
- Possibly split `docker-compose.yml` into multiple files and
use compose to merge them. This should reduce clutter and allow for more organized compose files.
