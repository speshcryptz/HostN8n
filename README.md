# n8n on Railway

This repository contains the configuration needed to deploy a production-ready [n8n](https://n8n.io/) instance on [Railway](https://railway.app/).

## Deployment Instructions

### 1. Push to GitHub
1. Create a new repository on your GitHub account.
2. Push this code to the repository:
   ```bash
   git init
   git add .
   git commit -m "Initial commit: n8n Railway config"
   git branch -M main
   git remote add origin https://github.com/yourusername/your-repo-name.git
   git push -u origin main
   ```

### 2. Deploy on Railway
1. Log into your [Railway Dashboard](https://railway.app/dashboard).
2. Click **New Project** -> **Deploy from GitHub repo**.
3. Select the repository you just pushed.
4. **Don't deploy yet** if prompted, we need to add a database and variables.

### 3. Add PostgreSQL Database
1. In your Railway project, click **New** -> **Database** -> **Add PostgreSQL**.
2. Wait for it to deploy.

### 4. Configure Environment Variables
1. Click on your `n8n` service block in the Railway canvas.
2. Go to the **Variables** tab.
3. Add the following variables:
   - `N8N_HOST`: (Wait until step 5 to get your public domain, then fill this in without `https://`)
   - `WEBHOOK_URL`: (Wait until step 5 to get your public domain, then fill this in with `https://`)
   - `N8N_PROTOCOL`: `https`
   - `N8N_ENCRYPTION_KEY`: A long, random string (e.g. `your-super-secret-key-12345`). **Keep this safe!**
   - `DB_TYPE`: `postgresdb`
   - `DB_POSTGRESDB_DATABASE`: `${PGDATABASE}`
   - `DB_POSTGRESDB_HOST`: `${PGHOST}`
   - `DB_POSTGRESDB_PORT`: `${PGPORT}`
   - `DB_POSTGRESDB_USER`: `${PGUSER}`
   - `DB_POSTGRESDB_PASSWORD`: `${PGPASSWORD}`

### 5. Add a Custom Domain & Persistent Volume
1. Still in the n8n service settings, go to the **Settings** tab.
2. Scroll down to **Volumes**. Click **New Volume** and mount it to `/home/node/.n8n`.
   *(This ensures that if your instance restarts, your active workflows and files aren't wiped).*
3. Scroll down to **Networking** and click **Generate Domain**.
4. Now, go back to the **Variables** tab and update `N8N_HOST` (e.g., `n8n-production.up.railway.app`) and `WEBHOOK_URL` (e.g., `https://n8n-production.up.railway.app/`) with the newly generated domain.

### 6. Start Using n8n
Wait for the deployment to finish, click your public URL, and set up your owner account!
