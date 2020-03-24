$(document).on('turbolinks:load', function() {
  //プロフィール画像投稿時のプレビュー表示 --------------------------------------
  function readURL(input) {
    if(input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('.user_edit__img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('#user_edit__profile_image').change(function() {
    readURL(this);
  })
  //プロフィール画像投稿時のプレビュー表示/ --------------------------------------
  
});