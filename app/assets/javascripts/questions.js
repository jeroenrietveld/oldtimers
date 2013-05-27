jQuery(function() {
  $("#categories_select").select2({
  	width: 'resolve',
  	placeholder: 'Categorie...'
  });

  $("img.favorite").hover(function(){
    $(this).attr('src', '/assets/favorite_hover.png');
  }, function(){
    $(this).attr('src', '/assets/favorite.png');
  });

  /*$(".favorite img").hover(function(){
  	$(this).attr('src', '/assets/favorite_hover.png');
  }, function(){
  	$(this).attr('src', '/assets/favorite.png');
  });

  $(".comment img").hover(function(){
  	$(this).attr('src', '/assets/comment_hover.png');
  }, function(){
  	$(this).attr('src', '/assets/comment.png');
  });*/
});