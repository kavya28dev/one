<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>NexusShop — Simple, Friendly Shopping</title>

<!-- Fonts & Icons -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">

<style>
/* ========== DESIGN TOKENS ========== */
:root {
  --bg: #fafaf8;
  --bg-card: #ffffff;
  --primary: #1a1a2e;
  --primary-light: #2d2d44;
  --accent: #c9644a;          /* darker for AA contrast on light bg */
  --accent-light: #f4d0c4;
  --accent-soft: #fdece6;
  --text: #1f2430;
  --text-muted: #5a6070;       /* improved contrast */
  --border: #e0ddd6;
  --success: #2f7a55;
  --focus: #1a73e8;
  --shadow-sm: 0 1px 2px rgba(26,26,46,.08);
  --shadow-md: 0 4px 16px rgba(26,26,46,.10);
  --radius-sm: 8px;
  --radius-md: 14px;
  --radius-lg: 20px;
  --maxw: 1180px;
}

/* ========== RESET / BASE ========== */
*, *::before, *::after { box-sizing: border-box; }
html { scroll-behavior: smooth; }
body {
  margin: 0;
  font-family: 'Inter', system-ui, -apple-system, sans-serif;
  background: var(--bg);
  color: var(--text);
  font-size: 16px;
  line-height: 1.6;
  -webkit-font-smoothing: antialiased;
}
img { max-width: 100%; display: block; }
a { color: inherit; text-decoration: none; }
button { font: inherit; cursor: pointer; border: none; background: none; color: inherit; }
ul { list-style: none; margin: 0; padding: 0; }

/* Visible focus ring for accessibility */
:focus-visible {
  outline: 3px solid var(--focus);
  outline-offset: 2px;
  border-radius: 4px;
}

.container { width: min(100% - 2rem, var(--maxw)); margin-inline: auto; }

/* Skip link */
.skip-link {
  position: absolute; left: -999px; top: 0;
  background: var(--primary); color: #fff;
  padding: .8rem 1.2rem; border-radius: 0 0 8px 0; z-index: 999;
}
.skip-link:focus { left: 0; }

/* ========== HEADER ========== */
.site-header {
  position: sticky; top: 0; z-index: 50;
  background: #fff;
  border-bottom: 1px solid var(--border);
  box-shadow: var(--shadow-sm);
}
.header-top {
  display: flex; align-items: center; gap: 1.25rem;
  padding: .9rem 0;
}
.brand {
  font-family: 'Playfair Display', serif;
  font-size: 1.5rem; font-weight: 700;
  color: var(--primary);
  display: flex; align-items: center; gap: .5rem;
  flex-shrink: 0;
}
.brand i { color: var(--accent); }

