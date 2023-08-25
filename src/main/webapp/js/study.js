$('.label.ui.dropdown')
.dropdown();

$('.ui.button').on('click', function () {
  $('.ui.dropdown')
    .dropdown('restore defaults')
})
