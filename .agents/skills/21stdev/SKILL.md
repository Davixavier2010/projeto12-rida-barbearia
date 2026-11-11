---
name: 21stdev
description: 21st.dev component design and implementation guidelines. Provides modern, highly-crafted UI components inspired by Aceternity UI, Magic UI, and 21st.dev's design engineer community. Covers glowing cards, animated gradients, bento grids, spotlight borders, interactive docks, and particle backgrounds for React, Next.js, and modern Tailwind projects.
---

# 21st.dev Component Engineering Guidelines

A specialized skill for integrating, crafting, and customizing high-end interactive UI components from the **21st.dev** design engineer ecosystem.

---

## What is 21st.dev?

21st.dev is the open-source community platform known as the *"npm for design engineers"*. It bridges standard `shadcn/ui` utility components with cutting-edge visual craft, micro-interactions, shaders, Framer Motion springs, and Tailwind styling.

---

## Core Component Archetypes

### 1. Spotlight & Glowing Border Cards
Cards with dynamic cursor-following gradient illumination:
* **Effect:** An ambient radial spotlight moves with the pointer coordinates (`onMouseMove` calculating mouse position relative to card boundaries).
* **Styling:** `bg-gradient-to-r from-transparent via-white/10 to-transparent`, `border border-white/10`, `backdrop-blur-md`.
* **Use Case:** Feature showcases, pricing tiers, premium product highlights.

### 2. Shimmer & Border Beam Buttons
Buttons that pulse with a travelling metallic sheen:
* **Effect:** Continuous CSS keyframe animation sliding a narrow linear-gradient across the element border or background.
* **Physics:** Tactile scale depress on click (`active:scale-[0.97]`).
* **Use Case:** High-conversion Hero CTAs, waitlist signups, checkout actions.

### 3. Bento Grid Systems
Asymmetric responsive card layouts with visual hierarchy:
* **Structure:** CSS Grid with mixed column and row spans (`col-span-1`, `col-span-2`, `row-span-2`).
* **Visual Density:** Each card highlights a single capability with real UI fragments, graphs, or interactive toggles rather than generic stock photos.
* **Use Case:** Product feature overviews, SaaS landing pages, agency portfolio showcases.

### 4. Interactive Floating Docks & Island Menus
MacOS-inspired fluid navigation bars:
* **Physics:** Spring-based icon magnification based on cursor distance (`useSpring`, `useTransform` in Framer Motion).
* **Styling:** Pill-shaped container, frosted glassmorphism (`backdrop-blur-xl bg-white/80 dark:bg-black/80`).
* **Use Case:** Floating bottom toolbars, creative portfolio navigation, desktop dashboards.

### 5. Animated Number Counters & Tickers
Smooth scrolling numerical digits:
* **Rule:** Always apply `tabular-nums` (`font-variant-numeric: tabular-nums`).
* **Animation:** Spring-driven vertical translation of digit strips when numerical state updates.
* **Use Case:** KPI metrics, pricing calculators, shopping bag totals, live metrics.

---

## Implementation Guidelines

### Tailwind CSS Setup
Ensure `tailwind.config.js` includes modern animation keyframes:
```javascript
module.exports = {
  theme: {
    extend: {
      animation: {
        'shimmer': 'shimmer 2.5s linear infinite',
        'border-beam': 'border-beam calc(var(--duration)*1s) infinite linear',
        'pulse-glow': 'pulse-glow 2s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
      keyframes: {
        shimmer: {
          from: { backgroundPosition: '0 0' },
          to: { backgroundPosition: '-200% 0' },
        },
      },
    },
  },
};
```

### Motion Integration
Always combine Tailwind classes with Motion/Framer Motion:
```tsx
import { motion } from "framer-motion";

export const Card = ({ title, description, children }) => (
  <motion.div
    whileHover={{ y: -4, transition: { duration: 0.2 } }}
    whileTap={{ scale: 0.98 }}
    className="rounded-3xl border border-white/10 bg-neutral-900/60 p-8 backdrop-blur-xl"
  >
    {children}
  </motion.div>
);
```
