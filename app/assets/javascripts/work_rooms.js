$(document).on('turbolinks:load', function() {
  //作業部屋の写真投稿 --------------------------------------
  $('.custom-file-input').on('change', fileSelectHandler);


  // TODO: バリデーションエラー時のリダイレクションで、選んでいる画像をプレビューする
  // if (document.getElementById("customfile") != null) {
  //   filesShowPreview($('#customfile').prop('files'));
  // }


  //ファイル選択のイベントハンドラ
  function fileSelectHandler(evt) {
    $('#preview').remove();// 繰り返し実行時の処理
    $(this).parents('.input-group').after('<div id="preview"></div>');
    var files = evt.target.files;

    filesShowPreview(files)
  }    

  //画像ファイルをプレビュー表示する
  function filesShowPreview(files) {
    for (var i = 0, f; f = files[i]; i++) {
      var reader = new FileReader();
      //ファイルが正常に読み込まれた場合のcallbackを設定
      reader.onload = (function(theFile) {
        return function(e) {
          if (theFile.type.match('image.*')) {
            // 画像のプレビュー表示
            var $html = ['<div class="work_room_post__img-thumbnail-block d-inline-block mr-2 mt-2">',
                        '<img class="work_room_post__img-remove-btn" src="', image_path('module/cross_icon.png') ,'" />',
                        '<img class="work_room_post__img-thumbnail" src="',e.target.result,'" title="', escape(theFile.name), '" /></div>'].join('');
          } else {
            //画像以外はファイル名のみの表示
            var $html = ['<div class="d-inline-block mr-1"><span class="small">', escape(theFile.name),'</span></div>'].join('');
          }
          $('#preview').append($html);

          //ファイルの取消イベントハンドラ設定
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
  //modalページで選択した投稿アイテムを投稿ページに表示する
  $('#exampleModalLong').on('hidden.bs.modal', function(e) {
    var $search_result_items = $('.item_select_card').map(function() {
      if ($(this).find(".item_select_check").prop("checked") == true) {
        return $(this);
      }
    });
    //選択したアイテムカードを投稿ページに表示する
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

            '<input value="' + $(this).find('.item_select_card__search_word').html() + '" type="hidden" name="work_room[creator_items_attributes[][search_word]]"></input>' +
            '<input value="' + $(this).find('.item_select_card__item_site').html() + '" type="hidden" name="work_room[creator_items_attributes[][item_url]]"></input>' +
            '<input value="' + $(this).find('.item_select_card__external_site_name').html() + '" type="hidden" name="work_room[creator_items_attributes[][external_site_name]]"></input>' +
            '<input value="' + $(this).find('.item_select_card__item_code').html() + '" type="hidden" name="work_room[creator_items_attributes[][item_code]"></input>' +
          '</div>';

      $('.work_room_post__post_items').append(append_html);
      //アイテム検索画面の情報をクリアする
      $('#search_word').val('');
      $('.work_room_post__search_result').empty();

      //アイテム削除ボタンのコールバックを設定
      $('.work_room_post__item_remove_btn').click(function() {
        $(this).parent().remove();
      });
    });
  })
  //アイテム投稿/ --------------------------------------

  //投稿画像のプレビュー表示 --------------------------------------
  // オプションを指定してSkipprの実行
  $("#theTarget").skippr({
    // スライドショーの変化 ("fade" or "slide")
    transition : 'slide',
    // 変化に係る時間(ミリ秒)
    speed : 500,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形("block" or "bubble")
    navType : 'block',
    // 子要素の種類("div" or "img")
    childrenElementType : 'img',
    // ナビゲーション矢印の表示(trueで表示)
    arrows : true,
    // スライドショーの自動再生(falseで自動再生なし)
    autoPlay : false,
    // 自動再生時のスライド切替間隔(ミリ秒)
    autoPlayDuration : 1000,
    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
    keyboardOnAlways : true,
    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
    hidePrevious : false
  });

  //投稿画像のプレビュー表示/ --------------------------------------
});