//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require select2
//= require jquery.raty
//= require ratyrate
//= require_tree .

$(document).ready(function() {

  $('.select2').select2({
   tags: true,
   tokenSeparators: [","]
  });

});

$(document).ready(function () {
    let img_preview = $('.upload-preview img');

    $('.file-img').change(function (event) {

        let input = $(event.currentTarget);
        let file = input[0].files[0];
        let reader = new FileReader();
        reader.onload = function (e) {
            image_base64 = e.target.result;
            img_preview.attr("src", image_base64);
        };

        reader.readAsDataURL(file);
    });
});
