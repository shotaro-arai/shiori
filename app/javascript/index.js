$(document).on('scroll', function(){
  
  scrollHeight = $(document).height();
  scrollPosition = $(window).height() + $(window).scrollTop();
  if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) { //画面下5%までスクロールした際に新しくロード

  $('.main-wrapper').jscroll({
    // 無限に追加する要素は、どこに入れる？
    contentSelector: '.post', 
    // 無限に追加する要素は、どこに入れる？
    nextSelector: 'a.next',
    // 読み込み中の表示はどうする？
    loadingHtml: '読み込み中'
  });}
});