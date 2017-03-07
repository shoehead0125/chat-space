$(function(){
  function buildHTML(message){
    var html = (`<div class="chat-space__tweet">
                  <p class=tweet--name>${ message.name }</p>
                  <p class=tweet--time>${ message.created_at }</p>
                  <p class=tweet>${ message.body }</p></div>`);
    return html;
  }
  $('.js-form').on('submit', function(e){
    e.preventDefault();
    e.stopPropagation();
    var textField = $('.js-form__text-field');
    var message = textField.val();
    debugger;
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
