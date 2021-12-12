FROM node:12-stretch AS deps
WORKDIR /app
COPY yarn.lock package.json ./
RUN yarn install

FROM node:12-stretch AS builder
WORKDIR /app
COPY --from=deps /app .
COPY . .
RUN yarn run build

FROM node:12-alpine AS runner
WORKDIR /app
COPY --from=builder /app .

CMD ["./dist/src/main.js"]
