$(function(){
  var list = $("#user-search-result");
  var preWord;

  function appendList_search(user){
    var str = ('<li class="list" name=' + user.name + ' id=list-' + user.id + '>' + user.name
               + '<a class="add_user" id=' + user.id + '>追加</a></li>').toString();
    var item = $(str);
    list.append(item);
  }

  function appendList_result(name, input){
    var item = $('<li class="chat-group-user__name">' + name
               + '<a class="delete_user" id=' + input + '>削除</a></li>');
    debugger;
    $(".chat-group-user").append(item);
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
          appendList_search(user);
        });
        if($(".list").length === 0){
        $(list).append("一致するメンバーはいません");
        }
      }
    })
    .fail(function(){
      alert('error');
    });
  });
  $(document).on("click",function(e){
    if( $(e.target).closest('.add_user').length ){
      var target = e.target;
      var parent = $(target).parent();
      var input = $(target).attr("id");
      var name = $(parent).attr("name");
      debugger;

      $(parent).remove();
      appendList_result(name, input);
      $('#group_user_ids_' + input).prop("checked", true);
    }
  });
  $(document).on("click",function(e){
    if( $(e.target).closest('.delete_user').length ){
      var target = e.target;
      var parent = $(target).parent();
      var input = $(target).attr("id");

      $(parent).remove();
      $('#group_user_ids_' + input).prop("checked", false);
    }
  });
});

