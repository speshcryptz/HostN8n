FROM n8nio/n8n:latest

# Run as root to fix Railway volume permission denied issues
USER root

# The PORT environment variable is automatically provided by Railway
# We just need to make sure n8n knows to use it
ENV N8N_PORT=${PORT:-5678}

# Expose the standard n8n port (Railway will map the dynamic port internally)
EXPOSE 5678

# Ensure that the correct port is used when starting
CMD ["n8n", "start"]