/* Search — big & clear */
.search-bar {
  flex: 1;
  max-width: 520px;
  position: relative;
  display: flex;
}
.search-bar input {
  width: 100%;
  padding: .7rem 1rem .7rem 2.75rem;
  font: inherit;
  font-size: .95rem;
  border: 2px solid var(--border);
  border-radius: 100px;
  background: var(--bg);
  color: var(--text);
  transition: border-color .15s;
}
.search-bar input::placeholder { color: var(--text-muted); }
.search-bar input:focus { border-color: var(--accent); background: #fff; outline: none; }
.search-bar i {
  position: absolute; left: 1rem; top: 50%;
  transform: translateY(-50%);
  color: var(--text-muted); pointer-events: none;
}

.header-actions { display: flex; align-items: center; gap: .4rem; }

/* Buttons & icon buttons — larger for touch */
.icon-btn {
  min-width: 46px; height: 46px;
  border-radius: 50%;
  display: inline-flex; align-items: center; justify-content: center;
  color: var(--primary); font-size: 1.05rem;
  transition: background .15s, color .15s;
  position: relative;
}
.icon-btn:hover { background: var(--accent-soft); color: var(--accent); }
.icon-btn .label {
  display: none;
}
.cart-count {
  position: absolute; top: 3px; right: 3px;
  min-width: 20px; height: 20px; padding: 0 5px;
  border-radius: 10px; background: var(--accent); color: #fff;
  font-size: .7rem; font-weight: 700;
  display: grid; place-items: center;
}
.menu-toggle { display: none; }

/* Main nav — always shows labels */
.main-nav {
  display: flex; gap: .25rem;
  border-top: 1px solid var(--border);
  overflow-x: auto;
  scrollbar-width: none;
}
.main-nav::-webkit-scrollbar { display: none; }
.main-nav a {
  padding: .85rem 1rem;
  font-size: .95rem; font-weight: 500;
  color: var(--text-muted);
  border-bottom: 3px solid transparent;
  white-space: nowrap;
  transition: color .15s, border-color .15s;
}
.main-nav a:hover { color: var(--primary); }
.main-nav a.active {
  color: var(--primary);
  border-bottom-color: var(--accent);
  font-weight: 600;
}

/* Mobile menu */
.mobile-nav {
  display: none;
  border-top: 1px solid var(--border);
  padding: .5rem 0 1rem;
}
.mobile-nav.open { display: block; }
.mobile-nav a {
  display: block; padding: .9rem 0;
  font-size: 1rem; font-weight: 500;
  border-bottom: 1px solid var(--border);
}

/* ========== HERO — simplified ========== */
.hero {
  padding: 3rem 0 2.5rem;
  background: linear-gradient(180deg, #fff 0%, var(--bg) 100%);
}
.hero-inner {
  display: grid;
  grid-template-columns: 1.1fr .9fr;
  gap: 2.5rem;
  align-items: center;
}
.hero-badge {
  display: inline-block;
  font-size: .8rem; font-weight: 600;
  letter-spacing: .05em; text-transform: uppercase;
  color: var(--accent);
  background: var(--accent-soft);
  padding: .35rem .85rem; border-radius: 100px;
  margin-bottom: 1rem;
}
.hero h1 {
  font-family: 'Playfair Display', serif;
  font-size: clamp(2rem, 4.5vw, 3rem);
  line-height: 1.15;
  margin: 0 0 1rem;
  color: var(--primary);
}
.hero p {
  font-size: 1.05rem;
  color: var(--text-muted);
  margin: 0 0 1.75rem;
  max-width: 44ch;
}
.hero-cta { display: flex; gap: .75rem; flex-wrap: wrap; }

.btn {
  display: inline-flex; align-items: center; justify-content: center;
  gap: .5rem;
  min-height: 48px;
  padding: 0 1.5rem;
  border-radius: 100px;
  font-size: .95rem; font-weight: 600;
  transition: background .15s, transform .1s;
}
.btn-primary {
  background: var(--primary); color: #fff;
}
.btn-primary:hover { background: var(--primary-light); }
.btn-primary:active { transform: scale(.98); }
.btn-ghost {
  background: #fff; color: var(--primary);
  border: 2px solid var(--border);
}
.btn-ghost:hover { border-color: var(--accent); color: var(--accent); }

.hero-visual img {
  width: 100%; border-radius: var(--radius-lg);
  aspect-ratio: 4/3; object-fit: cover;
  box-shadow: var(--shadow-md);
}

/* ========== TRUST BAR ========== */
.trust-bar {
  background: #fff;
  border-block: 1px solid var(--border);
  padding: 1.1rem 0;
}
.trust-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 1rem;
}
.trust-item {
  display: flex; align-items: center; gap: .7rem;
  font-size: .88rem; font-weight: 500;
  color: var(--text);
}
.trust-item i {
  color: var(--accent);
  font-size: 1.1rem;
  flex-shrink: 0;
}

/* ========== SECTIONS ========== */
.section { padding: 3rem 0; }
.section-head { margin-bottom: 1.75rem; }
.section-head h2 {
  font-family: 'Playfair Display', serif;
  font-size: clamp(1.6rem, 3vw, 2.1rem);
  margin: 0 0 .35rem;
  color: var(--primary);
}
.section-head p { margin: 0; color: var(--text-muted); font-size: .95rem; }

/* ========== FILTERS — big & obvious ========== */
.filters {
  display: flex; gap: .5rem; flex-wrap: wrap;
  margin-bottom: 1.75rem;
}
.filter-btn {
  min-height: 44px;
  padding: 0 1.2rem;
  border-radius: 100px;
  background: #fff;
  border: 2px solid var(--border);
  font-size: .9rem; font-weight: 500;
  color: var(--text);
  transition: all .15s;
}
.filter-btn:hover { border-color: var(--accent); }
.filter-btn.active,
.filter-btn[aria-pressed="true"] {
  background: var(--primary);
  border-color: var(--primary);
  color: #fff;
}

/* ========== PRODUCT GRID — plain & clear ========== */
.product-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
  gap: 1.25rem;
}
.product-card {
  background: #fff;
  border: 1px solid var(--border);
  border-radius: var(--radius-md);
  overflow: hidden;
  display: flex; flex-direction: column;
  transition: box-shadow .15s;
}
.product-card:hover { box-shadow: var(--shadow-md); }
.product-media {
  position: relative;
  aspect-ratio: 1/1;
  background: #f1eeea;
  overflow: hidden;
}
.product-media img {
  width: 100%; height: 100%; object-fit: cover;
}
.badge {
  position: absolute; top: .7rem; left: .7rem;
  padding: .3rem .65rem;
  border-radius: 6px;
  font-size: .72rem; font-weight: 700;
  text-transform: uppercase; letter-spacing: .04em;
  color: #fff; background: var(--accent);
}
.badge.sale { background: var(--success); }

