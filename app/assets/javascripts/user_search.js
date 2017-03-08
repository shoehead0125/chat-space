$(function(){
  var list = $("#user-search-result");
  var preWord;

  function appendList(word){
    var item = $('<li class="list">').append(word);
    list.append(item);
  }

  function editElement(element){
    var result = "%" + element + "%";
    return result;
  }

  $("#chat-member-name").on("keyup",function(){
    var input = $('#chat-member-name').val();
    var inputs = input.split(" ");
    var newInputs = inputs.map(editElement);
    var word = newInputs.join("|");
    $.ajax({
      type: 'GET',
      url: '/users',
      data: {
        search_character: word
      },
      dataType: 'json'
    })
    .done(function(data){
      var users_info = data.search_results.users;
      $(".list").remove();
      if(word != preWord && input.length !== 0){
        $.each(users_info, function(i, user){
          appendList(user.name);
        });
        if($(".list").length === 0){
        appendList("一致するメンバーはいません");
        }
      }
    })
    .fail(function(){
      alert('error');
    });
  });
});

