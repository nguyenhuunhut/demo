$(document).ready(function(){
  $('.list-user').on('click', '.delete-user', function(event){
    var self = $(this);
    $.ajax({
      url: "/admin/users/"+self.attr("data-target"),
      type: "delete",
      success: function(res){
        console.log(res);
        if(res.success){
        $('.alert-success').remove();
        self.parents('.box-user').remove();
        $('.message').prepend(' \
        <div class="alert alert-success"> \
        Delete success! \
        </div> \
        ');
      }

    }
  });
});

  $('.list-course').on('click','.delete-course', function(event){
    var self = $(this);
    $.ajax({
      url: self.attr("data-target"),
      type: "delete",
      success: function(res){
        console.log(res);
        if(res.success){
          $('.alert-success').remove();
          self.parents('.box-course').remove();
          $('.message').prepend(' \
          <div class="alert alert-success"> \
          Delete success! \
          </div> \
          ');
        }
      }
    });
  });

  $('.list-classroom').on('click', '.delete-classroom', function(event){
    var self = $(this);
    $.ajax({
      url: self.attr("data-target"),
      type: "delete",
      success: function(res){
        if(res.success){
          $('.alert-success').remove();
          self.parents('.box-classroom').remove();
          $('.message').prepend(' \
          <div class="alert alert-success"> \
          Delete success! \
          </div> \
          ');

        }
      }
    });
  });


  $('.list-classroom').on('click', '.register-classroom', function(event){
    var self = $(this);
    $.ajax({
      url: self.attr("data-target"),
      type: "post",
      success: function(res){
        if(res.success == true){
        $('.alert-success').remove();
        self.parents('.box-classroom').find('.view-registers').html(res.data.registers);
        if(res.data.is_register == false)
          self.html("Register");
        else
          self.html("Cancel register");
      }

    else {
      $('.alert-success').remove();
      $('.message').prepend(' \
      <div class="alert alert-success"> \
      Classroom full or Date register > date start! \
      </div> \
      ');
    }

    }
  });
});


  $('.list-user').on('click', '.pay-fee', function(event){
    event.preventDefault();
    var self = $(this);
    $.ajax({
      url: self.attr("data-target"),
      type: "post",
      success: function(res){
        if(res.data.is_pay == false)
          self.html("Own");
        else
          self.html("Complete");
      }
});
});

$('.list-user').on('click', '.remove-user', function(event){
  var self = $(this);
  $.ajax({
    url: self.attr("data-target"),
    type: "get",
    success: function(res){
      if(res.success){
        $('.alert-success').remove();
        self.parents('.box-user').remove();
        $('.message').prepend(' \
        <div class="alert alert-success"> \
        Remove success! \
        </div> \
        ');

      }

    }
});
});

$('.list-notication').on('click', '.delete-notication', function(event){
  var self = $(this);
  $.ajax({
    url: self.attr("data-target"),
    type: "get",
    success: function(res){
      if(res.success){
        console.log();
        self.parents('.box-notication').remove();
     }
   }

});
});

setTimeout(function(){
  $('.success').remove();
  $('.error').remove();
  $('.message').remove();
 }, 5000);

 $('.search').on('click', '#search-course', function(event){
   event.preventDefault();
   var self = $(this);
   $.ajax({
     url: "/courses/search",
     type: "post",
     data: {
       "teacher_name": $('#search_teacher_name').val(),
       "level": $('#search_level').val()
     },
     success: function(res){
       if(res.success){
         console.log();
         $('.alert-success').remove();
         $('.kq').prepend('<div class="col-md-2 alert alert-success display">'+res.data.id+'</div> ');
        //  $('.kq').prepend('<div class="col-md-4 alert alert-success display"> <table>'+
        //  for(i=0, i=res.data.id.count(), i++){
        //    '<tr>'+res.data.id[i]+'</tr>'
        //  }
        //  ' </table></div> ');
      }
    }

 });
 });


});
