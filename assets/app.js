/**
 * AGÊNCIA RIDA • BARBEARIA EMUNAH
 * Estética Editorial Nia Creative
 */

document.addEventListener('DOMContentLoaded', () => {
  // 1. RELÓGIO EDITORIAL EM TEMPO REAL NO HEADER (ASSINATURA NIA CREATIVE)
  const clockEl = document.getElementById('live-clock');
  const updateClock = () => {
    if (!clockEl) return;
    const now = new Date();
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    clockEl.textContent = `${hours}:${minutes} • HORA MARCADA`;
  };
  updateClock();
  setInterval(updateClock, 30000);

  // 2. NAVEGAÇÃO SUAVE
  const links = document.querySelectorAll('a[href^="#"]');
  links.forEach(link => {
    link.addEventListener('click', e => {
      const targetId = link.getAttribute('href');
      if (targetId === '#') return;
      const targetEl = document.querySelector(targetId);
      if (targetEl) {
        e.preventDefault();
        targetEl.scrollIntoView({ behavior: 'smooth' });
      }
    });
  });

  // 3. ABERTURA DE ENTRADA (1.8s • TESOURA CORTANDO • PROFISSIONAL • SEM BOTÃO • SEM TEXTO)
  const splashEl = document.getElementById('siteSplash');
  if (splashEl) {
    document.body.style.overflow = 'hidden';

    const dismissSplash = () => {
      splashEl.classList.add('fade-out');
      document.body.style.overflow = '';
      setTimeout(() => {
        splashEl.style.display = 'none';
      }, 450);
    };

    // Aos 1.35s inicia o fade-out suave de 0.45s = exatamente 1.80s de duração total
    const splashTimer = setTimeout(dismissSplash, 1350);

    // Toque ou clique opcional para quem quiser avançar instantaneamente
    splashEl.addEventListener('click', () => {
      clearTimeout(splashTimer);
      dismissSplash();
    });
  }

  // 4. TOGGLE TABELA COMPLETA DE PROCEDIMENTOS (BOTÃO PEQUENO)
  const toggleBtn = document.getElementById('toggleMoreServices');
  const proceduresList = document.getElementById('extraProceduresList');
  if (toggleBtn && proceduresList) {
    toggleBtn.addEventListener('click', () => {
      const isExpanded = toggleBtn.getAttribute('aria-expanded') === 'true';
      toggleBtn.setAttribute('aria-expanded', !isExpanded);
      proceduresList.classList.toggle('is-collapsed', isExpanded);
      proceduresList.classList.toggle('is-expanded', !isExpanded);

      const textEl = toggleBtn.querySelector('.btn-toggle-text');
      const arrowEl = toggleBtn.querySelector('.btn-toggle-arrow');
      if (!isExpanded) {
        if (textEl) textEl.textContent = 'Ocultar procedimentos adicionais';
        if (arrowEl) arrowEl.textContent = '▴';
      } else {
        if (textEl) textEl.textContent = 'Ver todos os procedimentos (10)';
        if (arrowEl) arrowEl.textContent = '▾';
      }
    });
  }

  // 5. MOUSE SPOTLIGHT SUAVE NOS CARDS (21stdev / shadcn-ui / emil-design-eng)
  const spotlightElements = document.querySelectorAll(
    '.nia-card, .nia-review-card, .amenity-pill-card, .nia-team-showcase, .nia-location-layout'
  );
  spotlightElements.forEach(el => {
    el.addEventListener('pointermove', e => {
      const rect = el.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const y = e.clientY - rect.top;
      el.style.setProperty('--mouse-x', `${x}px`);
      el.style.setProperty('--mouse-y', `${y}px`);
    });
  });
});
