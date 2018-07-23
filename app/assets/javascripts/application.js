//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require select2
//= require select2-field
//= require jquery.raty
//= require ratyrate
//= require_tree .

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
