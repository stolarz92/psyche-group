$ ->
  #$(alert('alert'));
  # obsłuzyc klikniecie na button w task
  $('#comment_button').click ->
    content = $('#comment_content').val()
    task_id = $('#task_id').val()
    project_id = $('#project_id').val()
    if !content.trim()
      return
    $.post('/api/task_comments',
      comment:
        content: content,
        task_id: task_id,
    ).success (resp) ->
      console.log(resp)
      div_comment = $('<div>', { class: 'comment'})
      comment_text = "<h4>#{resp.comment.content}</h4> <p>#{resp.user_mail}</p> <p>#{resp.comment.created_at}</p>  "
      div_comment.html(comment_text)
      comments = $('#comments')
      $(div_comment).appendTo(comments)
      $('#comment_content').val('')
    .error (resp) ->
      alert('error')
