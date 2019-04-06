$(document).on('turbolinks:load', function () {
  $('time').each(function(){
    // 現在日時
    var current = new Date();
    // 14日（2週間）前のミリ秒
    var range_ms = current.getTime() - (1 * 24 * 60 * 60 * 1000);

    // 更新日時
    var modified = new Date($(this).attr('datetime'));
    // 更新日時のミリ秒
    var modified_ms = modified.getTime();

    if (range_ms < modified_ms){
      $(this).append('<span>NEW!</span>');
    }
  });
});
