$(document).on('turbolinks:load', function() {
  //作業部屋の写真投稿 --------------------------------------
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
  //作業部屋の写真投稿/ --------------------------------------

  //アイテム投稿 --------------------------------------
  $('#exampleModalLong').on('hidden.bs.modal', function(e) {
    var $search_result_items = $('.item_select_card').map(function() {
      if ($(this).children("#item_select_check").prop("checked") == true) {
        return $(this);
      }
    });
    //選択したアイテムカードを投稿ページに表示する
    $('.work_room_post__post_items').empty();
    
    $search_result_items.each(function() {
      var append_html = 
          '<div class="work_room_post__item_thumbnail_box">' +
            '<img class="work_room_post__item_remove_btn" src="' + image_path('module/cross_icon.png') + '" width= "40px", height= "40px">' +
            '<div class="work_room_post__item_img_box">' +
              '<img class="work_room_post__item_img" src="' + $(this).find('.item_select_card__img_box > img').attr('src') + '">' +
            '</div>' +
            '<div class="px-2"><span class="work_room_post__item_name">' + $(this).find('.item_select_card__name').html() + '</span></div>' +
            '<div class="px-2"><span class="item_select_card__external_site_name">' + $(this).find('.item_select_card__external_site_name').html() + '</span></div>' +
            '<div class="px-2"><span class="work_room_post__item_price">' + $(this).find('.item_select_card__price_box').html() + '</span></div>' +

            '<input value="' + $(this).find('.item_select_card__item_site').html() + '" type="hidden" name="work_room[creator_items[][item_site_url]]"></input>' +
            '<input value="' + $(this).find('.item_select_card__external_site_name').html() + '" type="hidden" name="work_room[creator_items[][external_site_name]]"></input>' +
            '<input value="' + $(this).find('.item_select_card__item_code').html() + '" type="hidden" name="work_room[creator_items[][item_code]"></input>' +
          '</div>';

      $('.work_room_post__post_items').append(append_html);

      //アイテム削除ボタンのコールバックを設定
      $('.work_room_post__item_remove_btn').click(function() {
        $(this).parent().remove();
      });
    });
  })

  
  

  //アイテム投稿/ --------------------------------------
});