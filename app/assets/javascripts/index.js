// $(document).ready(function() {

//     $(".nav-link").click(function(e){
//     e.preventDefault();

//     $.ajax($(this).attr("href")).done(function(resp){
//       $(".post-container").html("")
//       resp.posts.forEach(function(item){
//         $(".post-container").append( render(item.post) );
//       })
//     })
//   })

//     function render(post){
//     return '<article id="'+post.id+'">\
//   <a href="/posts/'+post.id+'/vote" class="fa fa-sort-desc vote-button"></a>\
//   <h2><a href="/posts/'+post.id+'">'+post.title+'</a></h2>\
//   <p>\
//     <span class="points">'+post.points+'</span>\
//     <span class="username">'+post.username+'</span>\
//     <span class="timestamp">'+post.created_at+'</span>\
//     <span class="comment-count">'+post.comment_count+'</span>\
//     <a class="delete" href="/posts/'+post.id+'">delete</a>\
//   </p>\
//   </article>'
// }



// });
