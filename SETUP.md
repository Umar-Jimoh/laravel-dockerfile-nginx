# Docker Laravel App Setup Using Dockerfile

📁 Directory Structure

```sh
laravel-dockerfile-nginx/
├── docker/  
│   ├── nginx/
│   │   └── default.conf        # NGINX config
│   └── script/
│   │   └── startup.sh          # Custom startup script
│   └── supervisor/
│       └── supervisord.conf    # Supervisor config  
├── laravel/                    
│       └── ...                 # Laravel application code
├── Dockerfile                  # Instructions to build the Docker image
├── setup.md                    # Setup instructions for the project
```

⚙️ Steps to Run

1.  Create a Laravel application inside the `laravel/` directory:

    -   Either create a new Laravel app:
        `laravel new laravel --force`

    -   Or clone an existing Laravel app:
        `git clone https://github.com/laravel/laravel.git laravel`

2.  Update DB config in `laravel/ .env`:

    -   Use your external DB credentials for deployment.

    -   For local testing, set the host like this:
        `DB_HOST=host.docker.internal`

3.  (Optional) If you're building a web app with frontend assets (Vue/React/etc), make sure to **uncomment** the `npm_build` line in
    `setup_environment` inside `docker/script/startup.sh`

4.  To test locally:

    -   Build the Docker image. 
        `docker build -t laravel-dockerfile-nginx:latest .`

    -   Run the image on port 8080
        `docker run -d -p 8080:10000 laravel-dockerfile-nginx`

    -   Access the app at: http://localhost:8080

5. Deploy to any hosting provider that supports Dockerfile (e.g render)
