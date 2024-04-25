// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

// Generated by Finicky Kickstart
// Save as ~/.finicky.js

module.exports = {
  defaultBrowser: () =>
    finicky.getBattery().chargePercentage < 30 ? "Safari" : "Google Chrome",
  rewrite: [
    {
      match: "https://meet.google.com/*",
      url: ({ url }) => `${url}?authuser=1`,
    },
  ],
  handlers: [
    {
      match: [
        "*127.0.0.1*",
        "*localhost*",
        "*.atlassian.net/*",
        "*postman*",
        "*linkedin.com*",
        "*taxdome.win*",
        "*taxdome.com*",
        "*appsignal.com*",
        "*aws.amazon.com*",
        "*meet.google.com*",
      ],
      browser: "Google Chrome",
    },
    {
      match: ["*.figma.com/file/*"],
      browser: "/Applications/Figma.app",
    },
  ],
  options: {
    // Hide the finicky icon from the top bar. Default: false
    hideIcon: true,
    // Check for update on startup. Default: true
    checkForUpdate: false,
    // Log every request with basic information to console. Default: false
    logRequests: false,
  },
};
