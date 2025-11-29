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
│   │   └── startup.sh          # Custom startup script
│   └── supervisor/
│       └── supervisord.conf    # Supervisor configuration  
├── Dockerfile                  # Instructions to build the Docker image
├── ...                         # Remaining Laravel application code
```

## ⚙️ Steps to Run

1.  Copy the `docker` folder and `Dockerfile` into an existing Laravel application:

2.  Update the `.env` file in `laravel/`:

    -   Use your external database credentials for deployment (SQLite by default).

    -   In the `Dockerfile`, **uncomment the DB support** you need (MySQL/PostgreSQL) and **comment out SQLite** if not used.

3.  (Optional) If your app has frontend assets (Vue, React, etc.), make sure to **uncomment the `npm_build` line in `docker/script/startup.sh`**.

4.  Test locally (optional):  
    **Replace 'laravel' with your project name**

    **Build the Docker image.** 
    ```bash
    docker build -t laravel
    ```

    **Run the image on port 8080 (you can change this)**
    ```bash
    docker run -d -p 8080:80 laravel
    ```

    **Access the app at:**   
    http://localhost:8080

5. Deploy to any hosting provider that supports Dockerfile (e.g., Render)
    -   Make sure to update database credentials and ports according to your host setup.
