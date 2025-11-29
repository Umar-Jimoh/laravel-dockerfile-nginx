# Docker Laravel App Setup Using Dockerfile

## 📁 Directory Structure

```sh
laravel/                        # Laravel application
├── docker/                     # Docker folder
│   ├── nginx/
│   │   └── default.conf        # NGINX configuration
│   ├── php/
│   │   └── php.ini             # PHP configuration
│   └── script/
│   │   └── startup.sh          # Startup script
│   └── supervisor/
│   │    └── supervisord.conf    # Supervisor configuration  
│   ├── SETUP.md                # SETUP
├── build_docker.sh             # Build Docker image
├── deploy_docker.sh            # Run Docker container
├── Dockerfile                  # Instructions to build Docker image
├── install_laravel.sh          # Install Laravel in repo root
├── TEMPLATE_README.md          # Template README
├── ...                         # Remaining Laravel application code
```

## ⚙️ Steps to Run

1.  Install Laravel in the template repo
```bash
./install_laravel.sh
```  
- Creates a new Laravel project and moves it to the root
- Preserves the template `README.md` as `TEMPLATE_README.md`

2. Update `.env`
    - Use your external database credentials (SQLite by default)
    - In Dockerfile, uncomment the DB support you need (MySQL/PostgreSQL) and comment out SQLite if not used

3. Optional: Frontend assets
    - If your app has frontend assets (Vue, React, etc.), uncomment the npm_build line in docker/script/startup.sh

4. Build Docker image
```bash
./build_docker.sh
```
- Optionally, you can provide a custom image name:
```bash
./build_docker.sh [image_name]
```

5. Deploy locally
```bash
./deploy_docker.sh
```
- Optionally, you can provide a custom image name and port:
```bash
./deploy_docker.sh [image_name] [port]
```
- Runs container on port 8080 by default (change in script if needed)
- Access app at: http://localhost:8080

6. Deploy to hosting provider
    - Any host that supports Dockerfile (e.g., Render)
    - Update DB credentials and ports according to host setup