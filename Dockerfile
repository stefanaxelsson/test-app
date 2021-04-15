FROM node:12.21.0 as base
# Set the working directory.
RUN addgroup --gid 1001 app

RUN useradd --home /app --uid 1001 --gid 1001 app

RUN mkdir -p /app

WORKDIR /app

COPY . .

RUN npm ci

ENV ASSET_PREFIX true

RUN npm run build
RUN npm prune --production

RUN ls -R .next/static

ADD . /app

RUN chown -R app /app

USER app

EXPOSE 3000

# Run the specified command within the container.
CMD [ "npm", "run", "start"]

