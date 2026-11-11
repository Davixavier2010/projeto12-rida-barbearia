---
name: web-design-guidelines
description: Industry-standard web design guidelines and heuristics for engineering high-converting, accessible, and aesthetically pleasing websites. Covers visual hierarchy, typography systems, WCAG contrast, spacing systems (4px/8px), tactile interactive states, mobile thumb-zones, and performance. Use when designing, styling, building, or auditing frontend interfaces.
---

# Web Design Guidelines & Engineering Standards

A comprehensive, normative design guide for building production-grade web interfaces that balance aesthetic distinction with functional clarity and universal accessibility.

---

## 1. Visual Hierarchy & Composition

Every viewport must have a single focal anchor. If everything screams for attention, nothing is heard.

### The 3-Level Reading Path
1. **Primary Anchor (Level 1):** The headline or primary hero visual. Must communicate the core proposition in under 3 seconds.
2. **Supporting Detail (Level 2):** Subheadings, key metrics, feature badges, or primary CTA button.
3. **Tertiary Context (Level 3):** Body paragraphs, metadata, legal disclaimers, microcopy, breadcrumbs.

### Rules of Layout
* **F-Pattern & Z-Pattern:** Place critical brand identity top-left, key actions top-right, and value propositions following the natural eye sweep.
* **One Primary Action per Screen:** Never place two equally weighted high-contrast buttons side-by-side. Use Solid (Primary) + Outline/Ghost (Secondary).
* **Grid Discipline:** Use consistent multi-column grids (12 columns for desktop, 6-8 for tablet, 4 for mobile) with fixed gutter widths (16px to 32px).
* **Equal Padding & Alignment:** Maintain mathematical alignment of text baselines, icon centers, and card edges.

---

## 2. Typography System

Typography carries 90% of the web's information. A disciplined type scale separates amateurs from elite design engineers.

### Modular Type Scale (1.250 Major Third or 1.333 Perfect Fourth)
* **Display / Hero H1:** `48px` to `72px` (Mobile: `32px` to `42px`) — Line-height: `1.05` to `1.15`, letter-spacing: `-0.02em` to `-0.03em`.
* **Section H2:** `30px` to `40px` (Mobile: `24px` to `28px`) — Line-height: `1.2`, letter-spacing: `-0.015em`.
* **Feature H3:** `20px` to `24px` — Line-height: `1.3`, letter-spacing: `-0.01em`.
* **Lead / Intro Body:** `18px` to `20px` — Line-height: `1.6`.
* **Standard Body:** `15px` to `16px` — Line-height: `1.65` to `1.75`. Never go below 14px for readable body copy.
* **Caption / Metadata:** `12px` to `13px` — Line-height: `1.4`, letter-spacing: `+0.01em` to `+0.02em`.
* **Monospace / Numbers:** Always apply `tabular-nums` (`font-variant-numeric: tabular-nums`) to counters, prices, tables, and timers.

### Editorial Line Length (Measure)
* Never allow body text to span full-width across wide desktop viewports.
* Strict rule: **45 to 75 characters per line** (ideal: `60-65ch` / `max-w-[65ch]`). Anything wider strains eye tracking.

---

## 3. Color Theory & Accessibility (WCAG 2.1)

Color should establish mood, denote hierarchy, and communicate functional state.

### The 60-30-10 Rule
* **60% Dominant Background/Surface:** Clean canvas (e.g., `#FAF7F2` alabaster, `#0F0F11` dark obsidian).
* **30% Secondary Structure:** Cards, borders, navigation bars, muted text (`#241614`, `#5C4D47`).
* **10% Accent / Focus:** Primary CTA buttons, key highlights, badges (`#631626` maroon, `#C88544` gold).

### Contrast Standards
* **Normal Text (< 18px):** Minimum contrast ratio of **4.5:1** against the background (WCAG AA).
* **Large Text (>= 18px bold or >= 24px regular):** Minimum contrast ratio of **3:1**.
* **Interactive Elements & Form Borders:** Minimum contrast ratio of **3:1** against adjacent colors.
* Never use pure black (`#000000`) on pure white (`#FFFFFF`) for dense text; use high-contrast dark tones (`#111827`, `#241614`) to prevent eye fatigue.

---

## 4. Spacing System & Rhythm (The 8pt Grid)

All padding, margins, gaps, and dimensions must be multiples of **4px** or **8px**.

```text
4px   (0.25rem) - Micro gaps, icon adjustments, border-radius on tags
8px   (0.5rem)  - Tight padding, intra-card element spacing
12px  (0.75rem) - Form input internal padding
16px  (1.0rem)  - Standard card padding, grid gutters
24px  (1.5rem)  - Spacing between content groups
32px  (2.0rem)  - Section internal sub-blocks
48px  (3.0rem)  - Moderate section padding
64px  (4.0rem)  - Standard section vertical padding (mobile: 40px)
96px+ (6.0rem+) - Major editorial desktop section margins
```

---

## 5. Interactive States & Tactile Physics

Every interactive element must provide continuous sensory feedback through its lifecycle.

### Complete Interactive Matrix
1. **Default:** Stable, visually balanced, distinct from non-interactive text.
2. **Hover:** Elevation lift (`translateY(-2px)`), subtle brightness step (+5%), or soft ambient glow.
3. **Focus-Visible:** High-contrast outline ring (minimum 2px with 2-3px offset). Never hide `:focus-visible` without replacement.
4. **Active / Pressed:** Physical depress feedback (`scale(0.97)` to `scale(0.98)`). Transition duration: `0.08s` with `cubic-bezier(0.2, 0, 0, 1)`.
5. **Loading / Pending:** Disabled pointer events, spinner or shimmer indicator, label remains visible or switches to "Processando...".
6. **Disabled:** Reduced opacity (40-50%), `cursor: not-allowed`, no hover/active triggers.

---

## 6. Mobile & Responsive Ergonomics

Desktop design is viewed with a mouse; mobile design is operated with thumbs.

* **Minimum Touch Target:** All tap targets must be at least **44x44 CSS pixels** (`min-h-[44px] min-w-[44px]`).
* **Thumb Zone Architecture:** Primary actions, drawer handles, bottom sheets, and checkout triggers must reside in the lower half of the screen.
* **Sticky Navigation Bar:** Floating pill or compact bar that collapses or remains light to avoid stealing vertical screen real estate.
* **Font Scaling:** Never scale font sizes down below 16px on form inputs (`<input>`, `<select>`) on mobile devices to prevent automatic iOS Safari zoom bugs.

---

## 7. Performance & Quality Gates

* **Zero Content Shift (CLS):** Always set explicit `width` and `height` or `aspect-ratio` on images, videos, and embedded media.
* **Smooth Scrolling:** Use hardware-accelerated transforms (`transform: translate3d(...)`) rather than animating `top`, `left`, `margin`, or `height`.
* **Motion Accessibility:** Always respect `prefers-reduced-motion: reduce`.
