<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Lumiere Cosmetics</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;1,300;1,400&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --ivory:    #F5EDE4;
      --soft:     #F0E4D8;
      --blush:    #EDD8C8;
      --mink:     #B89880;
      --charcoal: #3A2A20;
      --gold:     #C9A96E;
      --font-display: 'Cormorant Garamond', serif;
      --font-body:    'Jost', sans-serif;
    }

    html, body { height: 100%; }

    body {
      background: var(--ivory);
      color: var(--charcoal);
      font-family: var(--font-body);
      font-weight: 300;
    }

    a { text-decoration: none; color: inherit; }

    /* ── NAVBAR ── */
    nav {
      position: absolute;
      top: 0; left: 0; right: 0;
      z-index: 100;
      display: flex;
      align-items: flex-start;
      justify-content: space-between;
      padding: 28px 40px;
    }

    .nav-logo h1 {
      font-family: var(--font-display);
      font-size: 28px;
      font-weight: 300;
      letter-spacing: 8px;
      text-transform: uppercase;
      color: var(--charcoal);
      line-height: 1;
    }
    .nav-logo span {
      display: block;
      font-family: var(--font-body);
      font-size: 9px;
      letter-spacing: 5px;
      text-transform: uppercase;
      color: var(--mink);
      margin-top: 4px;
    }

    .nav-icons {
      display: flex;
      gap: 18px;
      align-items: center;
      padding-top: 4px;
    }

    .nav-icon {
      width: 22px;
      height: 22px;
      stroke: var(--charcoal);
      fill: none;
      stroke-width: 1.2;
      cursor: pointer;
      opacity: 0.75;
      transition: opacity 0.2s;
    }
    .nav-icon:hover { opacity: 1; }

    /* ── HERO ── */
    .hero {
      width: 100%;
      min-height: 100vh;
      position: relative;
      display: flex;
      align-items: center;
      overflow: hidden;
      background: var(--ivory);
    }

    .hero-img-placeholder {
      position: absolute;
      right: 0;
      bottom: 0;
      width: 65%;
      height: 100%;
      background: linear-gradient(160deg, var(--ivory) 0%, var(--blush) 60%, var(--soft) 100%);
    }

    /* when you have a real product photo, replace the div above with:
       <img src="images/hero-products.png" class="hero-img" alt="Lumiere products"> */
    .hero-img {
      position: absolute;
      right: 0;
      bottom: 0;
      width: 65%;
      height: 100%;
      object-fit: cover;
      object-position: center bottom;
    }

    .hero-content {
      position: relative;
      z-index: 2;
      padding: 0 0 0 56px;
      max-width: 400px;
    }

    .hero-title {
      font-family: var(--font-display);
      font-size: clamp(44px, 5.5vw, 64px);
      font-weight: 300;
      line-height: 1.15;
      color: var(--charcoal);
      margin-bottom: 32px;
      letter-spacing: 0.5px;
    }

    .hero-title em {
      font-style: italic;
      display: block;
    }

    .btn-shop {
      display: inline-block;
      padding: 12px 32px;
      background: transparent;
      color: var(--charcoal);
      border: 0.5px solid var(--charcoal);
      font-family: var(--font-body);
      font-size: 11px;
      letter-spacing: 1.5px;
      cursor: pointer;
      transition: background 0.2s, color 0.2s;
    }
    .btn-shop:hover {
      background: var(--charcoal);
      color: var(--ivory);
    }

    /* ── ANIMATIONS ── */
    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(20px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    .nav-logo  { animation: fadeUp 0.7s ease both 0.1s; }
    .nav-icons { animation: fadeUp 0.7s ease both 0.1s; }
    .hero-title { animation: fadeUp 0.9s ease both 0.3s; }
    .btn-shop   { animation: fadeUp 0.9s ease both 0.5s; }
  </style>
</head>
<body>

  <!-- NAVBAR -->
  <nav>
    <div class="nav-logo">
      <h1>Lumiere</h1>
      <span>Cosmetics</span>
    </div>
    <div class="nav-icons">
      <!-- Wishlist heart -->
      <svg class="nav-icon" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
      <!-- Account -->
      <svg class="nav-icon" viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
      <!-- Search -->
      <svg class="nav-icon" viewBox="0 0 24 24"><circle cx="11" cy="11" r="7"/><path d="M21 21l-4.35-4.35"/></svg>
      <!-- Cart -->
      <svg class="nav-icon" viewBox="0 0 24 24"><path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/><path d="M16 10a4 4 0 0 1-8 0"/></svg>
    </div>
  </nav>

  <!-- HERO -->
  <section class="hero">

  
   <img src="images/hero-products.png" class="hero-img" alt="Lumiere products">

    <div class="hero-content">
      <h1 class="hero-title">Illuminate Your<br><em>Beauty</em></h1>
      <a href="products.html" class="btn-shop">Shop now</a>
    </div>

  </section>

</body>
</html>