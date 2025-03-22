# 🗂️ Server Data Directory

This folder contains **persistent data volumes** for all game server containers.

Each **container/server instance** mounts its own dedicated subfolder.  
These are ideally **grouped by game**, making it easy to manage multiple servers of the same type.

Any data in this folder, except this file, will automatically be ignored by git due to the .gitignore file

## 📁 Structure

./<game>/ 
 └── <service-name>/
    ├── world/ 
    ├── server.properties 
    ├── logs/ 
    └── ...

### ✅ Example

./minecraft/mc-vanilla/ 
./minecraft/mc-modpack1/ 
./valheim/valhalla-server/

## 🔒 Notes

- These folders are mounted as **Docker volumes**, so data persists across restarts.
- You can safely back up or sync individual subfolders without affecting others.
