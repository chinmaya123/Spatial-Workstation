VisionOS Spatial Trading Workstation 🌐👁️

An institutional-grade spatial computing trading suite built for Apple Vision Pro (visionOS) and web runtimes. This application bridges historical floor-trading mechanics with cutting-edge spatial Level 2/3 analytics, cross-asset macro shockwave simulations, and AI copilot capabilities across floating 3D environment.

🎯 Problem Statement

Traditional financial terminals confine high-dimensional financial data—such as order book depth, cross-asset contagion vectors, and systemic liquidity movements—into dense, flat 2D screens. Traders suffer from:

Screen Real Estate Congestion: Constant tab switching between candlestick charts, Depth of Market (DOM) ladders, risk desks, and macro feeds.

Abstract Depth Perception: Flat 2D order book ladders make it difficult to quickly gauge resting liquidity walls and hidden buy/sell pressure.

Loss of Floor Dynamics: Electronic trading isolated market participants, losing the intuitive spatial and auditory cues once present on open outcry exchange floors.

Complex Macro Contagion Assessment: Calculating systemic margin headroom and cross-asset contagion (e.g., how a 50bp Fed rate hike or Crude Oil spike cascades into equity and crypto collateral) is typically slow and difficult to model interactively.

🚀 Solution & Core Features

The Spatial Workstation leverages spatial computing in visionOS to solve these problems by projecting modular, interactive 3D trading workspaces into the user's physical environment:

1. Spatial Launchpad Hub

Central launch console designed with visionOS glassmorphism.

Spawns modular sub-workspaces as independent, floating 3D windows that can be positioned side-by-side in panoramic multi-window trading desks.

