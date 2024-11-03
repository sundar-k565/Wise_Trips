# Use an official Nginx image as the base image
FROM nginx:alpine

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Remove the default Nginx index page
RUN rm -rf ./*

# Copy the current directory contents into the container at /usr/share/nginx/html
COPY . .

# Expose port 80 to make the web page accessible
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
