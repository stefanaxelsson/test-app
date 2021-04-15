const assetPrefix =
  process.env.ASSET_PREFIX === "true" ? "https://www.example.com" : "";

const buildId =
  process.env.ASSET_PREFIX === "true"
    ? {
        generateBuildId: async () => {
          return "BUILD_ID";
        },
      }
    : {};

const nextConfig = {
  assetPrefix,
  ...buildId,
};

module.exports = nextConfig;
