$(document).ready(function() {

  var questionCommentButton = $(".add_question_comment_link");

  questionCommentButton.on("click", function(event) {
    event.preventDefault();
    questionCommentButton.hide();
    $(".add_question_comment").show();

  });

  var answerCommentButton = $(".add_answer_comment_link");

  answerCommentButton.on("click", function(event) {
    event.preventDefault();
    answerCommentButton.hide();
    $(".add_answer_comment").show();

  });
});

