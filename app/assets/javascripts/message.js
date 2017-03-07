$(function(){
  function buildHTML(message){
    var tweet_name = (`<p class=tweet--name>${ message.name }`);
    var tweet_time = (`<p class=tweet--time>${ message.created_at }`);
    var tweet      = (`<p class=tweet>${ message.body }`);
    var html = $('<div class="chat-space__tweet">').append(tweet_name, tweet_time, tweet);
    return html;
  }
  $('.js-form').on('submit', function(e){
    e.preventDefault();
    var textField = $('.js-form__text-field');
    var message = textField.val();
    var path_name = location.pathname;
    $.ajax({
      type: 'POST',
      url: path_name,
      data: {
        message: {
          body: message
        }
      },
      dataType: 'json'
    })
    .done(function(data){
      var html = buildHTML(data.message);
      $('.right-contents__chat-space').append(html);
      textField.val('');
    })
    .fail(function(){
      alert('error');
    });
  });
});
