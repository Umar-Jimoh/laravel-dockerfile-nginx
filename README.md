<p align="center">
  <img src="https://img.shields.io/badge/Docker-ready-blue" alt="Docker Badge" />
  <img src="https://img.shields.io/badge/Laravel-compatible-red" alt="Laravel Badge" />
  <img src="https://img.shields.io/badge/NGINX-configured-green" alt="NGINX Badge" />
  <img src="https://img.shields.io/badge/Supervisor-enabled-purple" alt="Supervisor Badge" />
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="MIT License Badge" />
</p>

# 🚀 Laravel + Docker + NGINX — Minimal, Production-Ready Template

#### Docker setup for running Laravel with NGINX and Supervisor — works out of the box with minimal to no need for config changes before deployment.
---

## ✨ Features
- ⚡ Simple and minimal Laravel + Docker + NGINX setup
- 🐳 Uses a single `Dockerfile` (no `docker-compose`)
- 🔄 Includes **Queue Workers** and **Scheduled Tasks** via Supervisor
- 🧩 Uses `server_name localhost` and works out of the box
- 🚚 Minimal to no changes before deployment — just build and run!

## 📌 Requirements
- Docker 20+
- Laravel Installer

## 📦 Installation
See [SETUP.md](docker/SETUP.md) for full instructions.

## 📦 Usage
After cloning this template, you can set up a new Laravel project and Docker environment with three scripts:

1. **Install Laravel in the root of your repo**
```bash
./docker/install_laravel.sh
```
- This will:
    - Create a new Laravel project inside a temporary folder
    - Move all files to the root
    - Rename the template README.md to TEMPLATE_README.md to preserve your template information

2. **Build Docker image**
```bash
./docker/build_docker.sh
```

3. **Run Docker container locally**
```bash
./docker/deploy_docker.sh
```
**You can edit the scripts to change image names, ports, or environment variables if needed.**

## 🤝 Contributing
Pull requests and stars are welcome! Feel free to fork and submit ideas or improvements.
