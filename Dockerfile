FROM node:22-alpine

# Install mcp-proxy globally
RUN npm install -g mcp-proxy

WORKDIR /app

# Copy only package.json to read package name
COPY package.json ./

# Extract package name and install it globally
RUN npm install -g web3-research-mcp@latest

# Clean up
RUN rm -rf /app/* /tmp/* ~/.npm

# Create non-root user
RUN addgroup -g 1001 -S appuser && adduser -S appuser -G appuser
USER appuser

ENV NODE_ENV=production
EXPOSE 8080
ENTRYPOINT ["mcp-proxy"]
