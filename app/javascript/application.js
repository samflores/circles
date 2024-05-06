// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"

window.process = { env: {} };

import "@popperjs/core"
import "bootstrap"

import "controllers"

document.addEventListener("DOMContentLoaded", () => {
  document
    .querySelectorAll('[data-bs-toggle="tooltip"]')
    .forEach(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
});