.product-body {
  padding: 1rem;
  display: flex; flex-direction: column; gap: .5rem;
  flex: 1;
}
.product-cat {
  font-size: .72rem; font-weight: 600;
  letter-spacing: .05em; text-transform: uppercase;
  color: var(--text-muted);
}
.product-name {
  font-size: 1rem; font-weight: 600;
  color: var(--primary);
  margin: 0; line-height: 1.35;
}
.rating {
  display: flex; align-items: center; gap: .25rem;
  font-size: .82rem; color: var(--text-muted);
}
.rating .stars { color: #d99a00; letter-spacing: 1px; }

.price-row {
  display: flex; align-items: baseline; gap: .5rem;
  margin-top: auto;
}
.price { font-size: 1.2rem; font-weight: 800; color: var(--primary); }
.price-old { font-size: .88rem; color: var(--text-muted); text-decoration: line-through; }

/* Add-to-cart: always visible */
.add-btn {
  margin-top: .5rem;
  width: 100%;
  min-height: 46px;
  border-radius: 10px;
  background: var(--primary);
  color: #fff;
  font-size: .9rem; font-weight: 600;
  display: inline-flex; align-items: center; justify-content: center; gap: .5rem;
  transition: background .15s;
}
.add-btn:hover { background: var(--accent); }
.add-btn:active { transform: scale(.98); }
.add-btn.added { background: var(--success); }

/* ========== CTA BANNER ========== */
.cta-banner {
  background: var(--primary);
  color: #fff;
  border-radius: var(--radius-lg);
  padding: 2.5rem;
  display: flex; align-items: center; justify-content: space-between;
  gap: 1.5rem; flex-wrap: wrap;
}
.cta-banner h2 {
  font-family: 'Playfair Display', serif;
  font-size: clamp(1.5rem, 3vw, 2rem);
  margin: 0 0 .4rem;
}
.cta-banner p { margin: 0; color: rgba(255,255,255,.85); font-size: .95rem; }
.cta-banner .btn-primary { background: var(--accent); }
.cta-banner .btn-primary:hover { background: #b5543c; }

/* ========== NEWSLETTER ========== */
.newsletter {
  background: #fff;
  border: 1px solid var(--border);
  border-radius: var(--radius-lg);
  padding: 2rem;
  display: flex; align-items: center; justify-content: space-between;
  gap: 1.5rem; flex-wrap: wrap;
}
.newsletter h3 {
  font-family: 'Playfair Display', serif;
  font-size: 1.4rem; margin: 0 0 .3rem;
}
.newsletter p { margin: 0; color: var(--text-muted); font-size: .9rem; }
.newsletter form { display: flex; gap: .5rem; flex-wrap: wrap; }
.newsletter input {
  min-height: 48px;
  padding: 0 1.1rem;
  border: 2px solid var(--border);
  border-radius: 100px;
  font: inherit; font-size: .92rem;
  min-width: 260px;
  background: var(--bg);
}
.newsletter input:focus { border-color: var(--accent); outline: none; background: #fff; }

/* ========== FOOTER ========== */
.site-footer {
  background: var(--primary);
  color: rgba(255,255,255,.8);
  padding: 3rem 0 1.5rem;
  margin-top: 3rem;
}
.footer-grid {
  display: grid;
  grid-template-columns: 1.5fr 1fr 1fr;
  gap: 2rem;
  padding-bottom: 2rem;
  border-bottom: 1px solid rgba(255,255,255,.15);
}
.site-footer .brand { color: #fff; margin-bottom: .75rem; }
.site-footer p { font-size: .88rem; margin: 0 0 1rem; max-width: 34ch; }
.footer-col h4 {
  color: #fff; font-size: .8rem;
  letter-spacing: .08em; text-transform: uppercase;
  margin: 0 0 1rem;
}
.footer-col li { margin-bottom: .55rem; }
.footer-col a { font-size: .9rem; }
.footer-col a:hover { color: #fff; text-decoration: underline; }
.footer-bottom {
  padding-top: 1.5rem;
  font-size: .82rem;
  text-align: center;
}

/* ========== TOAST ========== */
.toast {
  position: fixed; bottom: 1.5rem; left: 50%;
  transform: translate(-50%, 150%);
  background: var(--primary); color: #fff;
  padding: .9rem 1.4rem;
  border-radius: 100px;
  font-size: .9rem; font-weight: 500;
  box-shadow: var(--shadow-md);
  z-index: 100;
  display: flex; align-items: center; gap: .5rem;
  transition: transform .3s ease;
  max-width: calc(100% - 2rem);
}
.toast.show { transform: translate(-50%, 0); }
.toast i { color: #6ee7a8; }

/* ========== RESPONSIVE ========== */
@media (max-width: 900px) {
  .hero-inner { grid-template-columns: 1fr; gap: 1.5rem; }
  .hero-visual { order: -1; }
  .trust-grid { grid-template-columns: repeat(2, 1fr); }
  .footer-grid { grid-template-columns: 1fr 1fr; }
}
@media (max-width: 720px) {
  .search-bar { display: none; }
  .header-actions .icon-btn .optional { display: none; }
  .menu-toggle { display: inline-flex; }
  .main-nav { display: none; }
  .header-top { gap: .5rem; }
  .brand { font-size: 1.3rem; }
  .product-grid { grid-template-columns: repeat(2, 1fr); gap: .9rem; }
  .newsletter { padding: 1.5rem; }
  .newsletter input, .newsletter form { width: 100%; }
  .newsletter input { min-width: 0; }
  .newsletter .btn { width: 100%; }
}
@media (max-width: 480px) {
  .trust-grid { grid-template-columns: 1fr; }
  .footer-grid { grid-template-columns: 1fr; }
  .cta-banner { padding: 1.75rem; }
  .product-grid { grid-template-columns: 1fr; }
}
</style>
</head>
<body>

<a href="#main" class="skip-link">Skip to content</a>

<!-- ========== HEADER ========== -->
<header class="site-header">
  <div class="container">
    <div class="header-top">
      <a href="#" class="brand" aria-label="NexusShop home">
        <i class="fa-solid fa-cube" aria-hidden="true"></i> NexusShop
      </a>

      <!-- Big, clear search -->
      <form class="search-bar" role="search" onsubmit="event.preventDefault();">
        <i class="fa-solid fa-magnifying-glass" aria-hidden="true"></i>
        <input type="search" placeholder="Search for products…" aria-label="Search products">
      </form>

      <div class="header-actions">
        <button class="icon-btn optional" aria-label="My account">
          <i class="fa-regular fa-user" aria-hidden="true"></i>
        </button>
        <button class="icon-btn" aria-label="Cart" id="cartBtn">
          <i class="fa-solid fa-bag-shopping" aria-hidden="true"></i>
          <span class="cart-count" id="cartCount" aria-live="polite">0</span>
        </button>
        <button class="icon-btn menu-toggle" id="menuToggle" aria-label="Open menu" aria-expanded="false">
          <i class="fa-solid fa-bars" aria-hidden="true"></i>
        </button>
      </div>
    </div>

    <nav class="main-nav" aria-label="Main navigation">
      <a href="#" class="active">Shop</a>
      <a href="#new">New Arrivals</a>
      <a href="#sale">Sale</a>
      <a href="#">Furniture</a>
      <a href="#">Lighting</a>
      <a href="#">Decor</a>
      <a href="#">About</a>
    </nav>

    <!-- Mobile nav -->
    <nav class="mobile-nav" id="mobileNav" aria-label="Mobile navigation">
      <a href="#">Shop</a>
      <a href="#new">New Arrivals</a>
      <a href="#sale">Sale</a>
      <a href="#">Furniture</a>
      <a href="#">Lighting</a>
      <a href="#">Decor</a>
      <a href="#">About</a>
    </nav>
  </div>
</header>

<main id="main">

  <!-- ========== HERO ========== -->
  <section class="hero">
    <div class="container hero-inner">
      <div>
        <span class="hero-badge">Spring Collection</span>
        <h1>Beautiful things, made simple.</h1>
        <p>Furniture, lighting, and everyday essentials from independent makers — delivered fast, with a 30-day guarantee.</p>
        <div class="hero-cta">
          <a href="#shop" class="btn btn-primary">Start shopping</a>
          <a href="#new" class="btn btn-ghost">See new arrivals</a>
        </div>
      </div>
      <div class="hero-visual">
        <img src="https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?auto=format&fit=crop&w=900&q=80"
             alt="Minimal modern living room with a designer sofa">
      </div>
    </div>
  </section>

  <!-- ========== TRUST BAR ========== -->
  <section class="trust-bar">
    <div class="container trust-grid">
      <div class="trust-item"><i class="fa-solid fa-truck-fast" aria-hidden="true"></i> Free shipping over $150</div>
      <div class="trust-item"><i class="fa-solid fa-rotate-left" aria-hidden="true"></i> 30-day returns</div>
      <div class="trust-item"><i class="fa-solid fa-shield-halved" aria-hidden="true"></i> Secure checkout</div>
      <div class="trust-item"><i class="fa-solid fa-headset" aria-hidden="true"></i> Support 7 days a week</div>
    </div>
  </section>

  <!-- ========== PRODUCTS ========== -->
  <section class="section" id="shop">
    <div class="container">
      <div class="section-head">
        <h2>Bestsellers</h2>
        <p>What our customers love most right now.</p>
      </div>

      <div class="filters" role="group" aria-label="Filter products by category">
        <button class="filter-btn active" aria-pressed="true" data-filter="all">All</button>
        <button class="filter-btn" aria-pressed="false" data-filter="furniture">Furniture</button>
        <button class="filter-btn" aria-pressed="false" data-filter="lighting">Lighting</button>
        <button class="filter-btn" aria-pressed="false" data-filter="decor">Decor</button>
        <button class="filter-btn" aria-pressed="false" data-filter="textiles">Textiles</button>
      </div>

      <div class="product-grid" id="productGrid">
        <!-- Product 1 -->
        <article class="product-card" data-category="furniture">
          <div class="product-media">
            <span class="badge">New</span>
            <img src="https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?auto=format&fit=crop&w=600&q=80" alt="Oak lounge chair">
          </div>
          <div class="product-body">
            <span class="product-cat">Furniture</span>
            <h3 class="product-name">Oak Lounge Chair</h3>
            <div class="rating">
              <span class="stars" aria-hidden="true">★★★★★</span>
              <span>4.8 (128 reviews)</span>
            </div>
            <div class="price-row"><span class="price">$289</span></div>
            <button class="add-btn" data-name="Oak Lounge Chair">
              <i class="fa-solid fa-plus" aria-hidden="true"></i> Add to cart
            </button>
          </div>
        </article>

        <!-- Product 2 -->
        <article class="product-card" data-category="lighting">
          <div class="product-media">
            <img src="https://images.unsplash.com/photo-1513506003901-1e6a229e2d15?auto=format&fit=crop&w=600&q=80" alt="Ceramic table lamp">
          </div>
          <div class="product-body">
            <span class="product-cat">Lighting</span>
            <h3 class="product-name">Ceramic Table Lamp</h3>
            <div class="rating">
              <span class="stars" aria-hidden="true">★★★★☆</span>
              <span>4.2 (84 reviews)</span>
            </div>
            <div class="price-row">
              <span class="price">$149</span>
              <span class="price-old">$189</span>
            </div>
            <button class="add-btn" data-name="Ceramic Table Lamp">
              <i class="fa-solid fa-plus" aria-hidden="true"></i> Add to cart
            </button>
          </div>
        </article>

        <!-- Product 3 -->
        <article class="product-card" data-category="textiles">
          <div class="product-media">
            <span class="badge sale">25% off</span>
            <img src="https://images.unsplash.com/photo-1586023492125-27b2c045efd7?auto=format&fit=crop&w=600&q=80" alt="Linen throw pillow">
          </div>
          <div class="product-body">
            <span class="product-cat">Textiles</span>
            <h3 class="product-name">Linen Throw Pillow</h3>
            <div class="rating">
              <span class="stars" aria-hidden="true">★★★★★</span>
              <span>4.9 (212 reviews)</span>
            </div>
            <div class="price-row">
              <span class="price">$59</span>
              <span class="price-old">$79</span>
            </div>
            <button class="add-btn" data-name="Linen Throw Pillow">
              <i class="fa-solid fa-plus" aria-hidden="true"></i> Add to cart
            </button>
          </div>
        </article>

        <!-- Product 4 -->
        <article class="product-card" data-category="decor">
          <div class="product-media">
            <img src="https://images.unsplash.com/photo-1578500494198-246f612d3b3d?auto=format&fit=crop&w=600&q=80" alt="Handmade ceramic vase">
          </div>
          <div class="product-body">
            <span class="product-cat">Decor</span>
            <h3 class="product-name">Handmade Ceramic Vase</h3>
            <div class="rating">
              <span class="stars" aria-hidden="true">★★★★☆</span>
              <span>4.3 (67 reviews)</span>
            </div>
            <div class="price-row"><span class="price">$89</span></div>
            <button class="add-btn" data-name="Handmade Ceramic Vase">
              <i class="fa-solid fa-plus" aria-hidden="true"></i> Add to cart
            </button>
          </div>
        </article>
      </div>
    </div>
  </section>

  <!-- ========== CTA BANNER ========== -->
  <section class="container" id="sale">
    <div class="cta-banner">
      <div>
        <h2>Spring sale — up to 40% off</h2>
        <p>Warm neutrals, natural materials, and sculptural forms at their best prices of the season.</p>
      </div>
      <a href="#shop" class="btn btn-primary">Shop the sale</a>
    </div>
  </section>

  <!-- ========== NEWSLETTER ========== -->
  <section class="section container" id="new">
    <div class="newsletter">
      <div>
        <h3>Get 10% off your first order</h3>
        <p>Join our list for early access to new arrivals. No spam, ever.</p>
      </div>
      <form id="newsletterForm">
        <input type="email" placeholder="Enter your email" aria-label="Email address" required>
        <button type="submit" class="btn btn-primary">Subscribe</button>
      </form>
    </div>
  </section>

</main>

<!-- ========== FOOTER ========== -->
<footer class="site-footer">
  <div class="container">
    <div class="footer-grid">
      <div>
        <a href="#" class="brand"><i class="fa-solid fa-cube" aria-hidden="true"></i> NexusShop</a>
        <p>Thoughtfully designed objects for modern living, from independent makers around the world.</p>
      </div>
      <div class="footer-col">
        <h4>Shop</h4>
        <ul>
          <li><a href="#">New arrivals</a></li>
          <li><a href="#">Furniture</a></li>
          <li><a href="#">Lighting</a></li>
          <li><a href="#">Sale</a></li>
        </ul>
      </div>
      <div class="footer-col">
        <h4>Help</h4>
        <ul>
          <li><a href="#">Contact us</a></li>
          <li><a href="#">Shipping</a></li>
          <li><a href="#">Returns</a></li>
          <li><a href="#">FAQ</a></li>
        </ul>
      </div>
    </div>
    <div class="footer-bottom">
      © 2026 NexusShop. All rights reserved.
    </div>
  </div>
</footer>

<!-- ========== TOAST ========== -->
<div class="toast" id="toast" role="status" aria-live="polite">
  <i class="fa-solid fa-circle-check" aria-hidden="true"></i>
  <span id="toastMsg">Added to cart</span>
</div>

<script>
/* ---------- Mobile menu ---------- */
const menuToggle = document.getElementById('menuToggle');
const mobileNav = document.getElementById('mobileNav');
menuToggle.addEventListener('click', () => {
  const open = mobileNav.classList.toggle('open');
  menuToggle.setAttribute('aria-expanded', open);
  menuToggle.setAttribute('aria-label', open ? 'Close menu' : 'Open menu');
});

/* ---------- Cart ---------- */
let cartTotal = 0;
const cartCountEl = document.getElementById('cartCount');
const toast = document.getElementById('toast');
const toastMsg = document.getElementById('toastMsg');

function showToast(msg) {
  toastMsg.textContent = msg;
  toast.classList.add('show');
  clearTimeout(showToast._t);
  showToast._t = setTimeout(() => toast.classList.remove('show'), 2200);
}

document.querySelectorAll('.add-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    cartTotal++;
    cartCountEl.textContent = cartTotal;
    btn.classList.add('added');
    btn.innerHTML = '<i class="fa-solid fa-check" aria-hidden="true"></i> Added';
    showToast(`${btn.dataset.name} added to cart`);
    setTimeout(() => {
      btn.classList.remove('added');
      btn.innerHTML = '<i class="fa-solid fa-plus" aria-hidden="true"></i> Add to cart';
    }, 1400);
  });
});

/* ---------- Filters ---------- */
const filterBtns = document.querySelectorAll('.filter-btn');
const products = document.querySelectorAll('.product-card');

filterBtns.forEach(btn => {
  btn.addEventListener('click', () => {
    filterBtns.forEach(b => {
      b.classList.remove('active');
      b.setAttribute('aria-pressed', 'false');
    });
    btn.classList.add('active');
    btn.setAttribute('aria-pressed', 'true');

    const filter = btn.dataset.filter;
    products.forEach(card => {
      const match = filter === 'all' || card.dataset.category === filter;
      card.style.display = match ? '' : 'none';
    });
  });
});

/* ---------- Newsletter ---------- */
document.getElementById('newsletterForm').addEventListener('submit', e => {
  e.preventDefault();
  showToast('Thanks! Check your inbox for 10% off.');
  e.target.reset();
});
</script>

</body>
</html>
