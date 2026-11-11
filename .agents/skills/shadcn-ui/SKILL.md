---
name: shadcn-ui
description: Comprehensive guide and engineering reference for shadcn/ui. Covers component selection, manual and CLI installation, Radix UI primitive mechanics, Tailwind CSS v3/v4 token customization, and composition patterns for React, Next.js, and TypeScript projects. Use when adding, styling, or debugging shadcn/ui components, form controls, dialogs, dropdowns, and data tables.
---

# shadcn/ui Design & Engineering Guide

A complete guide for integrating, styling, and composing components from the **shadcn/ui** design system into modern React and Next.js applications.

---

## 1. Core Architecture

`shadcn/ui` is **not a dependency package**. It is a curated collection of re-usable components that you copy and paste or install directly into your project's codebase.

* **Primitives:** Powered by headless Radix UI (`@radix-ui/react-*`), ensuring complete keyboard accessibility, ARIA compliance, and focus management.
* **Styling:** Tailwind CSS with utility-first classes, customized via CSS variables (`hsl(var(--primary))`) for effortless light/dark mode theming.
* **Component Helper:** Uses `cn()` (`clsx` + `tailwind-merge`) to allow effortless class overrides without specificity collisions.

---

## 2. Essential Component Categories

### 1. Form Controls & Inputs
* **Button:** Supports variants (`default`, `destructive`, `outline`, `secondary`, `ghost`, `link`) and sizes (`sm`, `default`, `lg`, `icon`). Always enforce `active:scale-[0.98]` tactile feel.
* **Input & Textarea:** Clean focus rings with `ring-offset-background`, subtle border transitions, and placeholder contrast.
* **Select & Combobox:** Radix-powered dropdown with keyboard navigation, search filtering, and animated chevron indicators.
* **Checkbox & Switch:** Accessible toggles with smooth pill animations and clear `:focus-visible` outlines.

### 2. Overlays & Dialogs
* **Dialog / Modal:** Centered overlay with backdrop blur (`backdrop-blur-sm bg-black/80`), `Escape` key close listener, and focus trapping.
* **Sheet / Drawer:** Slide-in lateral drawer (ideal for mobile navigation and shopping bags).
* **Dropdown Menu & Popover:** Anchored floating panels with collision detection and smooth exit transitions.
* **Tooltip:** Micro-hints with delayed hover triggers (`delayDuration={200}`) and arrow indicators.

### 3. Data Display & Feedback
* **Card:** Standard composition (`CardHeader`, `CardTitle`, `CardDescription`, `CardContent`, `CardFooter`).
* **Table & Data Table:** TanStack Table integration with sorting, pagination, and multi-column filtering.
* **Badge:** Subtle chip tags for status (`default`, `secondary`, `destructive`, `outline`).
* **Toast / Sonner:** Fluid, stackable notifications with auto-dismiss and action triggers.

---

## 3. Best Practices & Customization

### The `cn()` Pattern
Always merge custom classes cleanly:
```tsx
import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
```

### Customizing Design Tokens
Map shadcn variables in `globals.css` to project brand colors:
```css
@layer base {
  :root {
    --background: 40 43% 97%;    /* #FAF7F2 */
    --foreground: 12 28% 11%;    /* #241614 */
    --primary: 348 64% 24%;      /* #631626 (Maroon) */
    --primary-foreground: 40 43% 97%;
    --accent: 30 55% 53%;        /* #C88544 (Caramel) */
    --accent-foreground: 12 28% 11%;
    --radius: 1rem;
  }
}
```