2. Spatial Workstation Desk (Window #1)

Live Candlestick Charting: Multi-timeframe candlestick feeds (1m, 5m, 15m, 1h) with real-time VWAP and SMA 20 overlays.

Level 2 Depth of Market (DOM): Interactive bid/ask order ladder with dynamic spread monitoring and real-time order imbalance meters.

3D Order Depth Landscape (Three.js): 3D bar chart visualizing resting buy pressure walls (Emerald) vs. sell ask walls (Rose) in orbital 3D space.

Aggressive Time & Sales Tape: Live transaction tape identifying aggressive market orders and liquidity sweeps.

Execution & Portfolio Desk: Direct order submission (Limit, Market, Stop) with real-time initial margin calculations and unrealized PnL tracking.

3. 3D Open Outcry Trading Pit (Window #2)

Virtual Octagonal Pit Arena: Modeled after the iconic S&P 500 trading floor.

Animated 3D Trader Avatars: 14 multi-part humanoid trader figures pacing along tiered step rings wearing authentic color-coded floor jackets.

Authentic Hand Signals: Avatars exhibit physical hand gestures for BUY / BID (palm facing face) and SELL / OFFER (palm facing pit).

Click-to-Inspect Raycasting: Click any 3D floor trader to inspect their badge ID, desk affiliation (e.g., Goldman Liquidity Desk, Treasury Arb), active shout quotes, and instantly match their orders.

Spatial Audio Engine: Web Audio synthesis featuring shout order sound effects, gavel strikes, and an optional ambient pit crowd murmur toggle.

4. Cross-Asset Macro Shockwave Matrix (Window #3)

Vector Contagion Canvas: Real-time vector node graph representing correlated asset classes (/ES, /NQ, /BTC, /CL, /GC, /ZN).

Interactive Shock Detonation: Trigger systemic shocks or quick presets (Fed Rate Spike, Geopolitical Oil Shock, Tech Selloff) to watch animated energy shockwaves and directional particle flows propagate across assets.

Cross-Asset Elasticity Matrix: Computes empirical beta ($\beta$) transfers and projected price variations.

Systemic Margin Call & Collateral Stress Tester: Calculates stressed margin requirements and dynamic Free Collateral Headroom gauges.

5. Gemini Market Copilot

Built-in AI market assistant capable of analyzing order book imbalances, explaining systemic shock propagation, and advising on collateral haircut mitigation.

🏗️ Technical Architecture

Native VisionOS Shell (Swift / SwiftUI):

Manages multi-window lifecycles using WindowGroup(id:) for "hub", "workstation", "pit", and "shockwave".

Renders native visionOS top control ornaments (.ornament) with  branding, return-to-hub triggers, maximize toggles, and window dismissal buttons.

Native .glassBackgroundEffect() and unobstructed safe-area padding allowing visionOS window grab bars to move freely.

JavaScript-to-Swift Bridge (WKScriptMessageHandler):

Seamless message channel allowing web buttons to trigger native visionOS openWindow(id:) and dismissWindow().

Graphics & Audio Engine:

Three.js (r128): High-performance 3D rendering for the Order Depth Landscape and the Open Outcry Pit arena.

HTML5 Canvas 2D: Responsive candlestick rendering and vector contagion flow simulations.

Web Audio API: Synthesized procedural sound effects and spatial ambience.

📂 Project Structure

```
├── Spatial_WorkstationApp.swift     # visionOS App entry point & WindowGroup scene definitions
├── ContentView.swift                # Native visionOS container, ornaments, and glass styling
├── WebViewContainer.swift           # WKWebView UIViewRepresentable with JavaScript message bridge
├── index.html                       # Single-file spatial trading workstation (Three.js, Canvas, UI)
└── README.md                        # Documentation & setup guide
```

---

## 🛠️ How to Run & Build

### Prerequisites
* **macOS**: Sonoma 14.0 or later
* **Xcode**: Xcode 15.2 or later (with the **visionOS SDK** installed via *Xcode > Settings > Platforms*)

---

### Method A: Running in the visionOS Simulator

1. **Open the Project in Xcode**:
   * Open your `.xcodeproj` or create a new **visionOS > App** project in Xcode.
   * Add `Spatial_WorkstationApp.swift`, `ContentView.swift`, and `WebViewContainer.swift` to your Xcode project target.
   * Drag `index.html` into your Xcode project navigator (ensure **"Copy items if needed"** and your app target are checked).

2. **Select the Simulator**:
   * In the top Xcode toolbar, select the target scheme: **Apple Vision Pro (Simulator)**.

3. **Build & Launch**:
   * Press `Cmd + R` (or click the **Play ▶** button).

4. **Navigating in the Simulator**:
   * **Move Windows**: Click and drag the horizontal **white pill bar** floating below the bottom of any window.
   * **Push/Pull in Depth (Z-axis)**: Hold the **`Option (⌥)` key** while clicking and dragging the bottom window bar forward or backward.
   * **Look Around / Orbit View**: **Right-click and drag** anywhere in the virtual room, or use the **`W`, `A`, `S`, `D`** keys to walk around.
   * **Multi-Window Arrangement**: On the **Spatial Hub**, click **Spawn Spatial Window** on all three cards. Grab each window handle and position the **Workstation** in front, the **3D Pit** to your left, and the **Macro Shockwave** to your right for a panoramic 3-screen desk.

---

### Method B: Running on a Physical Apple Vision Pro Device

1. **Enable Developer Mode on Apple Vision Pro**:
   * On your Apple Vision Pro headset, go to **Settings > Privacy & Security > Developer Mode**.
   * Toggle **Developer Mode** on and restart the device when prompted.

2. **Connect Vision Pro to Xcode**:
   * Ensure your Mac and Apple Vision Pro are connected to the **same Wi-Fi network**.
   * On Vision Pro, navigate to **Settings > General > Remote Devices** and select your Mac to pair.
   * In Xcode, open **Window > Devices and Simulators**, select your Apple Vision Pro, and enter the pairing code displayed inside the headset.

3. **Deploy to Device**:
   * Set the run destination in the Xcode top toolbar to your paired **Apple Vision Pro**.
   * In your project settings under **Signing & Capabilities**, select your active **Apple Developer Team**.
   * Press `Cmd + R` to compile and install the application directly to the headset.

4. **Native Spatial Gestures on Device**:
   * **Window Translation**: Look directly at the window bar beneath any panel, **pinch your index finger and thumb**, and move your hand anywhere in your physical space (X, Y, and Z depth).
   * **Corner Resizing**: Look at any bottom or top corner bracket, pinch, and pull outwards to expand the workstation to life-size proportions.
   * **Automatic Curving**: As you move windows into your peripheral field of view, visionOS automatically rotates them inward to maintain optimal line-of-sight ergonomics.

---

## 📊 Contract Specifications & Supported Assets

| Symbol | Underlying Asset | Tick Size | Notional Multiplier | Base Initial Margin |
| :--- | :--- | :--- | :--- | :--- |
| **/ES** | E-mini S&P 500 Futures | 0.25 | $50 / pt | $12,320.00 |
| **/NQ** | E-mini Nasdaq-100 Futures | 0.25 | $20 / pt | $18,480.00 |
| **/BTC** | Bitcoin Futures | 5.00 | 5 BTC | $35,200.00 |
| **/CL** | Light Sweet Crude Oil | 0.01 | 1,000 bbl | $7,150.00 |
| **/GC** | Gold Futures | 0.10 | 100 troy oz | $9,900.00 |
| **/ZN** | 10-Year US Treasury Note | 0.0156 | $1,000 / pt | $2,420.00 |

---

## 🔒 Security & Privacy
* The data in the current application is simulated and generated directly on the client side (hardcoded baseline schemas + dynamic mathematical simulation engines) inside index.html. It does not require an external API subscription or live internet connection to run smoothly in the visionOS Simulator.
* All Level 2 order book feeds, candlestick random-walk generators, 3D animations, and macro stress scenarios run entirely locally on-device. 
* No external API keys or private network credentials are required for standalone execution.
---
