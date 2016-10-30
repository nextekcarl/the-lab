$(document).on('turbolinks:load', (function () {
  $('[data-toggle="tooltip"]').tooltip();
  $('.x-noop').on('click', function(event) {
    event.preventDefault();
  });
}));
