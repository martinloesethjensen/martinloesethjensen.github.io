// Hide header on scroll down, reveal on scroll up
(function () {
  var header = document.querySelector('.site-header');
  if (!header) return;
  var lastScrollY = window.scrollY;
  var headerHeight = header.offsetHeight;

  window.addEventListener('scroll', function () {
    var currentScrollY = window.scrollY;
    if (currentScrollY > lastScrollY && currentScrollY > headerHeight) {
      header.classList.add('header-hidden');
    } else {
      header.classList.remove('header-hidden');
    }
    lastScrollY = currentScrollY;
  }, { passive: true });
})();

document.addEventListener('DOMContentLoaded', function () {
  if (!('IntersectionObserver' in window)) return;
  var io = new IntersectionObserver(
    function (entries) {
      entries.forEach(function (e) {
        if (e.isIntersecting) {
          e.target.classList.add('revealed');
          io.unobserve(e.target);
        }
      });
    },
    { threshold: 0.08, rootMargin: '0px 0px -30px 0px' }
  );
  document.querySelectorAll('.cv-section').forEach(function (el) {
    el.classList.add('will-reveal');
    io.observe(el);
  });
});
