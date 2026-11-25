# Bee the Executer — Android PWA prototype

This is the first installable Android-friendly prototype for the Bee the Executer project.

## Important limitations
- This build is a **simulator only**. It uses generated sample prices and illustrative signals.
- It does not connect to XM, MetaTrader 5, a live market-data provider, or a VPS.
- It does not place, manage, or close real or demo broker orders.
- The displayed SL/TP values are examples, not trade recommendations.
- Never put broker passwords, investor passwords, API keys, or account numbers in this repository.

## Files
- `index.html` — app interface and simulator
- `manifest.webmanifest` — installable web-app metadata
- `sw.js` — offline cache
- `icon.svg` — app icon

## Publish free with GitHub Pages
1. Open the `Bee-the-executer` repository on GitHub.
2. Choose **Add file → Upload files**.
3. Upload the four files above (not this ZIP file).
4. Commit the upload to the `main` branch.
5. In the repository, open **Settings → Pages**.
6. Under Build and deployment, choose **Deploy from a branch**.
7. Select branch `main` and folder `/(root)`, then Save.
8. Wait for GitHub Pages to publish the site. The URL will be shown on the Pages screen.

## Install on Android
1. Open the published GitHub Pages URL in Chrome.
2. Open Chrome's three-dot menu.
3. Tap **Install app** or **Add to Home screen**.
4. Confirm. The app icon will appear on the phone.

## Future MT5 demo integration
True automated execution needs a separate, securely hosted bridge/MT5 Expert Advisor running in an environment where MetaTrader 5 desktop can operate. An Android PWA alone cannot run an MT5 Expert Advisor or securely execute broker orders. Build and test that connection separately on an XM demo account before considering any live use.
