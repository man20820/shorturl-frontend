# Short URL Frontend

This is a simple shortlink / shorturl project. This can shorten your long url to be very short.

This project written in javascript, built using vuejs framework, tailwind css, and some library.

Backend: https://github.com/man20820/shorturl-backend 

## Usage

rename .env.example to .env

set VUE_APP_BASE_UR in env or Dockerfile file

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

## Docker

### build with dockerfile

clone this repository

```bash
git clone https://github.com/man20820/shorturl-frontend.git
```

build docker image and run the container

```bash
docker build . -t ghcr.io/man20820/shorturl-frontend
```
run container

```bash
docker run -p 0.0.0.0:80:80/tcp ghcr.io/man20820/shorturl-frontend
```