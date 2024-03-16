FROM nginx:latest
COPY ./build /usr/share/nginx/html
EXPOSE 80 8081
CMD ["nginx", "-g", "daemon off;"]

