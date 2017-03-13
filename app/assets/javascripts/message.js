$(function(){
  function buildHTML(message){
    var html = (`<div class="chat-space__tweet">
                  <p class=tweet--name>${ message.name }</p>
                  <p class=tweet--time>${ message.created_at }</p>
                  <p class=tweet>${ message.body }</p></div>`);
    return html;
  }
  $(window).bind("load", function(){
    if(document.URL.match(/messages/)){
      setInterval(function(){
        var path_name = location.pathname;
        $.ajax({
          type: 'GET',
          url: path_name,
          dataType: 'json'
        })
        .done(function(data){
          $('.chat-space__tweet').remove();
          $.each(data, function(i){
            var html = buildHTML(data[i]);
            $('.right-contents__chat-space').append(html);
          });
        })
        .fail(function(data){
          alert('error');
        });
      }, 3000);
    }
  });


  $('.js-form').on('submit', function(e){
    e.preventDefault();
    e.stopPropagation();
    var path_name = location.pathname;
    var form = $('.js-form').get()[0];
    var formData = new FormData(form);
    $.ajax({
      type: 'POST',
      url: path_name,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
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
  $('#file_input').on("click", function(){
    $('#file_input_origin').click();
  });
});
