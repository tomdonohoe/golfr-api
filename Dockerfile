FROM node:12-stretch AS deps
WORKDIR /app
COPY package-lock.json package.json ./
RUN npm ci

FROM node:12-stretch AS builder
WORKDIR /app
COPY --from=deps /app .
COPY . .
RUN npm run build

FROM node:12-alpine AS runner
WORKDIR /app
COPY --from=builder /app .

CMD ["./dist/src/main.js"]