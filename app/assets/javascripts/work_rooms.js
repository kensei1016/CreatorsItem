$(document).on('turbolinks:load', function() {
  $('.custom-file-input').on('change', handleFileSelect);

  //ファイル選択されると実行
  function handleFileSelect(evt) {
    $('#preview').remove();// 繰り返し実行時の処理
    $(this).parents('.input-group').after('<div id="preview"></div>');
    var files = evt.target.files;
    for (var i = 0, f; f = files[i]; i++) {
      var reader = new FileReader();
      //ファイルが正常に読み込まれた場合のcallbackを設定
      reader.onload = (function(theFile) {
        return function(e) {
          if (theFile.type.match('image.*')) {
            // 画像では画像のプレビューとファイル名の表示
            var $html = ['<div class="work_room_post__img-thumbnail-block d-inline-block mr-2 mt-2">',
                        '<img class="work_room_post__img-remove-btn" src="', image_path('module/cross_icon.png') ,'" />',
                        '<img class="work_room_post__img-thumbnail" src="',e.target.result,'" title="', escape(theFile.name), '" /></div>'].join('');
          } else {
            //画像以外はファイル名のみの表示
            var $html = ['<div class="d-inline-block mr-1"><span class="small">', escape(theFile.name),'</span></div>'].join('');
          }
          $('#preview').append($html);

          //ファイルの取消
          $('.work_room_post__img-remove-btn').click(function(){
            $('#preview').remove();
            $('.custom-file-input').val('');
          })
        };
      })(f);

      reader.readAsDataURL(f);
    }

    
  }
});